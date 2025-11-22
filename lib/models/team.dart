class Team {
  final String id;
  final String name;
  final String logoUrl;
  final String? description;

  Team({
    required this.id,
    required this.name,
    required this.logoUrl,
    this.description,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'] as String,
      name: json['name'] as String,
      logoUrl: json['logoUrl'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logoUrl': logoUrl,
      'description': description,
    };
  }
}

