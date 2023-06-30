// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_status_history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LeaveStatusHistoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveStatusHistoryEventCopyWith<$Res> {
  factory $LeaveStatusHistoryEventCopyWith(LeaveStatusHistoryEvent value,
          $Res Function(LeaveStatusHistoryEvent) then) =
      _$LeaveStatusHistoryEventCopyWithImpl<$Res, LeaveStatusHistoryEvent>;
}

/// @nodoc
class _$LeaveStatusHistoryEventCopyWithImpl<$Res,
        $Val extends LeaveStatusHistoryEvent>
    implements $LeaveStatusHistoryEventCopyWith<$Res> {
  _$LeaveStatusHistoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedCopyWith<$Res> {
  factory _$$StartedCopyWith(_$Started value, $Res Function(_$Started) then) =
      __$$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedCopyWithImpl<$Res>
    extends _$LeaveStatusHistoryEventCopyWithImpl<$Res, _$Started>
    implements _$$StartedCopyWith<$Res> {
  __$$StartedCopyWithImpl(_$Started _value, $Res Function(_$Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Started implements Started {
  const _$Started();

  @override
  String toString() {
    return 'LeaveStatusHistoryEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class Started implements LeaveStatusHistoryEvent {
  const factory Started() = _$Started;
}

/// @nodoc
mixin _$LeaveStatusHistoryState {
  bool get isLoading => throw _privateConstructorUsedError;
  LeaveStatusHistoryModel? get lshModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LeaveStatusHistoryStateCopyWith<LeaveStatusHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveStatusHistoryStateCopyWith<$Res> {
  factory $LeaveStatusHistoryStateCopyWith(LeaveStatusHistoryState value,
          $Res Function(LeaveStatusHistoryState) then) =
      _$LeaveStatusHistoryStateCopyWithImpl<$Res, LeaveStatusHistoryState>;
  @useResult
  $Res call({bool isLoading, LeaveStatusHistoryModel? lshModel});
}

/// @nodoc
class _$LeaveStatusHistoryStateCopyWithImpl<$Res,
        $Val extends LeaveStatusHistoryState>
    implements $LeaveStatusHistoryStateCopyWith<$Res> {
  _$LeaveStatusHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? lshModel = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      lshModel: freezed == lshModel
          ? _value.lshModel
          : lshModel // ignore: cast_nullable_to_non_nullable
              as LeaveStatusHistoryModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $LeaveStatusHistoryStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, LeaveStatusHistoryModel? lshModel});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$LeaveStatusHistoryStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? lshModel = freezed,
  }) {
    return _then(_$_Initial(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      lshModel: freezed == lshModel
          ? _value.lshModel
          : lshModel // ignore: cast_nullable_to_non_nullable
              as LeaveStatusHistoryModel?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.isLoading, this.lshModel});

  @override
  final bool isLoading;
  @override
  final LeaveStatusHistoryModel? lshModel;

  @override
  String toString() {
    return 'LeaveStatusHistoryState(isLoading: $isLoading, lshModel: $lshModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.lshModel, lshModel) ||
                other.lshModel == lshModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, lshModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements LeaveStatusHistoryState {
  const factory _Initial(
      {required final bool isLoading,
      final LeaveStatusHistoryModel? lshModel}) = _$_Initial;

  @override
  bool get isLoading;
  @override
  LeaveStatusHistoryModel? get lshModel;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
