class ExperienceEntity {
  final String role;
  final String organization;
  final String period;
  final String description;
  final List<String> highlights;

  const ExperienceEntity({
    required this.role,
    required this.organization,
    required this.period,
    required this.description,
    this.highlights = const [],
  });
}
