import '../models/team.dart';
import '../models/event.dart';
import '../models/bet.dart';

class MockDataService {
  // Mock Teams
  static List<Team> getMockTeams() {
    return [
      Team(
        id: '1',
        name: 'Team Alpha',
        logoUrl: 'https://via.placeholder.com/100',
        description: 'A competitive team',
      ),
      Team(
        id: '2',
        name: 'Team Beta',
        logoUrl: 'https://via.placeholder.com/100',
        description: 'Another competitive team',
      ),
      Team(
        id: '3',
        name: 'Team Gamma',
        logoUrl: 'https://via.placeholder.com/100',
        description: 'Strong contenders',
      ),
      Team(
        id: '4',
        name: 'Team Delta',
        logoUrl: 'https://via.placeholder.com/100',
        description: 'Rising stars',
      ),
    ];
  }

  // Mock Events
  static List<Event> getMockEvents() {
    final teams = getMockTeams();
    return [
      Event(
        id: '1',
        title: 'Championship Match',
        startTime: DateTime.now().add(const Duration(hours: 2)),
        team1: teams[0],
        team2: teams[1],
        status: 'upcoming',
        description: 'The final championship match',
      ),
      Event(
        id: '2',
        title: 'Semi-Final',
        startTime: DateTime.now().add(const Duration(days: 1)),
        team1: teams[2],
        team2: teams[3],
        status: 'upcoming',
        description: 'Semi-final match',
      ),
      Event(
        id: '3',
        title: 'Quarter Final',
        startTime: DateTime.now().subtract(const Duration(hours: 1)),
        endTime: DateTime.now().add(const Duration(hours: 1)),
        team1: teams[0],
        team2: teams[2],
        status: 'live',
        description: 'Live quarter final match',
      ),
    ];
  }

  // Mock Bets
  static List<Bet> getMockBets() {
    final events = getMockEvents();
    final teams = getMockTeams();
    return [
      Bet(
        id: '1',
        eventId: events[0].id,
        userId: 'user1',
        selectedTeam: teams[0],
        amount: 100.0,
        odds: 2.5,
        placedAt: DateTime.now().subtract(const Duration(hours: 1)),
        status: 'pending',
      ),
      Bet(
        id: '2',
        eventId: events[1].id,
        userId: 'user1',
        selectedTeam: teams[2],
        amount: 50.0,
        odds: 1.8,
        placedAt: DateTime.now().subtract(const Duration(days: 1)),
        status: 'won',
      ),
      Bet(
        id: '3',
        eventId: events[2].id,
        userId: 'user1',
        selectedTeam: teams[1],
        amount: 75.0,
        odds: 3.0,
        placedAt: DateTime.now().subtract(const Duration(hours: 2)),
        status: 'lost',
      ),
    ];
  }

  // Get single team by ID
  static Team? getTeamById(String id) {
    try {
      return getMockTeams().firstWhere((team) => team.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get single event by ID
  static Event? getEventById(String id) {
    try {
      return getMockEvents().firstWhere((event) => event.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get bets by user ID
  static List<Bet> getBetsByUserId(String userId) {
    return getMockBets().where((bet) => bet.userId == userId).toList();
  }
}

