// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_stream_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiStreamEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AiStreamEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AiStreamEvent()';
  }
}

/// @nodoc
class $AiStreamEventCopyWith<$Res> {
  $AiStreamEventCopyWith(AiStreamEvent _, $Res Function(AiStreamEvent) __);
}

/// Adds pattern-matching-related methods to [AiStreamEvent].
extension AiStreamEventPatterns on AiStreamEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AiTokenEvent value)? token,
    TResult Function(AiToolRunningEvent value)? toolRunning,
    TResult Function(AiToolRequestEvent value)? toolRequest,
    TResult Function(AiToolResultEvent value)? toolResult,
    TResult Function(AiCardEvent value)? card,
    TResult Function(AiDoneEvent value)? done,
    TResult Function(AiErrorEvent value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AiTokenEvent() when token != null:
        return token(_that);
      case AiToolRunningEvent() when toolRunning != null:
        return toolRunning(_that);
      case AiToolRequestEvent() when toolRequest != null:
        return toolRequest(_that);
      case AiToolResultEvent() when toolResult != null:
        return toolResult(_that);
      case AiCardEvent() when card != null:
        return card(_that);
      case AiDoneEvent() when done != null:
        return done(_that);
      case AiErrorEvent() when error != null:
        return error(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AiTokenEvent value) token,
    required TResult Function(AiToolRunningEvent value) toolRunning,
    required TResult Function(AiToolRequestEvent value) toolRequest,
    required TResult Function(AiToolResultEvent value) toolResult,
    required TResult Function(AiCardEvent value) card,
    required TResult Function(AiDoneEvent value) done,
    required TResult Function(AiErrorEvent value) error,
  }) {
    final _that = this;
    switch (_that) {
      case AiTokenEvent():
        return token(_that);
      case AiToolRunningEvent():
        return toolRunning(_that);
      case AiToolRequestEvent():
        return toolRequest(_that);
      case AiToolResultEvent():
        return toolResult(_that);
      case AiCardEvent():
        return card(_that);
      case AiDoneEvent():
        return done(_that);
      case AiErrorEvent():
        return error(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AiTokenEvent value)? token,
    TResult? Function(AiToolRunningEvent value)? toolRunning,
    TResult? Function(AiToolRequestEvent value)? toolRequest,
    TResult? Function(AiToolResultEvent value)? toolResult,
    TResult? Function(AiCardEvent value)? card,
    TResult? Function(AiDoneEvent value)? done,
    TResult? Function(AiErrorEvent value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case AiTokenEvent() when token != null:
        return token(_that);
      case AiToolRunningEvent() when toolRunning != null:
        return toolRunning(_that);
      case AiToolRequestEvent() when toolRequest != null:
        return toolRequest(_that);
      case AiToolResultEvent() when toolResult != null:
        return toolResult(_that);
      case AiCardEvent() when card != null:
        return card(_that);
      case AiDoneEvent() when done != null:
        return done(_that);
      case AiErrorEvent() when error != null:
        return error(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? token,
    TResult Function(String label)? toolRunning,
    TResult Function(AiMessage assistant, List<AiMessage> inlineMessages)?
        toolRequest,
    TResult Function(AiMessage message)? toolResult,
    TResult Function(Map<String, dynamic> data)? card,
    TResult Function(
            Map<String, dynamic> usage, List<AiMessage> inlineMessages)?
        done,
    TResult Function(String message, bool retryable)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AiTokenEvent() when token != null:
        return token(_that.text);
      case AiToolRunningEvent() when toolRunning != null:
        return toolRunning(_that.label);
      case AiToolRequestEvent() when toolRequest != null:
        return toolRequest(_that.assistant, _that.inlineMessages);
      case AiToolResultEvent() when toolResult != null:
        return toolResult(_that.message);
      case AiCardEvent() when card != null:
        return card(_that.data);
      case AiDoneEvent() when done != null:
        return done(_that.usage, _that.inlineMessages);
      case AiErrorEvent() when error != null:
        return error(_that.message, _that.retryable);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) token,
    required TResult Function(String label) toolRunning,
    required TResult Function(
            AiMessage assistant, List<AiMessage> inlineMessages)
        toolRequest,
    required TResult Function(AiMessage message) toolResult,
    required TResult Function(Map<String, dynamic> data) card,
    required TResult Function(
            Map<String, dynamic> usage, List<AiMessage> inlineMessages)
        done,
    required TResult Function(String message, bool retryable) error,
  }) {
    final _that = this;
    switch (_that) {
      case AiTokenEvent():
        return token(_that.text);
      case AiToolRunningEvent():
        return toolRunning(_that.label);
      case AiToolRequestEvent():
        return toolRequest(_that.assistant, _that.inlineMessages);
      case AiToolResultEvent():
        return toolResult(_that.message);
      case AiCardEvent():
        return card(_that.data);
      case AiDoneEvent():
        return done(_that.usage, _that.inlineMessages);
      case AiErrorEvent():
        return error(_that.message, _that.retryable);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? token,
    TResult? Function(String label)? toolRunning,
    TResult? Function(AiMessage assistant, List<AiMessage> inlineMessages)?
        toolRequest,
    TResult? Function(AiMessage message)? toolResult,
    TResult? Function(Map<String, dynamic> data)? card,
    TResult? Function(
            Map<String, dynamic> usage, List<AiMessage> inlineMessages)?
        done,
    TResult? Function(String message, bool retryable)? error,
  }) {
    final _that = this;
    switch (_that) {
      case AiTokenEvent() when token != null:
        return token(_that.text);
      case AiToolRunningEvent() when toolRunning != null:
        return toolRunning(_that.label);
      case AiToolRequestEvent() when toolRequest != null:
        return toolRequest(_that.assistant, _that.inlineMessages);
      case AiToolResultEvent() when toolResult != null:
        return toolResult(_that.message);
      case AiCardEvent() when card != null:
        return card(_that.data);
      case AiDoneEvent() when done != null:
        return done(_that.usage, _that.inlineMessages);
      case AiErrorEvent() when error != null:
        return error(_that.message, _that.retryable);
      case _:
        return null;
    }
  }
}

/// @nodoc

class AiTokenEvent implements AiStreamEvent {
  const AiTokenEvent(this.text);

  final String text;

  /// Create a copy of AiStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AiTokenEventCopyWith<AiTokenEvent> get copyWith =>
      _$AiTokenEventCopyWithImpl<AiTokenEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AiTokenEvent &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @override
  String toString() {
    return 'AiStreamEvent.token(text: $text)';
  }
}

/// @nodoc
abstract mixin class $AiTokenEventCopyWith<$Res>
    implements $AiStreamEventCopyWith<$Res> {
  factory $AiTokenEventCopyWith(
          AiTokenEvent value, $Res Function(AiTokenEvent) _then) =
      _$AiTokenEventCopyWithImpl;
  @useResult
  $Res call({String text});
}

/// @nodoc
class _$AiTokenEventCopyWithImpl<$Res> implements $AiTokenEventCopyWith<$Res> {
  _$AiTokenEventCopyWithImpl(this._self, this._then);

  final AiTokenEvent _self;
  final $Res Function(AiTokenEvent) _then;

  /// Create a copy of AiStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = null,
  }) {
    return _then(AiTokenEvent(
      null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class AiToolRunningEvent implements AiStreamEvent {
  const AiToolRunningEvent(this.label);

  final String label;

  /// Create a copy of AiStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AiToolRunningEventCopyWith<AiToolRunningEvent> get copyWith =>
      _$AiToolRunningEventCopyWithImpl<AiToolRunningEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AiToolRunningEvent &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label);

  @override
  String toString() {
    return 'AiStreamEvent.toolRunning(label: $label)';
  }
}

/// @nodoc
abstract mixin class $AiToolRunningEventCopyWith<$Res>
    implements $AiStreamEventCopyWith<$Res> {
  factory $AiToolRunningEventCopyWith(
          AiToolRunningEvent value, $Res Function(AiToolRunningEvent) _then) =
      _$AiToolRunningEventCopyWithImpl;
  @useResult
  $Res call({String label});
}

/// @nodoc
class _$AiToolRunningEventCopyWithImpl<$Res>
    implements $AiToolRunningEventCopyWith<$Res> {
  _$AiToolRunningEventCopyWithImpl(this._self, this._then);

  final AiToolRunningEvent _self;
  final $Res Function(AiToolRunningEvent) _then;

  /// Create a copy of AiStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? label = null,
  }) {
    return _then(AiToolRunningEvent(
      null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class AiToolRequestEvent implements AiStreamEvent {
  const AiToolRequestEvent(this.assistant,
      {final List<AiMessage> inlineMessages = const <AiMessage>[]})
      : _inlineMessages = inlineMessages;

  final AiMessage assistant;
  final List<AiMessage> _inlineMessages;
  @JsonKey()
  List<AiMessage> get inlineMessages {
    if (_inlineMessages is EqualUnmodifiableListView) return _inlineMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inlineMessages);
  }

  /// Create a copy of AiStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AiToolRequestEventCopyWith<AiToolRequestEvent> get copyWith =>
      _$AiToolRequestEventCopyWithImpl<AiToolRequestEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AiToolRequestEvent &&
            (identical(other.assistant, assistant) ||
                other.assistant == assistant) &&
            const DeepCollectionEquality()
                .equals(other._inlineMessages, _inlineMessages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, assistant,
      const DeepCollectionEquality().hash(_inlineMessages));

  @override
  String toString() {
    return 'AiStreamEvent.toolRequest(assistant: $assistant, inlineMessages: $inlineMessages)';
  }
}

/// @nodoc
abstract mixin class $AiToolRequestEventCopyWith<$Res>
    implements $AiStreamEventCopyWith<$Res> {
  factory $AiToolRequestEventCopyWith(
          AiToolRequestEvent value, $Res Function(AiToolRequestEvent) _then) =
      _$AiToolRequestEventCopyWithImpl;
  @useResult
  $Res call({AiMessage assistant, List<AiMessage> inlineMessages});

  $AiMessageCopyWith<$Res> get assistant;
}

/// @nodoc
class _$AiToolRequestEventCopyWithImpl<$Res>
    implements $AiToolRequestEventCopyWith<$Res> {
  _$AiToolRequestEventCopyWithImpl(this._self, this._then);

  final AiToolRequestEvent _self;
  final $Res Function(AiToolRequestEvent) _then;

  /// Create a copy of AiStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? assistant = null,
    Object? inlineMessages = null,
  }) {
    return _then(AiToolRequestEvent(
      null == assistant
          ? _self.assistant
          : assistant // ignore: cast_nullable_to_non_nullable
              as AiMessage,
      inlineMessages: null == inlineMessages
          ? _self._inlineMessages
          : inlineMessages // ignore: cast_nullable_to_non_nullable
              as List<AiMessage>,
    ));
  }

  /// Create a copy of AiStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiMessageCopyWith<$Res> get assistant {
    return $AiMessageCopyWith<$Res>(_self.assistant, (value) {
      return _then(_self.copyWith(assistant: value));
    });
  }
}

/// @nodoc

class AiToolResultEvent implements AiStreamEvent {
  const AiToolResultEvent(this.message);

  final AiMessage message;

  /// Create a copy of AiStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AiToolResultEventCopyWith<AiToolResultEvent> get copyWith =>
      _$AiToolResultEventCopyWithImpl<AiToolResultEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AiToolResultEvent &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'AiStreamEvent.toolResult(message: $message)';
  }
}

/// @nodoc
abstract mixin class $AiToolResultEventCopyWith<$Res>
    implements $AiStreamEventCopyWith<$Res> {
  factory $AiToolResultEventCopyWith(
          AiToolResultEvent value, $Res Function(AiToolResultEvent) _then) =
      _$AiToolResultEventCopyWithImpl;
  @useResult
  $Res call({AiMessage message});

  $AiMessageCopyWith<$Res> get message;
}

/// @nodoc
class _$AiToolResultEventCopyWithImpl<$Res>
    implements $AiToolResultEventCopyWith<$Res> {
  _$AiToolResultEventCopyWithImpl(this._self, this._then);

  final AiToolResultEvent _self;
  final $Res Function(AiToolResultEvent) _then;

  /// Create a copy of AiStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(AiToolResultEvent(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as AiMessage,
    ));
  }

  /// Create a copy of AiStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiMessageCopyWith<$Res> get message {
    return $AiMessageCopyWith<$Res>(_self.message, (value) {
      return _then(_self.copyWith(message: value));
    });
  }
}

/// @nodoc

class AiCardEvent implements AiStreamEvent {
  const AiCardEvent(final Map<String, dynamic> data) : _data = data;

  final Map<String, dynamic> _data;
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  /// Create a copy of AiStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AiCardEventCopyWith<AiCardEvent> get copyWith =>
      _$AiCardEventCopyWithImpl<AiCardEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AiCardEvent &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'AiStreamEvent.card(data: $data)';
  }
}

/// @nodoc
abstract mixin class $AiCardEventCopyWith<$Res>
    implements $AiStreamEventCopyWith<$Res> {
  factory $AiCardEventCopyWith(
          AiCardEvent value, $Res Function(AiCardEvent) _then) =
      _$AiCardEventCopyWithImpl;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class _$AiCardEventCopyWithImpl<$Res> implements $AiCardEventCopyWith<$Res> {
  _$AiCardEventCopyWithImpl(this._self, this._then);

  final AiCardEvent _self;
  final $Res Function(AiCardEvent) _then;

  /// Create a copy of AiStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(AiCardEvent(
      null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class AiDoneEvent implements AiStreamEvent {
  const AiDoneEvent(final Map<String, dynamic> usage,
      {final List<AiMessage> inlineMessages = const <AiMessage>[]})
      : _usage = usage,
        _inlineMessages = inlineMessages;

  final Map<String, dynamic> _usage;
  Map<String, dynamic> get usage {
    if (_usage is EqualUnmodifiableMapView) return _usage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_usage);
  }

  final List<AiMessage> _inlineMessages;
  @JsonKey()
  List<AiMessage> get inlineMessages {
    if (_inlineMessages is EqualUnmodifiableListView) return _inlineMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inlineMessages);
  }

  /// Create a copy of AiStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AiDoneEventCopyWith<AiDoneEvent> get copyWith =>
      _$AiDoneEventCopyWithImpl<AiDoneEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AiDoneEvent &&
            const DeepCollectionEquality().equals(other._usage, _usage) &&
            const DeepCollectionEquality()
                .equals(other._inlineMessages, _inlineMessages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_usage),
      const DeepCollectionEquality().hash(_inlineMessages));

  @override
  String toString() {
    return 'AiStreamEvent.done(usage: $usage, inlineMessages: $inlineMessages)';
  }
}

/// @nodoc
abstract mixin class $AiDoneEventCopyWith<$Res>
    implements $AiStreamEventCopyWith<$Res> {
  factory $AiDoneEventCopyWith(
          AiDoneEvent value, $Res Function(AiDoneEvent) _then) =
      _$AiDoneEventCopyWithImpl;
  @useResult
  $Res call({Map<String, dynamic> usage, List<AiMessage> inlineMessages});
}

/// @nodoc
class _$AiDoneEventCopyWithImpl<$Res> implements $AiDoneEventCopyWith<$Res> {
  _$AiDoneEventCopyWithImpl(this._self, this._then);

  final AiDoneEvent _self;
  final $Res Function(AiDoneEvent) _then;

  /// Create a copy of AiStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? usage = null,
    Object? inlineMessages = null,
  }) {
    return _then(AiDoneEvent(
      null == usage
          ? _self._usage
          : usage // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      inlineMessages: null == inlineMessages
          ? _self._inlineMessages
          : inlineMessages // ignore: cast_nullable_to_non_nullable
              as List<AiMessage>,
    ));
  }
}

/// @nodoc

class AiErrorEvent implements AiStreamEvent {
  const AiErrorEvent(this.message, {this.retryable = false});

  final String message;
  @JsonKey()
  final bool retryable;

  /// Create a copy of AiStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AiErrorEventCopyWith<AiErrorEvent> get copyWith =>
      _$AiErrorEventCopyWithImpl<AiErrorEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AiErrorEvent &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.retryable, retryable) ||
                other.retryable == retryable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, retryable);

  @override
  String toString() {
    return 'AiStreamEvent.error(message: $message, retryable: $retryable)';
  }
}

/// @nodoc
abstract mixin class $AiErrorEventCopyWith<$Res>
    implements $AiStreamEventCopyWith<$Res> {
  factory $AiErrorEventCopyWith(
          AiErrorEvent value, $Res Function(AiErrorEvent) _then) =
      _$AiErrorEventCopyWithImpl;
  @useResult
  $Res call({String message, bool retryable});
}

/// @nodoc
class _$AiErrorEventCopyWithImpl<$Res> implements $AiErrorEventCopyWith<$Res> {
  _$AiErrorEventCopyWithImpl(this._self, this._then);

  final AiErrorEvent _self;
  final $Res Function(AiErrorEvent) _then;

  /// Create a copy of AiStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? retryable = null,
  }) {
    return _then(AiErrorEvent(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      retryable: null == retryable
          ? _self.retryable
          : retryable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
