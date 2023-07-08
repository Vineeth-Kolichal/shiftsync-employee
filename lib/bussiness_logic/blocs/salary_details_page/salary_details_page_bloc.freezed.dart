// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salary_details_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SalaryDetailsPageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetDetails value) getDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetDetails value)? getDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetDetails value)? getDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryDetailsPageEventCopyWith<$Res> {
  factory $SalaryDetailsPageEventCopyWith(SalaryDetailsPageEvent value,
          $Res Function(SalaryDetailsPageEvent) then) =
      _$SalaryDetailsPageEventCopyWithImpl<$Res, SalaryDetailsPageEvent>;
}

/// @nodoc
class _$SalaryDetailsPageEventCopyWithImpl<$Res,
        $Val extends SalaryDetailsPageEvent>
    implements $SalaryDetailsPageEventCopyWith<$Res> {
  _$SalaryDetailsPageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetDetailsCopyWith<$Res> {
  factory _$$GetDetailsCopyWith(
          _$GetDetails value, $Res Function(_$GetDetails) then) =
      __$$GetDetailsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetDetailsCopyWithImpl<$Res>
    extends _$SalaryDetailsPageEventCopyWithImpl<$Res, _$GetDetails>
    implements _$$GetDetailsCopyWith<$Res> {
  __$$GetDetailsCopyWithImpl(
      _$GetDetails _value, $Res Function(_$GetDetails) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetDetails implements GetDetails {
  const _$GetDetails();

  @override
  String toString() {
    return 'SalaryDetailsPageEvent.getDetails()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetDetails);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDetails,
  }) {
    return getDetails();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getDetails,
  }) {
    return getDetails?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDetails,
    required TResult orElse(),
  }) {
    if (getDetails != null) {
      return getDetails();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetDetails value) getDetails,
  }) {
    return getDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetDetails value)? getDetails,
  }) {
    return getDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetDetails value)? getDetails,
    required TResult orElse(),
  }) {
    if (getDetails != null) {
      return getDetails(this);
    }
    return orElse();
  }
}

abstract class GetDetails implements SalaryDetailsPageEvent {
  const factory GetDetails() = _$GetDetails;
}

/// @nodoc
mixin _$SalaryDetailsPageState {
  bool get isLoading => throw _privateConstructorUsedError;
  SalaryDetailsModel? get salaryDetailsModel =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading, SalaryDetailsModel? salaryDetailsModel)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, SalaryDetailsModel? salaryDetailsModel)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, SalaryDetailsModel? salaryDetailsModel)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalaryDetailsPageStateCopyWith<SalaryDetailsPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryDetailsPageStateCopyWith<$Res> {
  factory $SalaryDetailsPageStateCopyWith(SalaryDetailsPageState value,
          $Res Function(SalaryDetailsPageState) then) =
      _$SalaryDetailsPageStateCopyWithImpl<$Res, SalaryDetailsPageState>;
  @useResult
  $Res call({bool isLoading, SalaryDetailsModel? salaryDetailsModel});
}

/// @nodoc
class _$SalaryDetailsPageStateCopyWithImpl<$Res,
        $Val extends SalaryDetailsPageState>
    implements $SalaryDetailsPageStateCopyWith<$Res> {
  _$SalaryDetailsPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? salaryDetailsModel = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      salaryDetailsModel: freezed == salaryDetailsModel
          ? _value.salaryDetailsModel
          : salaryDetailsModel // ignore: cast_nullable_to_non_nullable
              as SalaryDetailsModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $SalaryDetailsPageStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, SalaryDetailsModel? salaryDetailsModel});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$SalaryDetailsPageStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? salaryDetailsModel = freezed,
  }) {
    return _then(_$_Initial(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      salaryDetailsModel: freezed == salaryDetailsModel
          ? _value.salaryDetailsModel
          : salaryDetailsModel // ignore: cast_nullable_to_non_nullable
              as SalaryDetailsModel?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.isLoading, this.salaryDetailsModel});

  @override
  final bool isLoading;
  @override
  final SalaryDetailsModel? salaryDetailsModel;

  @override
  String toString() {
    return 'SalaryDetailsPageState.initial(isLoading: $isLoading, salaryDetailsModel: $salaryDetailsModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.salaryDetailsModel, salaryDetailsModel) ||
                other.salaryDetailsModel == salaryDetailsModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, salaryDetailsModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading, SalaryDetailsModel? salaryDetailsModel)
        initial,
  }) {
    return initial(isLoading, salaryDetailsModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, SalaryDetailsModel? salaryDetailsModel)?
        initial,
  }) {
    return initial?.call(isLoading, salaryDetailsModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, SalaryDetailsModel? salaryDetailsModel)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isLoading, salaryDetailsModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SalaryDetailsPageState {
  const factory _Initial(
      {required final bool isLoading,
      final SalaryDetailsModel? salaryDetailsModel}) = _$_Initial;

  @override
  bool get isLoading;
  @override
  SalaryDetailsModel? get salaryDetailsModel;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
