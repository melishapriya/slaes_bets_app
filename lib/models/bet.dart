import 'team.dart';

class Bet {
  final String id;
  final String eventId;
  final String userId;
  final Team selectedTeam;
  final double amount;
  final double odds;
  final DateTime placedAt;
  final String? status; // pending, won, lost, cancelled

  Bet({
    required this.id,
    required this.eventId,
    required this.userId,
    required this.selectedTeam,
    required this.amount,
    required this.odds,
    required this.placedAt,
    this.status,
  });

  factory Bet.fromJson(Map<String, dynamic> json) {
    return Bet(
      id: json['id'] as String,
      eventId: json['eventId'] as String,
      userId: json['userId'] as String,
      selectedTeam: Team.fromJson(json['selectedTeam'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toDouble(),
      odds: (json['odds'] as num).toDouble(),
      placedAt: DateTime.parse(json['placedAt'] as String),
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'eventId': eventId,
      'userId': userId,
      'selectedTeam': selectedTeam.toJson(),
      'amount': amount,
      'odds': odds,
      'placedAt': placedAt.toIso8601String(),
      'status': status,
    };
  }

  double get potentialPayout => amount * odds;
}

