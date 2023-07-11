// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salary_transaction_history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SalaryTransactionHistoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHistory value) getHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHistory value)? getHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHistory value)? getHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryTransactionHistoryEventCopyWith<$Res> {
  factory $SalaryTransactionHistoryEventCopyWith(
          SalaryTransactionHistoryEvent value,
          $Res Function(SalaryTransactionHistoryEvent) then) =
      _$SalaryTransactionHistoryEventCopyWithImpl<$Res,
          SalaryTransactionHistoryEvent>;
}

/// @nodoc
class _$SalaryTransactionHistoryEventCopyWithImpl<$Res,
        $Val extends SalaryTransactionHistoryEvent>
    implements $SalaryTransactionHistoryEventCopyWith<$Res> {
  _$SalaryTransactionHistoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetHistoryCopyWith<$Res> {
  factory _$$GetHistoryCopyWith(
          _$GetHistory value, $Res Function(_$GetHistory) then) =
      __$$GetHistoryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetHistoryCopyWithImpl<$Res>
    extends _$SalaryTransactionHistoryEventCopyWithImpl<$Res, _$GetHistory>
    implements _$$GetHistoryCopyWith<$Res> {
  __$$GetHistoryCopyWithImpl(
      _$GetHistory _value, $Res Function(_$GetHistory) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetHistory implements GetHistory {
  const _$GetHistory();

  @override
  String toString() {
    return 'SalaryTransactionHistoryEvent.getHistory()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetHistory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHistory,
  }) {
    return getHistory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHistory,
  }) {
    return getHistory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHistory,
    required TResult orElse(),
  }) {
    if (getHistory != null) {
      return getHistory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHistory value) getHistory,
  }) {
    return getHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHistory value)? getHistory,
  }) {
    return getHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHistory value)? getHistory,
    required TResult orElse(),
  }) {
    if (getHistory != null) {
      return getHistory(this);
    }
    return orElse();
  }
}

abstract class GetHistory implements SalaryTransactionHistoryEvent {
  const factory GetHistory() = _$GetHistory;
}

/// @nodoc
mixin _$SalaryTransactionHistoryState {
  bool get isLoading => throw _privateConstructorUsedError;
  SalaryHistoryModel? get salaryHistoryModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalaryTransactionHistoryStateCopyWith<SalaryTransactionHistoryState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryTransactionHistoryStateCopyWith<$Res> {
  factory $SalaryTransactionHistoryStateCopyWith(
          SalaryTransactionHistoryState value,
          $Res Function(SalaryTransactionHistoryState) then) =
      _$SalaryTransactionHistoryStateCopyWithImpl<$Res,
          SalaryTransactionHistoryState>;
  @useResult
  $Res call({bool isLoading, SalaryHistoryModel? salaryHistoryModel});
}

/// @nodoc
class _$SalaryTransactionHistoryStateCopyWithImpl<$Res,
        $Val extends SalaryTransactionHistoryState>
    implements $SalaryTransactionHistoryStateCopyWith<$Res> {
  _$SalaryTransactionHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? salaryHistoryModel = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      salaryHistoryModel: freezed == salaryHistoryModel
          ? _value.salaryHistoryModel
          : salaryHistoryModel // ignore: cast_nullable_to_non_nullable
              as SalaryHistoryModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $SalaryTransactionHistoryStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, SalaryHistoryModel? salaryHistoryModel});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$SalaryTransactionHistoryStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? salaryHistoryModel = freezed,
  }) {
    return _then(_$_Initial(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      salaryHistoryModel: freezed == salaryHistoryModel
          ? _value.salaryHistoryModel
          : salaryHistoryModel // ignore: cast_nullable_to_non_nullable
              as SalaryHistoryModel?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.isLoading, this.salaryHistoryModel});

  @override
  final bool isLoading;
  @override
  final SalaryHistoryModel? salaryHistoryModel;

  @override
  String toString() {
    return 'SalaryTransactionHistoryState(isLoading: $isLoading, salaryHistoryModel: $salaryHistoryModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.salaryHistoryModel, salaryHistoryModel) ||
                other.salaryHistoryModel == salaryHistoryModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, salaryHistoryModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements SalaryTransactionHistoryState {
  const factory _Initial(
      {required final bool isLoading,
      final SalaryHistoryModel? salaryHistoryModel}) = _$_Initial;

  @override
  bool get isLoading;
  @override
  SalaryHistoryModel? get salaryHistoryModel;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
