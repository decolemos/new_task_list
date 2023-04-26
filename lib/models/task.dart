class Task {
  final String? id;
  final String? number;
  final String? applicant;
  final String? description;
  final String? sector;

  const Task ({
    this.id,
    required this.number,
    required this.applicant,
    required this.description,
    required this.sector
  });
}