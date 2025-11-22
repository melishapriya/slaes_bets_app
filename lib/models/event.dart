import 'team.dart';

class Event {
  final String id;
  final String title;
  final DateTime startTime;
  final DateTime? endTime;
  final Team team1;
  final Team team2;
  final String? status;
  final String? description;

  Event({
    required this.id,
    required this.title,
    required this.startTime,
    this.endTime,
    required this.team1,
    required this.team2,
    this.status,
    this.description,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'] as String,
      title: json['title'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] != null
          ? DateTime.parse(json['endTime'] as String)
          : null,
      team1: Team.fromJson(json['team1'] as Map<String, dynamic>),
      team2: Team.fromJson(json['team2'] as Map<String, dynamic>),
      status: json['status'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime?.toIso8601String(),
      'team1': team1.toJson(),
      'team2': team2.toJson(),
      'status': status,
      'description': description,
    };
  }
}

