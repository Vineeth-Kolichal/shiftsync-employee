// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendence_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AttendenceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAttendence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAttendence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAttendence,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAttendence value) getAttendence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAttendence value)? getAttendence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAttendence value)? getAttendence,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendenceEventCopyWith<$Res> {
  factory $AttendenceEventCopyWith(
          AttendenceEvent value, $Res Function(AttendenceEvent) then) =
      _$AttendenceEventCopyWithImpl<$Res, AttendenceEvent>;
}

/// @nodoc
class _$AttendenceEventCopyWithImpl<$Res, $Val extends AttendenceEvent>
    implements $AttendenceEventCopyWith<$Res> {
  _$AttendenceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetAttendenceCopyWith<$Res> {
  factory _$$GetAttendenceCopyWith(
          _$GetAttendence value, $Res Function(_$GetAttendence) then) =
      __$$GetAttendenceCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAttendenceCopyWithImpl<$Res>
    extends _$AttendenceEventCopyWithImpl<$Res, _$GetAttendence>
    implements _$$GetAttendenceCopyWith<$Res> {
  __$$GetAttendenceCopyWithImpl(
      _$GetAttendence _value, $Res Function(_$GetAttendence) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAttendence implements GetAttendence {
  const _$GetAttendence();

  @override
  String toString() {
    return 'AttendenceEvent.getAttendence()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAttendence);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAttendence,
  }) {
    return getAttendence();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAttendence,
  }) {
    return getAttendence?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAttendence,
    required TResult orElse(),
  }) {
    if (getAttendence != null) {
      return getAttendence();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAttendence value) getAttendence,
  }) {
    return getAttendence(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAttendence value)? getAttendence,
  }) {
    return getAttendence?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAttendence value)? getAttendence,
    required TResult orElse(),
  }) {
    if (getAttendence != null) {
      return getAttendence(this);
    }
    return orElse();
  }
}

abstract class GetAttendence implements AttendenceEvent {
  const factory GetAttendence() = _$GetAttendence;
}

/// @nodoc
mixin _$AttendenceState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Attendance> get attendenceList => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttendenceStateCopyWith<AttendenceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendenceStateCopyWith<$Res> {
  factory $AttendenceStateCopyWith(
          AttendenceState value, $Res Function(AttendenceState) then) =
      _$AttendenceStateCopyWithImpl<$Res, AttendenceState>;
  @useResult
  $Res call({bool isLoading, List<Attendance> attendenceList, bool hasError});
}

/// @nodoc
class _$AttendenceStateCopyWithImpl<$Res, $Val extends AttendenceState>
    implements $AttendenceStateCopyWith<$Res> {
  _$AttendenceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? attendenceList = null,
    Object? hasError = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      attendenceList: null == attendenceList
          ? _value.attendenceList
          : attendenceList // ignore: cast_nullable_to_non_nullable
              as List<Attendance>,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $AttendenceStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<Attendance> attendenceList, bool hasError});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$AttendenceStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? attendenceList = null,
    Object? hasError = null,
  }) {
    return _then(_$_Initial(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      attendenceList: null == attendenceList
          ? _value._attendenceList
          : attendenceList // ignore: cast_nullable_to_non_nullable
              as List<Attendance>,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.isLoading,
      required final List<Attendance> attendenceList,
      required this.hasError})
      : _attendenceList = attendenceList;

  @override
  final bool isLoading;
  final List<Attendance> _attendenceList;
  @override
  List<Attendance> get attendenceList {
    if (_attendenceList is EqualUnmodifiableListView) return _attendenceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attendenceList);
  }

  @override
  final bool hasError;

  @override
  String toString() {
    return 'AttendenceState(isLoading: $isLoading, attendenceList: $attendenceList, hasError: $hasError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._attendenceList, _attendenceList) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_attendenceList), hasError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements AttendenceState {
  const factory _Initial(
      {required final bool isLoading,
      required final List<Attendance> attendenceList,
      required final bool hasError}) = _$_Initial;

  @override
  bool get isLoading;
  @override
  List<Attendance> get attendenceList;
  @override
  bool get hasError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
