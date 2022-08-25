// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todoist_keywords_split.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoistKeywordsSplit {
  List<String> get pieces => throw _privateConstructorUsedError;
  Pair<int, int>? get time => throw _privateConstructorUsedError;
  int? get dayOfMonth => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoistKeywordsSplitCopyWith<TodoistKeywordsSplit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoistKeywordsSplitCopyWith<$Res> {
  factory $TodoistKeywordsSplitCopyWith(TodoistKeywordsSplit value,
          $Res Function(TodoistKeywordsSplit) then) =
      _$TodoistKeywordsSplitCopyWithImpl<$Res>;
  $Res call({List<String> pieces, Pair<int, int>? time, int? dayOfMonth});
}

/// @nodoc
class _$TodoistKeywordsSplitCopyWithImpl<$Res>
    implements $TodoistKeywordsSplitCopyWith<$Res> {
  _$TodoistKeywordsSplitCopyWithImpl(this._value, this._then);

  final TodoistKeywordsSplit _value;
  // ignore: unused_field
  final $Res Function(TodoistKeywordsSplit) _then;

  @override
  $Res call({
    Object? pieces = freezed,
    Object? time = freezed,
    Object? dayOfMonth = freezed,
  }) {
    return _then(_value.copyWith(
      pieces: pieces == freezed
          ? _value.pieces
          : pieces // ignore: cast_nullable_to_non_nullable
              as List<String>,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Pair<int, int>?,
      dayOfMonth: dayOfMonth == freezed
          ? _value.dayOfMonth
          : dayOfMonth // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_TodoistKeywordsSplitCopyWith<$Res>
    implements $TodoistKeywordsSplitCopyWith<$Res> {
  factory _$$_TodoistKeywordsSplitCopyWith(_$_TodoistKeywordsSplit value,
          $Res Function(_$_TodoistKeywordsSplit) then) =
      __$$_TodoistKeywordsSplitCopyWithImpl<$Res>;
  @override
  $Res call({List<String> pieces, Pair<int, int>? time, int? dayOfMonth});
}

/// @nodoc
class __$$_TodoistKeywordsSplitCopyWithImpl<$Res>
    extends _$TodoistKeywordsSplitCopyWithImpl<$Res>
    implements _$$_TodoistKeywordsSplitCopyWith<$Res> {
  __$$_TodoistKeywordsSplitCopyWithImpl(_$_TodoistKeywordsSplit _value,
      $Res Function(_$_TodoistKeywordsSplit) _then)
      : super(_value, (v) => _then(v as _$_TodoistKeywordsSplit));

  @override
  _$_TodoistKeywordsSplit get _value => super._value as _$_TodoistKeywordsSplit;

  @override
  $Res call({
    Object? pieces = freezed,
    Object? time = freezed,
    Object? dayOfMonth = freezed,
  }) {
    return _then(_$_TodoistKeywordsSplit(
      pieces: pieces == freezed
          ? _value._pieces
          : pieces // ignore: cast_nullable_to_non_nullable
              as List<String>,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Pair<int, int>?,
      dayOfMonth: dayOfMonth == freezed
          ? _value.dayOfMonth
          : dayOfMonth // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_TodoistKeywordsSplit implements _TodoistKeywordsSplit {
  const _$_TodoistKeywordsSplit(
      {required final List<String> pieces,
      required this.time,
      required this.dayOfMonth})
      : _pieces = pieces;

  final List<String> _pieces;
  @override
  List<String> get pieces {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pieces);
  }

  @override
  final Pair<int, int>? time;
  @override
  final int? dayOfMonth;

  @override
  String toString() {
    return 'TodoistKeywordsSplit(pieces: $pieces, time: $time, dayOfMonth: $dayOfMonth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoistKeywordsSplit &&
            const DeepCollectionEquality().equals(other._pieces, _pieces) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality()
                .equals(other.dayOfMonth, dayOfMonth));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pieces),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(dayOfMonth));

  @JsonKey(ignore: true)
  @override
  _$$_TodoistKeywordsSplitCopyWith<_$_TodoistKeywordsSplit> get copyWith =>
      __$$_TodoistKeywordsSplitCopyWithImpl<_$_TodoistKeywordsSplit>(
          this, _$identity);
}

abstract class _TodoistKeywordsSplit implements TodoistKeywordsSplit {
  const factory _TodoistKeywordsSplit(
      {required final List<String> pieces,
      required final Pair<int, int>? time,
      required final int? dayOfMonth}) = _$_TodoistKeywordsSplit;

  @override
  List<String> get pieces;
  @override
  Pair<int, int>? get time;
  @override
  int? get dayOfMonth;
  @override
  @JsonKey(ignore: true)
  _$$_TodoistKeywordsSplitCopyWith<_$_TodoistKeywordsSplit> get copyWith =>
      throw _privateConstructorUsedError;
}
