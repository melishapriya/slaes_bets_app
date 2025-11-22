import 'package:flutter/material.dart';
import '../widgets/card_widget.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  // Mock leaderboard data
  final List<LeaderboardEntry> _leaderboardData = [
    const LeaderboardEntry(name: 'Alex Johnson', score: 12500),
    const LeaderboardEntry(name: 'Sarah Williams', score: 11800),
    const LeaderboardEntry(name: 'Michael Brown', score: 11200),
    const LeaderboardEntry(name: 'Emily Davis', score: 9800),
    const LeaderboardEntry(name: 'David Wilson', score: 9200),
    const LeaderboardEntry(name: 'Jessica Martinez', score: 8700),
    const LeaderboardEntry(name: 'Christopher Lee', score: 8400),
    const LeaderboardEntry(name: 'Amanda Taylor', score: 8100),
    const LeaderboardEntry(name: 'James Anderson', score: 7800),
    const LeaderboardEntry(name: 'Lisa Thomas', score: 7500),
  ];

  Color _getRankColor(int rank) {
    switch (rank) {
      case 1:
        return const Color(0xFFFFD700); // Gold
      case 2:
        return const Color(0xFFC0C0C0); // Silver
      case 3:
        return const Color(0xFFCD7F32); // Bronze
      default:
        return Colors.white;
    }
  }

  IconData? _getRankIcon(int rank) {
    switch (rank) {
      case 1:
        return Icons.emoji_events;
      case 2:
        return Icons.emoji_events;
      case 3:
        return Icons.emoji_events;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          'Leaderboard',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: _leaderboardData.length,
          itemBuilder: (context, index) {
            final rank = index + 1;
            final entry = _leaderboardData[index];
            final isTopThree = rank <= 3;
            
            return CardWidget(
              margin: const EdgeInsets.only(bottom: 12),
              borderRadius: BorderRadius.circular(16),
              backgroundColor: _getRankColor(rank),
              elevation: 0,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                  children: [
                    // Rank Number
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: isTopThree
                            ? Colors.white.withOpacity(0.3)
                            : Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: isTopThree && _getRankIcon(rank) != null
                            ? Icon(
                                _getRankIcon(rank),
                                color: Colors.white,
                                size: 28,
                              )
                            : Text(
                                '$rank',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: isTopThree ? Colors.white : Colors.black,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Name
                    Expanded(
                      child: Text(
                        entry.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: isTopThree ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    // Score
                    Text(
                      '${entry.score}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isTopThree ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
            );
          },
        ),
      ),
    );
  }
}

class LeaderboardEntry {
  final String name;
  final int score;

  const LeaderboardEntry({
    required this.name,
    required this.score,
  });
}
