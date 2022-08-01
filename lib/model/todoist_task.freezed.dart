// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todoist_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoistTask _$TodoistTaskFromJson(Map<String, dynamic> json) {
  return _TodoistTask.fromJson(json);
}

/// @nodoc
mixin _$TodoistTask {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'project_id')
  int get projectId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;
  @JsonKey(name: 'due')
  TodoistTaskDueTime? get due => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoistTaskCopyWith<TodoistTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoistTaskCopyWith<$Res> {
  factory $TodoistTaskCopyWith(
          TodoistTask value, $Res Function(TodoistTask) then) =
      _$TodoistTaskCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: 'project_id') int projectId,
      String content,
      String url,
      bool completed,
      @JsonKey(name: 'due') TodoistTaskDueTime? due});

  $TodoistTaskDueTimeCopyWith<$Res>? get due;
}

/// @nodoc
class _$TodoistTaskCopyWithImpl<$Res> implements $TodoistTaskCopyWith<$Res> {
  _$TodoistTaskCopyWithImpl(this._value, this._then);

  final TodoistTask _value;
  // ignore: unused_field
  final $Res Function(TodoistTask) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? projectId = freezed,
    Object? content = freezed,
    Object? url = freezed,
    Object? completed = freezed,
    Object? due = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      due: due == freezed
          ? _value.due
          : due // ignore: cast_nullable_to_non_nullable
              as TodoistTaskDueTime?,
    ));
  }

  @override
  $TodoistTaskDueTimeCopyWith<$Res>? get due {
    if (_value.due == null) {
      return null;
    }

    return $TodoistTaskDueTimeCopyWith<$Res>(_value.due!, (value) {
      return _then(_value.copyWith(due: value));
    });
  }
}

/// @nodoc
abstract class _$$_TodoistTaskCopyWith<$Res>
    implements $TodoistTaskCopyWith<$Res> {
  factory _$$_TodoistTaskCopyWith(
          _$_TodoistTask value, $Res Function(_$_TodoistTask) then) =
      __$$_TodoistTaskCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: 'project_id') int projectId,
      String content,
      String url,
      bool completed,
      @JsonKey(name: 'due') TodoistTaskDueTime? due});

  @override
  $TodoistTaskDueTimeCopyWith<$Res>? get due;
}

/// @nodoc
class __$$_TodoistTaskCopyWithImpl<$Res> extends _$TodoistTaskCopyWithImpl<$Res>
    implements _$$_TodoistTaskCopyWith<$Res> {
  __$$_TodoistTaskCopyWithImpl(
      _$_TodoistTask _value, $Res Function(_$_TodoistTask) _then)
      : super(_value, (v) => _then(v as _$_TodoistTask));

  @override
  _$_TodoistTask get _value => super._value as _$_TodoistTask;

  @override
  $Res call({
    Object? id = freezed,
    Object? projectId = freezed,
    Object? content = freezed,
    Object? url = freezed,
    Object? completed = freezed,
    Object? due = freezed,
  }) {
    return _then(_$_TodoistTask(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      due: due == freezed
          ? _value.due
          : due // ignore: cast_nullable_to_non_nullable
              as TodoistTaskDueTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoistTask implements _TodoistTask {
  const _$_TodoistTask(
      {required this.id,
      @JsonKey(name: 'project_id') required this.projectId,
      required this.content,
      required this.url,
      required this.completed,
      @JsonKey(name: 'due') this.due});

  factory _$_TodoistTask.fromJson(Map<String, dynamic> json) =>
      _$$_TodoistTaskFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'project_id')
  final int projectId;
  @override
  final String content;
  @override
  final String url;
  @override
  final bool completed;
  @override
  @JsonKey(name: 'due')
  final TodoistTaskDueTime? due;

  @override
  String toString() {
    return 'TodoistTask(id: $id, projectId: $projectId, content: $content, url: $url, completed: $completed, due: $due)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoistTask &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.projectId, projectId) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.completed, completed) &&
            const DeepCollectionEquality().equals(other.due, due));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(projectId),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(completed),
      const DeepCollectionEquality().hash(due));

  @JsonKey(ignore: true)
  @override
  _$$_TodoistTaskCopyWith<_$_TodoistTask> get copyWith =>
      __$$_TodoistTaskCopyWithImpl<_$_TodoistTask>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoistTaskToJson(
      this,
    );
  }
}

abstract class _TodoistTask implements TodoistTask {
  const factory _TodoistTask(
      {required final int id,
      @JsonKey(name: 'project_id') required final int projectId,
      required final String content,
      required final String url,
      required final bool completed,
      @JsonKey(name: 'due') final TodoistTaskDueTime? due}) = _$_TodoistTask;

  factory _TodoistTask.fromJson(Map<String, dynamic> json) =
      _$_TodoistTask.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'project_id')
  int get projectId;
  @override
  String get content;
  @override
  String get url;
  @override
  bool get completed;
  @override
  @JsonKey(name: 'due')
  TodoistTaskDueTime? get due;
  @override
  @JsonKey(ignore: true)
  _$$_TodoistTaskCopyWith<_$_TodoistTask> get copyWith =>
      throw _privateConstructorUsedError;
}
