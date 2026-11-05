import 'package:flutter/material.dart';

/// 悬停和点击效果的统一圆角，统一调整只需改这里。
const BorderRadius hoverBorderRadius = BorderRadius.all(Radius.circular(12));

/// 圆形控件（头像、色块等）使用的圆角。
const BorderRadius hoverCircleBorderRadius =
    BorderRadius.all(Radius.circular(1000));

/// [Card] 的默认外边距，让效果贴合卡片而不是画到卡片之间的间隙里。
const EdgeInsets hoverCardMargin = EdgeInsets.all(4);

/// 悬停、波纹颜色的不透明度和悬停渐变时长，取值与侧栏 [NavigationRail] 一致。
const double _hoverColorOpacity = 0.04;
const double _splashColorOpacity = 0.12;
const double _focusColorOpacity = 0.12;
const Duration _hoverDuration = Duration(milliseconds: 50);

/// 带鼠标悬停、点击波纹和键盘操作的 [GestureDetector]，
/// 用于自绘的卡片、图标和文字按钮。
///
/// 效果与侧栏导航项相同，但绘制在子控件上方，不会被不透明的子控件遮挡；
/// 绘制层不接收点击，子控件内部的按钮仍可正常使用。
/// 触屏设备没有悬停事件，只显示波纹。
/// [onTap] 为 null 时视为禁用，不显示任何效果，也不参与键盘焦点切换。
class HoverGestureDetector extends StatefulWidget {
  const HoverGestureDetector({
    super.key,
    this.onTap,
    this.borderRadius = hoverBorderRadius,
    this.overlayMargin = EdgeInsets.zero,
    required this.child,
  });

  final GestureTapCallback? onTap;

  /// 悬停层和波纹的圆角。
  final BorderRadius borderRadius;

  /// 悬停层和波纹相对子控件的内缩距离，子控件自带外边距时使用。
  final EdgeInsets overlayMargin;

  final Widget child;

  @override
  State<HoverGestureDetector> createState() => _HoverGestureDetectorState();
}

class _HoverGestureDetectorState extends State<HoverGestureDetector> {
  bool _hovering = false;
  bool _focused = false;
  BuildContext? _inkContext;
  InteractiveInkFeature? _currentSplash;
  final Set<InteractiveInkFeature> _splashes = {};

  void _handleTapDown(TapDownDetails details) {
    final inkContext = _inkContext;
    if (inkContext == null) return;

    final box = inkContext.findRenderObject()! as RenderBox;
    late final InteractiveInkFeature splash;
    splash = Theme.of(context).splashFactory.create(
          controller: Material.of(inkContext),
          referenceBox: box,
          position: box.globalToLocal(details.globalPosition),
          color: Theme.of(context)
              .colorScheme
              .primary
              .withValues(alpha: _splashColorOpacity),
          containedInkWell: true,
          rectCallback: () => Offset.zero & box.size,
          borderRadius: widget.borderRadius,
          textDirection: Directionality.of(context),
          onRemoved: () {
            _splashes.remove(splash);
            if (identical(_currentSplash, splash)) _currentSplash = null;
          },
        );
    _splashes.add(splash);
    _currentSplash = splash;
  }

  void _handleTap() {
    _currentSplash?.confirm();
    _currentSplash = null;
    widget.onTap?.call();
  }

  void _handleTapCancel() {
    _currentSplash?.cancel();
    _currentSplash = null;
  }

  double _overlayOpacity(bool enabled) {
    if (!enabled) return 0;
    if (_focused) return _focusColorOpacity;
    return _hovering ? _hoverColorOpacity : 0;
  }

  @override
  void didUpdateWidget(HoverGestureDetector oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 按下期间变为禁用时收不到 onTapCancel，这里主动取消波纹。
    if (oldWidget.onTap != null && widget.onTap == null) {
      _handleTapCancel();
    }
  }

  @override
  void deactivate() {
    // 必须早于内部 Material 销毁时清理波纹，做法与 InkWell 相同。
    for (final splash in _splashes.toList()) {
      splash.dispose();
    }
    _currentSplash = null;
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onTap != null;
    final primary = Theme.of(context).colorScheme.primary;
    final margin = widget.overlayMargin;

    return Actions(
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) {
            _handleTap();
            return null;
          },
        ),
      },
      child: Focus(
        canRequestFocus: enabled,
        skipTraversal: !enabled,
        onFocusChange: (focused) => setState(() => _focused = focused),
        child: MouseRegion(
          // 不拦截点击，透明区域的命中行为与 GestureDetector 保持一致。
          opaque: false,
          onEnter: (_) => setState(() => _hovering = true),
          onExit: (_) => setState(() => _hovering = false),
          child: GestureDetector(
            onTapDown: enabled ? _handleTapDown : null,
            onTap: enabled ? _handleTap : null,
            onTapCancel: enabled ? _handleTapCancel : null,
            child: Stack(
              // 让子控件沿用外部约束，布局与不加悬停效果时相同。
              fit: StackFit.passthrough,
              children: [
                widget.child,
                Positioned.fill(
                  left: margin.left,
                  top: margin.top,
                  right: margin.right,
                  bottom: margin.bottom,
                  child: IgnorePointer(
                    child: Material(
                      type: MaterialType.transparency,
                      child: Builder(
                        builder: (inkContext) {
                          _inkContext = inkContext;
                          return AnimatedContainer(
                            duration: _hoverDuration,
                            decoration: BoxDecoration(
                              borderRadius: widget.borderRadius,
                              color: primary.withValues(
                                alpha: _overlayOpacity(enabled),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
