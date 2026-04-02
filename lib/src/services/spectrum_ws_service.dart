import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import '../network/api_service.dart';

enum SpectrumWsStatus {
  disconnected,
  connecting,
  connected,
}

class SpectrumWsService {
  static final SpectrumWsService _instance = SpectrumWsService._internal();

  factory SpectrumWsService() => _instance;

  SpectrumWsService._internal();

  WebSocket? _ws;
  Timer? _heartbeatTimer;
  Timer? _reconnectTimer;
  int _reconnectAttempts = 0;
  bool _shouldReconnect = false;

  SpectrumWsStatus _status = SpectrumWsStatus.disconnected;

  SpectrumWsStatus get status => _status;

  /// 下行事件流
  final _eventController = StreamController<Map<String, dynamic>>.broadcast();

  Stream<Map<String, dynamic>> get eventStream => _eventController.stream;

  /// 连接状态变化流
  final _statusController = StreamController<SpectrumWsStatus>.broadcast();

  Stream<SpectrumWsStatus> get statusStream => _statusController.stream;

  /// 初始订阅 key（从 getIdentityInfos 获取）
  String? _broadcastKey;

  void _setStatus(SpectrumWsStatus newStatus) {
    _status = newStatus;
    _statusController.add(newStatus);
  }

  /// 建立连接
  Future<void> connect() async {
    if (_status == SpectrumWsStatus.connecting ||
        _status == SpectrumWsStatus.connected) {
      return;
    }

    _shouldReconnect = true;
    _setStatus(SpectrumWsStatus.connecting);

    try {
      // 获取 token
      final authResult = await RsiApiClient().getIdentityInfos();
      if (authResult == null || authResult.data?.spectrumToken == null) {
        print('SpectrumWS: Failed to get spectrum token');
        _setStatus(SpectrumWsStatus.disconnected);
        _scheduleReconnect();
        return;
      }

      final token = authResult.data!.spectrumToken!;
      _broadcastKey = authResult.data!.subscriptionsKeys?.broadcast;

      // 建立 WebSocket 连接
      final wsUrl =
          'wss://robertsspaceindustries.com/ws/spectrum?token=$token';
      _ws = await WebSocket.connect(wsUrl, headers: RsiApiClient().getHeaders());

      _setStatus(SpectrumWsStatus.connected);
      _reconnectAttempts = 0;

      // 启动心跳
      _startHeartbeat();

      // 自动订阅 broadcast
      if (_broadcastKey != null) {
        subscribe([_broadcastKey!]);
      }

      // 监听消息
      _ws!.listen(
        _onMessage,
        onDone: _onDone,
        onError: _onError,
        cancelOnError: false,
      );
    } catch (e) {
      print('SpectrumWS: Connection error: $e');
      _setStatus(SpectrumWsStatus.disconnected);
      _scheduleReconnect();
    }
  }

  /// 断开连接
  Future<void> disconnect() async {
    _shouldReconnect = false;
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    _stopHeartbeat();

    if (_ws != null) {
      await _ws!.close();
      _ws = null;
    }

    _setStatus(SpectrumWsStatus.disconnected);
  }

  /// 发送订阅
  void subscribe(List<String> keys, {String scope = 'content'}) {
    _send({
      'type': 'subscribe',
      'subscription_keys': keys,
      'subscription_scope': scope,
    });
  }

  /// 发送取消订阅
  void unsubscribe(List<String> keys, {String scope = 'content'}) {
    _send({
      'type': 'unsubscribe',
      'subscription_keys': keys,
      'subscription_scope': scope,
    });
  }

  /// 发送 JSON 消息（公开）
  void sendJson(Map<String, dynamic> data) => _send(data);

  /// 发送 JSON 消息
  void _send(Map<String, dynamic> data) {
    if (_ws != null && _status == SpectrumWsStatus.connected) {
      _ws!.add(jsonEncode(data));
    }
  }

  /// 发送原始文本
  void _sendRaw(String data) {
    if (_ws != null && _status == SpectrumWsStatus.connected) {
      _ws!.add(data);
    }
  }

  // ---- 心跳 ----

  void _startHeartbeat() {
    _stopHeartbeat();
    _heartbeatTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      _sendRaw('8');
    });
  }

  void _stopHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = null;
  }

  // ---- 消息处理 ----

  void _onMessage(dynamic rawData) {
    if (rawData is! String) return;

    // 忽略心跳响应
    final trimmed = rawData.trim();
    if (trimmed == '1' || trimmed.isEmpty) return;
    try {
      final json = jsonDecode(trimmed) as Map<String, dynamic>;
      _eventController.add(json);
    } catch (e) {
      print('SpectrumWS: Failed to parse message: $e');
  }
}

  void _onDone() {
    print('SpectrumWS: Connection closed');
    _ws = null;
    _stopHeartbeat();
    _setStatus(SpectrumWsStatus.disconnected);
    _scheduleReconnect();
  }

  void _onError(dynamic error) {
    print('SpectrumWS: Error: $error');
  }

  // ---- 重连 ----

  void _scheduleReconnect() {
    if (!_shouldReconnect) return;

    _reconnectTimer?.cancel();
    final delay = min(30, pow(2, _reconnectAttempts)).toInt();
    _reconnectAttempts++;

    print('SpectrumWS: Reconnecting in ${delay}s (attempt $_reconnectAttempts)');
    _reconnectTimer = Timer(Duration(seconds: delay), () {
      connect();
    });
  }

  /// 释放资源
  void dispose() {
    disconnect();
    _eventController.close();
    _statusController.close();
  }
}
