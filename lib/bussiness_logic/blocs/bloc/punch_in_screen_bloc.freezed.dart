// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'punch_in_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PunchInScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getDuty,
    required TResult Function() sendOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getDuty,
    TResult? Function()? sendOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getDuty,
    TResult Function()? sendOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(GetDuty value) getDuty,
    required TResult Function(SendOtp value) sendOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(GetDuty value)? getDuty,
    TResult? Function(SendOtp value)? sendOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(GetDuty value)? getDuty,
    TResult Function(SendOtp value)? sendOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PunchInScreenEventCopyWith<$Res> {
  factory $PunchInScreenEventCopyWith(
          PunchInScreenEvent value, $Res Function(PunchInScreenEvent) then) =
      _$PunchInScreenEventCopyWithImpl<$Res, PunchInScreenEvent>;
}

/// @nodoc
class _$PunchInScreenEventCopyWithImpl<$Res, $Val extends PunchInScreenEvent>
    implements $PunchInScreenEventCopyWith<$Res> {
  _$PunchInScreenEventCopyWithImpl(this._value, this._then);

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
    extends _$PunchInScreenEventCopyWithImpl<$Res, _$Started>
    implements _$$StartedCopyWith<$Res> {
  __$$StartedCopyWithImpl(_$Started _value, $Res Function(_$Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Started implements Started {
  const _$Started();

  @override
  String toString() {
    return 'PunchInScreenEvent.started()';
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
    required TResult Function() getDuty,
    required TResult Function() sendOtp,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getDuty,
    TResult? Function()? sendOtp,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getDuty,
    TResult Function()? sendOtp,
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
    required TResult Function(GetDuty value) getDuty,
    required TResult Function(SendOtp value) sendOtp,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(GetDuty value)? getDuty,
    TResult? Function(SendOtp value)? sendOtp,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(GetDuty value)? getDuty,
    TResult Function(SendOtp value)? sendOtp,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class Started implements PunchInScreenEvent {
  const factory Started() = _$Started;
}

/// @nodoc
abstract class _$$GetDutyCopyWith<$Res> {
  factory _$$GetDutyCopyWith(_$GetDuty value, $Res Function(_$GetDuty) then) =
      __$$GetDutyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetDutyCopyWithImpl<$Res>
    extends _$PunchInScreenEventCopyWithImpl<$Res, _$GetDuty>
    implements _$$GetDutyCopyWith<$Res> {
  __$$GetDutyCopyWithImpl(_$GetDuty _value, $Res Function(_$GetDuty) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetDuty implements GetDuty {
  const _$GetDuty();

  @override
  String toString() {
    return 'PunchInScreenEvent.getDuty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetDuty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getDuty,
    required TResult Function() sendOtp,
  }) {
    return getDuty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getDuty,
    TResult? Function()? sendOtp,
  }) {
    return getDuty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getDuty,
    TResult Function()? sendOtp,
    required TResult orElse(),
  }) {
    if (getDuty != null) {
      return getDuty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(GetDuty value) getDuty,
    required TResult Function(SendOtp value) sendOtp,
  }) {
    return getDuty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(GetDuty value)? getDuty,
    TResult? Function(SendOtp value)? sendOtp,
  }) {
    return getDuty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(GetDuty value)? getDuty,
    TResult Function(SendOtp value)? sendOtp,
    required TResult orElse(),
  }) {
    if (getDuty != null) {
      return getDuty(this);
    }
    return orElse();
  }
}

abstract class GetDuty implements PunchInScreenEvent {
  const factory GetDuty() = _$GetDuty;
}

/// @nodoc
abstract class _$$SendOtpCopyWith<$Res> {
  factory _$$SendOtpCopyWith(_$SendOtp value, $Res Function(_$SendOtp) then) =
      __$$SendOtpCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendOtpCopyWithImpl<$Res>
    extends _$PunchInScreenEventCopyWithImpl<$Res, _$SendOtp>
    implements _$$SendOtpCopyWith<$Res> {
  __$$SendOtpCopyWithImpl(_$SendOtp _value, $Res Function(_$SendOtp) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SendOtp implements SendOtp {
  const _$SendOtp();

  @override
  String toString() {
    return 'PunchInScreenEvent.sendOtp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SendOtp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getDuty,
    required TResult Function() sendOtp,
  }) {
    return sendOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getDuty,
    TResult? Function()? sendOtp,
  }) {
    return sendOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getDuty,
    TResult Function()? sendOtp,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(GetDuty value) getDuty,
    required TResult Function(SendOtp value) sendOtp,
  }) {
    return sendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(GetDuty value)? getDuty,
    TResult? Function(SendOtp value)? sendOtp,
  }) {
    return sendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(GetDuty value)? getDuty,
    TResult Function(SendOtp value)? sendOtp,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(this);
    }
    return orElse();
  }
}

abstract class SendOtp implements PunchInScreenEvent {
  const factory SendOtp() = _$SendOtp;
}

/// @nodoc
mixin _$PunchInScreenState {
  bool get allLoading => throw _privateConstructorUsedError;
  bool get otpSendingLoading => throw _privateConstructorUsedError;
  GetDutyModel? get dutymodel => throw _privateConstructorUsedError;
  bool? get isSend => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PunchInScreenStateCopyWith<PunchInScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PunchInScreenStateCopyWith<$Res> {
  factory $PunchInScreenStateCopyWith(
          PunchInScreenState value, $Res Function(PunchInScreenState) then) =
      _$PunchInScreenStateCopyWithImpl<$Res, PunchInScreenState>;
  @useResult
  $Res call(
      {bool allLoading,
      bool otpSendingLoading,
      GetDutyModel? dutymodel,
      bool? isSend});
}

/// @nodoc
class _$PunchInScreenStateCopyWithImpl<$Res, $Val extends PunchInScreenState>
    implements $PunchInScreenStateCopyWith<$Res> {
  _$PunchInScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allLoading = null,
    Object? otpSendingLoading = null,
    Object? dutymodel = freezed,
    Object? isSend = freezed,
  }) {
    return _then(_value.copyWith(
      allLoading: null == allLoading
          ? _value.allLoading
          : allLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      otpSendingLoading: null == otpSendingLoading
          ? _value.otpSendingLoading
          : otpSendingLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      dutymodel: freezed == dutymodel
          ? _value.dutymodel
          : dutymodel // ignore: cast_nullable_to_non_nullable
              as GetDutyModel?,
      isSend: freezed == isSend
          ? _value.isSend
          : isSend // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $PunchInScreenStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool allLoading,
      bool otpSendingLoading,
      GetDutyModel? dutymodel,
      bool? isSend});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$PunchInScreenStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allLoading = null,
    Object? otpSendingLoading = null,
    Object? dutymodel = freezed,
    Object? isSend = freezed,
  }) {
    return _then(_$_Initial(
      allLoading: null == allLoading
          ? _value.allLoading
          : allLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      otpSendingLoading: null == otpSendingLoading
          ? _value.otpSendingLoading
          : otpSendingLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      dutymodel: freezed == dutymodel
          ? _value.dutymodel
          : dutymodel // ignore: cast_nullable_to_non_nullable
              as GetDutyModel?,
      isSend: freezed == isSend
          ? _value.isSend
          : isSend // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.allLoading,
      required this.otpSendingLoading,
      this.dutymodel,
      this.isSend});

  @override
  final bool allLoading;
  @override
  final bool otpSendingLoading;
  @override
  final GetDutyModel? dutymodel;
  @override
  final bool? isSend;

  @override
  String toString() {
    return 'PunchInScreenState(allLoading: $allLoading, otpSendingLoading: $otpSendingLoading, dutymodel: $dutymodel, isSend: $isSend)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.allLoading, allLoading) ||
                other.allLoading == allLoading) &&
            (identical(other.otpSendingLoading, otpSendingLoading) ||
                other.otpSendingLoading == otpSendingLoading) &&
            (identical(other.dutymodel, dutymodel) ||
                other.dutymodel == dutymodel) &&
            (identical(other.isSend, isSend) || other.isSend == isSend));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, allLoading, otpSendingLoading, dutymodel, isSend);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements PunchInScreenState {
  const factory _Initial(
      {required final bool allLoading,
      required final bool otpSendingLoading,
      final GetDutyModel? dutymodel,
      final bool? isSend}) = _$_Initial;

  @override
  bool get allLoading;
  @override
  bool get otpSendingLoading;
  @override
  GetDutyModel? get dutymodel;
  @override
  bool? get isSend;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
