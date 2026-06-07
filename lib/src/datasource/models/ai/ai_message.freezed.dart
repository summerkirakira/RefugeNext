// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiMessage {
  String get role; // user | assistant | tool
  Object? get content;
  List<ToolCall>? get toolCalls; // -> tool_calls
  String? get toolCallId; // -> tool_call_id
  String? get providerState;

  /// Create a copy of AiMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AiMessageCopyWith<AiMessage> get copyWith =>
      _$AiMessageCopyWithImpl<AiMessage>(this as AiMessage, _$identity);

  /// Serializes this AiMessage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AiMessage &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.toolCalls, toolCalls) &&
            (identical(other.toolCallId, toolCallId) ||
                other.toolCallId == toolCallId) &&
            (identical(other.providerState, providerState) ||
                other.providerState == providerState));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      role,
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(toolCalls),
      toolCallId,
      providerState);

  @override
  String toString() {
    return 'AiMessage(role: $role, content: $content, toolCalls: $toolCalls, toolCallId: $toolCallId, providerState: $providerState)';
  }
}

/// @nodoc
abstract mixin class $AiMessageCopyWith<$Res> {
  factory $AiMessageCopyWith(AiMessage value, $Res Function(AiMessage) _then) =
      _$AiMessageCopyWithImpl;
  @useResult
  $Res call(
      {String role,
      Object? content,
      List<ToolCall>? toolCalls,
      String? toolCallId,
      String? providerState});
}

/// @nodoc
class _$AiMessageCopyWithImpl<$Res> implements $AiMessageCopyWith<$Res> {
  _$AiMessageCopyWithImpl(this._self, this._then);

  final AiMessage _self;
  final $Res Function(AiMessage) _then;

  /// Create a copy of AiMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = freezed,
    Object? toolCalls = freezed,
    Object? toolCallId = freezed,
    Object? providerState = freezed,
  }) {
    return _then(_self.copyWith(
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content ? _self.content : content,
      toolCalls: freezed == toolCalls
          ? _self.toolCalls
          : toolCalls // ignore: cast_nullable_to_non_nullable
              as List<ToolCall>?,
      toolCallId: freezed == toolCallId
          ? _self.toolCallId
          : toolCallId // ignore: cast_nullable_to_non_nullable
              as String?,
      providerState: freezed == providerState
          ? _self.providerState
          : providerState // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AiMessage].
extension AiMessagePatterns on AiMessage {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AiMessage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AiMessage() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_AiMessage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiMessage():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AiMessage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiMessage() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String role, Object? content, List<ToolCall>? toolCalls,
            String? toolCallId, String? providerState)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AiMessage() when $default != null:
        return $default(_that.role, _that.content, _that.toolCalls,
            _that.toolCallId, _that.providerState);
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
  TResult when<TResult extends Object?>(
    TResult Function(String role, Object? content, List<ToolCall>? toolCalls,
            String? toolCallId, String? providerState)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiMessage():
        return $default(_that.role, _that.content, _that.toolCalls,
            _that.toolCallId, _that.providerState);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String role, Object? content, List<ToolCall>? toolCalls,
            String? toolCallId, String? providerState)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AiMessage() when $default != null:
        return $default(_that.role, _that.content, _that.toolCalls,
            _that.toolCallId, _that.providerState);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _AiMessage implements AiMessage {
  const _AiMessage(
      {required this.role,
      this.content,
      final List<ToolCall>? toolCalls,
      this.toolCallId,
      this.providerState})
      : _toolCalls = toolCalls;
  factory _AiMessage.fromJson(Map<String, dynamic> json) =>
      _$AiMessageFromJson(json);

  @override
  final String role;
// user | assistant | tool
  @override
  final Object? content;
  final List<ToolCall>? _toolCalls;
  @override
  List<ToolCall>? get toolCalls {
    final value = _toolCalls;
    if (value == null) return null;
    if (_toolCalls is EqualUnmodifiableListView) return _toolCalls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// -> tool_calls
  @override
  final String? toolCallId;
// -> tool_call_id
  @override
  final String? providerState;

  /// Create a copy of AiMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AiMessageCopyWith<_AiMessage> get copyWith =>
      __$AiMessageCopyWithImpl<_AiMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AiMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AiMessage &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality()
                .equals(other._toolCalls, _toolCalls) &&
            (identical(other.toolCallId, toolCallId) ||
                other.toolCallId == toolCallId) &&
            (identical(other.providerState, providerState) ||
                other.providerState == providerState));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      role,
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(_toolCalls),
      toolCallId,
      providerState);

  @override
  String toString() {
    return 'AiMessage(role: $role, content: $content, toolCalls: $toolCalls, toolCallId: $toolCallId, providerState: $providerState)';
  }
}

/// @nodoc
abstract mixin class _$AiMessageCopyWith<$Res>
    implements $AiMessageCopyWith<$Res> {
  factory _$AiMessageCopyWith(
          _AiMessage value, $Res Function(_AiMessage) _then) =
      __$AiMessageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String role,
      Object? content,
      List<ToolCall>? toolCalls,
      String? toolCallId,
      String? providerState});
}

/// @nodoc
class __$AiMessageCopyWithImpl<$Res> implements _$AiMessageCopyWith<$Res> {
  __$AiMessageCopyWithImpl(this._self, this._then);

  final _AiMessage _self;
  final $Res Function(_AiMessage) _then;

  /// Create a copy of AiMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? role = null,
    Object? content = freezed,
    Object? toolCalls = freezed,
    Object? toolCallId = freezed,
    Object? providerState = freezed,
  }) {
    return _then(_AiMessage(
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content ? _self.content : content,
      toolCalls: freezed == toolCalls
          ? _self._toolCalls
          : toolCalls // ignore: cast_nullable_to_non_nullable
              as List<ToolCall>?,
      toolCallId: freezed == toolCallId
          ? _self.toolCallId
          : toolCallId // ignore: cast_nullable_to_non_nullable
              as String?,
      providerState: freezed == providerState
          ? _self.providerState
          : providerState // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
