import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'todo.g.dart';

@immutable
@JsonSerializable()
class Todo extends Equatable {
  Todo({
    required this.title,
    String? id,
    this.description = '',
    this.isCompleted = false,
  })  : assert(
          id == null || id.isNotEmpty,
          'id must either be null or not empty',
        ),
        id = id ?? const Uuid().v4();

  final String id;

  final String title;

  final String description;

  final bool isCompleted;

  Todo copyWith(
      {String? id, String? title, String? description, bool? isCompleted}) {
    return Todo(
        title: title ?? this.title,
        id: id ?? this.id,
        description: description ?? this.description,
        isCompleted: isCompleted ?? this.isCompleted);
  }

  /// Deserializes the given [JsonMap] into a [Todo].
  static Todo fromJson(JsonMap json) => _$TodoFromJson(json);

  /// Converts this [Todo] into a [JsonMap].
  JsonMap toJson() => _$TodoToJson(this);

  /// helps to go beyond just referential equality by comparing
  /// all the properties of a class.
  @override
  List<Object> get props => [id, title, description, isCompleted];
}

/// The type definition for a JSON-serializable [Map].
/// Returns a typedef for code checking and linting.
typedef JsonMap = Map<String, dynamic>;
