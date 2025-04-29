class Election {
  final String title;
  final String date;
  final bool hasVoted;
  final List<Candidate>? candidates;

  Election({
    required this.title,
    required this.date,
    required this.hasVoted,
    this.candidates,
  });
}

class Candidate {
  final String name;
  final String position;
  final String partylist;

  Candidate({
    required this.name,
    required this.position,
    required this.partylist,
  });
}