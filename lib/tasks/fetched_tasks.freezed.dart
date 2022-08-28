// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetched_tasks.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FetchedTasks {
  List<Task> get tasks => throw _privateConstructorUsedError;
  List<Pair<TodoistTask, RecurringDatesParsingError>>
      get recurringDatesParsingErrors => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FetchedTasksCopyWith<FetchedTasks> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchedTasksCopyWith<$Res> {
  factory $FetchedTasksCopyWith(
          FetchedTasks value, $Res Function(FetchedTasks) then) =
      _$FetchedTasksCopyWithImpl<$Res>;
  $Res call(
      {List<Task> tasks,
      List<Pair<TodoistTask, RecurringDatesParsingError>>
          recurringDatesParsingErrors});
}

/// @nodoc
class _$FetchedTasksCopyWithImpl<$Res> implements $FetchedTasksCopyWith<$Res> {
  _$FetchedTasksCopyWithImpl(this._value, this._then);

  final FetchedTasks _value;
  // ignore: unused_field
  final $Res Function(FetchedTasks) _then;

  @override
  $Res call({
    Object? tasks = freezed,
    Object? recurringDatesParsingErrors = freezed,
  }) {
    return _then(_value.copyWith(
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      recurringDatesParsingErrors: recurringDatesParsingErrors == freezed
          ? _value.recurringDatesParsingErrors
          : recurringDatesParsingErrors // ignore: cast_nullable_to_non_nullable
              as List<Pair<TodoistTask, RecurringDatesParsingError>>,
    ));
  }
}

/// @nodoc
abstract class _$$_FetchedTasksCopyWith<$Res>
    implements $FetchedTasksCopyWith<$Res> {
  factory _$$_FetchedTasksCopyWith(
          _$_FetchedTasks value, $Res Function(_$_FetchedTasks) then) =
      __$$_FetchedTasksCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Task> tasks,
      List<Pair<TodoistTask, RecurringDatesParsingError>>
          recurringDatesParsingErrors});
}

/// @nodoc
class __$$_FetchedTasksCopyWithImpl<$Res>
    extends _$FetchedTasksCopyWithImpl<$Res>
    implements _$$_FetchedTasksCopyWith<$Res> {
  __$$_FetchedTasksCopyWithImpl(
      _$_FetchedTasks _value, $Res Function(_$_FetchedTasks) _then)
      : super(_value, (v) => _then(v as _$_FetchedTasks));

  @override
  _$_FetchedTasks get _value => super._value as _$_FetchedTasks;

  @override
  $Res call({
    Object? tasks = freezed,
    Object? recurringDatesParsingErrors = freezed,
  }) {
    return _then(_$_FetchedTasks(
      tasks: tasks == freezed
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      recurringDatesParsingErrors: recurringDatesParsingErrors == freezed
          ? _value._recurringDatesParsingErrors
          : recurringDatesParsingErrors // ignore: cast_nullable_to_non_nullable
              as List<Pair<TodoistTask, RecurringDatesParsingError>>,
    ));
  }
}

/// @nodoc

class _$_FetchedTasks implements _FetchedTasks {
  const _$_FetchedTasks(
      {required final List<Task> tasks,
      required final List<Pair<TodoistTask, RecurringDatesParsingError>>
          recurringDatesParsingErrors})
      : _tasks = tasks,
        _recurringDatesParsingErrors = recurringDatesParsingErrors;

  final List<Task> _tasks;
  @override
  List<Task> get tasks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  final List<Pair<TodoistTask, RecurringDatesParsingError>>
      _recurringDatesParsingErrors;
  @override
  List<Pair<TodoistTask, RecurringDatesParsingError>>
      get recurringDatesParsingErrors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recurringDatesParsingErrors);
  }

  @override
  String toString() {
    return 'FetchedTasks(tasks: $tasks, recurringDatesParsingErrors: $recurringDatesParsingErrors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchedTasks &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality().equals(
                other._recurringDatesParsingErrors,
                _recurringDatesParsingErrors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_recurringDatesParsingErrors));

  @JsonKey(ignore: true)
  @override
  _$$_FetchedTasksCopyWith<_$_FetchedTasks> get copyWith =>
      __$$_FetchedTasksCopyWithImpl<_$_FetchedTasks>(this, _$identity);
}

abstract class _FetchedTasks implements FetchedTasks {
  const factory _FetchedTasks(
      {required final List<Task> tasks,
      required final List<Pair<TodoistTask, RecurringDatesParsingError>>
          recurringDatesParsingErrors}) = _$_FetchedTasks;

  @override
  List<Task> get tasks;
  @override
  List<Pair<TodoistTask, RecurringDatesParsingError>>
      get recurringDatesParsingErrors;
  @override
  @JsonKey(ignore: true)
  _$$_FetchedTasksCopyWith<_$_FetchedTasks> get copyWith =>
      throw _privateConstructorUsedError;
}
