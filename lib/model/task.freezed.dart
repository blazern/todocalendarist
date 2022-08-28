// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  TodoistTask? get todoistTask => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res>;
  $Res call({TodoistTask? todoistTask});

  $TodoistTaskCopyWith<$Res>? get todoistTask;
}

/// @nodoc
class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  final Task _value;
  // ignore: unused_field
  final $Res Function(Task) _then;

  @override
  $Res call({
    Object? todoistTask = freezed,
  }) {
    return _then(_value.copyWith(
      todoistTask: todoistTask == freezed
          ? _value.todoistTask
          : todoistTask // ignore: cast_nullable_to_non_nullable
              as TodoistTask?,
    ));
  }

  @override
  $TodoistTaskCopyWith<$Res>? get todoistTask {
    if (_value.todoistTask == null) {
      return null;
    }

    return $TodoistTaskCopyWith<$Res>(_value.todoistTask!, (value) {
      return _then(_value.copyWith(todoistTask: value));
    });
  }
}

/// @nodoc
abstract class _$$_TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  $Res call({TodoistTask? todoistTask});

  @override
  $TodoistTaskCopyWith<$Res>? get todoistTask;
}

/// @nodoc
class __$$_TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res>
    implements _$$_TaskCopyWith<$Res> {
  __$$_TaskCopyWithImpl(_$_Task _value, $Res Function(_$_Task) _then)
      : super(_value, (v) => _then(v as _$_Task));

  @override
  _$_Task get _value => super._value as _$_Task;

  @override
  $Res call({
    Object? todoistTask = freezed,
  }) {
    return _then(_$_Task(
      todoistTask: todoistTask == freezed
          ? _value.todoistTask
          : todoistTask // ignore: cast_nullable_to_non_nullable
              as TodoistTask?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Task implements _Task {
  const _$_Task({required this.todoistTask});

  factory _$_Task.fromJson(Map<String, dynamic> json) => _$$_TaskFromJson(json);

  @override
  final TodoistTask? todoistTask;

  @override
  String toString() {
    return 'Task(todoistTask: $todoistTask)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task &&
            const DeepCollectionEquality()
                .equals(other.todoistTask, todoistTask));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(todoistTask));

  @JsonKey(ignore: true)
  @override
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task({required final TodoistTask? todoistTask}) = _$_Task;

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  TodoistTask? get todoistTask;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}
