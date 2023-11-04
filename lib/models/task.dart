
import 'package:equatable/equatable.dart';

import 'dart:convert';

class Task extends Equatable {
  final String title;
  final String id;
  final String descripton;
  final String date;
  bool? isFavorite;
  bool? isDone;
  bool? isDeleted;

  Task(
      {required this.date,
      required this.descripton,
      required this.id,
      required this.title,
      this.isDone,
      this.isDeleted,
      this.isFavorite}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isFavorite ?? false;
  }

  Task copyWith({
    String? id,
    String? descripton,
    String? date,
    String? title,
    bool? isDone,
    bool? isFavorite,
    bool? isDeleted,
  }) {
    return Task(
        date: date ?? this.date,
        id: id ?? this.id,
        descripton: descripton ?? this.descripton,
        title: title ?? this.title,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? this.isDeleted,
        isFavorite: isFavorite ?? this.isFavorite);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'descripton': descripton,
      'title': title,
      'date': date,
      'id': id,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isFavorite': isFavorite
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      date: map['date'] ?? '',
      isFavorite: map['isFavorite'],
      descripton: map['descripton'] ?? '',
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      isDone: map['isDone'],
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [title, isDone, isDeleted, id, descripton];
}
