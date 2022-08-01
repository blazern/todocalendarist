// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todoist_task_due_time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoistTaskDueTime _$TodoistTaskDueTimeFromJson(Map<String, dynamic> json) {
  return _TodoistTaskDueTime.fromJson(json);
}

/// @nodoc
mixin _$TodoistTaskDueTime {
  @JsonKey(name: 'date')
  String get dateStr => throw _privateConstructorUsedError;
  @JsonKey(name: 'datetime')
  String? get datetimeStr => throw _privateConstructorUsedError;
  bool get recurring => throw _privateConstructorUsedError;
  String? get lang => throw _privateConstructorUsedError;
  String get string => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoistTaskDueTimeCopyWith<TodoistTaskDueTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoistTaskDueTimeCopyWith<$Res> {
  factory $TodoistTaskDueTimeCopyWith(
          TodoistTaskDueTime value, $Res Function(TodoistTaskDueTime) then) =
      _$TodoistTaskDueTimeCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'date') String dateStr,
      @JsonKey(name: 'datetime') String? datetimeStr,
      bool recurring,
      String? lang,
      String string});
}

/// @nodoc
class _$TodoistTaskDueTimeCopyWithImpl<$Res>
    implements $TodoistTaskDueTimeCopyWith<$Res> {
  _$TodoistTaskDueTimeCopyWithImpl(this._value, this._then);

  final TodoistTaskDueTime _value;
  // ignore: unused_field
  final $Res Function(TodoistTaskDueTime) _then;

  @override
  $Res call({
    Object? dateStr = freezed,
    Object? datetimeStr = freezed,
    Object? recurring = freezed,
    Object? lang = freezed,
    Object? string = freezed,
  }) {
    return _then(_value.copyWith(
      dateStr: dateStr == freezed
          ? _value.dateStr
          : dateStr // ignore: cast_nullable_to_non_nullable
              as String,
      datetimeStr: datetimeStr == freezed
          ? _value.datetimeStr
          : datetimeStr // ignore: cast_nullable_to_non_nullable
              as String?,
      recurring: recurring == freezed
          ? _value.recurring
          : recurring // ignore: cast_nullable_to_non_nullable
              as bool,
      lang: lang == freezed
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      string: string == freezed
          ? _value.string
          : string // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TodoistTaskDueTimeCopyWith<$Res>
    implements $TodoistTaskDueTimeCopyWith<$Res> {
  factory _$$_TodoistTaskDueTimeCopyWith(_$_TodoistTaskDueTime value,
          $Res Function(_$_TodoistTaskDueTime) then) =
      __$$_TodoistTaskDueTimeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'date') String dateStr,
      @JsonKey(name: 'datetime') String? datetimeStr,
      bool recurring,
      String? lang,
      String string});
}

/// @nodoc
class __$$_TodoistTaskDueTimeCopyWithImpl<$Res>
    extends _$TodoistTaskDueTimeCopyWithImpl<$Res>
    implements _$$_TodoistTaskDueTimeCopyWith<$Res> {
  __$$_TodoistTaskDueTimeCopyWithImpl(
      _$_TodoistTaskDueTime _value, $Res Function(_$_TodoistTaskDueTime) _then)
      : super(_value, (v) => _then(v as _$_TodoistTaskDueTime));

  @override
  _$_TodoistTaskDueTime get _value => super._value as _$_TodoistTaskDueTime;

  @override
  $Res call({
    Object? dateStr = freezed,
    Object? datetimeStr = freezed,
    Object? recurring = freezed,
    Object? lang = freezed,
    Object? string = freezed,
  }) {
    return _then(_$_TodoistTaskDueTime(
      dateStr: dateStr == freezed
          ? _value.dateStr
          : dateStr // ignore: cast_nullable_to_non_nullable
              as String,
      datetimeStr: datetimeStr == freezed
          ? _value.datetimeStr
          : datetimeStr // ignore: cast_nullable_to_non_nullable
              as String?,
      recurring: recurring == freezed
          ? _value.recurring
          : recurring // ignore: cast_nullable_to_non_nullable
              as bool,
      lang: lang == freezed
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      string: string == freezed
          ? _value.string
          : string // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoistTaskDueTime implements _TodoistTaskDueTime {
  const _$_TodoistTaskDueTime(
      {@JsonKey(name: 'date') required this.dateStr,
      @JsonKey(name: 'datetime') required this.datetimeStr,
      required this.recurring,
      required this.lang,
      required this.string});

  factory _$_TodoistTaskDueTime.fromJson(Map<String, dynamic> json) =>
      _$$_TodoistTaskDueTimeFromJson(json);

  @override
  @JsonKey(name: 'date')
  final String dateStr;
  @override
  @JsonKey(name: 'datetime')
  final String? datetimeStr;
  @override
  final bool recurring;
  @override
  final String? lang;
  @override
  final String string;

  @override
  String toString() {
    return 'TodoistTaskDueTime(dateStr: $dateStr, datetimeStr: $datetimeStr, recurring: $recurring, lang: $lang, string: $string)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoistTaskDueTime &&
            const DeepCollectionEquality().equals(other.dateStr, dateStr) &&
            const DeepCollectionEquality()
                .equals(other.datetimeStr, datetimeStr) &&
            const DeepCollectionEquality().equals(other.recurring, recurring) &&
            const DeepCollectionEquality().equals(other.lang, lang) &&
            const DeepCollectionEquality().equals(other.string, string));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dateStr),
      const DeepCollectionEquality().hash(datetimeStr),
      const DeepCollectionEquality().hash(recurring),
      const DeepCollectionEquality().hash(lang),
      const DeepCollectionEquality().hash(string));

  @JsonKey(ignore: true)
  @override
  _$$_TodoistTaskDueTimeCopyWith<_$_TodoistTaskDueTime> get copyWith =>
      __$$_TodoistTaskDueTimeCopyWithImpl<_$_TodoistTaskDueTime>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoistTaskDueTimeToJson(
      this,
    );
  }
}

abstract class _TodoistTaskDueTime implements TodoistTaskDueTime {
  const factory _TodoistTaskDueTime(
      {@JsonKey(name: 'date') required final String dateStr,
      @JsonKey(name: 'datetime') required final String? datetimeStr,
      required final bool recurring,
      required final String? lang,
      required final String string}) = _$_TodoistTaskDueTime;

  factory _TodoistTaskDueTime.fromJson(Map<String, dynamic> json) =
      _$_TodoistTaskDueTime.fromJson;

  @override
  @JsonKey(name: 'date')
  String get dateStr;
  @override
  @JsonKey(name: 'datetime')
  String? get datetimeStr;
  @override
  bool get recurring;
  @override
  String? get lang;
  @override
  String get string;
  @override
  @JsonKey(ignore: true)
  _$$_TodoistTaskDueTimeCopyWith<_$_TodoistTaskDueTime> get copyWith =>
      throw _privateConstructorUsedError;
}
