import 'package:flutter/material.dart';
import 'models.dart';
import 'election_details_page.dart';

class VoterHistoryPage extends StatelessWidget {
  final List<Election> elections = [
    Election(
      title: 'Student Republic Election 2025',
      date: 'May 12, 2025',
      hasVoted: true,
      candidates: [
        Candidate(name: 'Adolfo Neino N. Hidalgo', position: 'Governor', partylist: 'Nein Partylist'),
        Candidate(name: 'Tungtung Sahur III', position: 'Vice Governor', partylist: 'Sahur Partylist'),
        Candidate(name: 'Tralalero Tralala', position: 'Secretary', partylist: 'Tropartylist'),
        Candidate(name: 'Bombini Guzzini', position: 'Asst. Secretary', partylist: 'Bomba Partylist'),
      ],
    ),
    Election(
      title: 'Classroom Officers Election 2025',
      date: 'August 9, 2025',
      hasVoted: false,
    ),
    Election(
      title: 'Environmental Council Election 2025',
      date: 'April 5, 2025',
      hasVoted: true,
      candidates: [
        Candidate(name: 'Greta Verde', position: 'Council Head', partylist: 'Green Future'),
        Candidate(name: 'Eco Santos', position: 'Vice Head', partylist: 'Eco Partylist'),
        Candidate(name: 'Luntiang Puno', position: 'Coordinator', partylist: 'Nature Party'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voter's History"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: elections.length,
        itemBuilder: (context, index) {
          final election = elections[index];
          return Opacity(
            opacity: election.hasVoted ? 1.0 : 0.6,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: election.hasVoted ? Colors.green[50] : Colors.red[50],
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(election.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Date: ${election.date}'),
                trailing: Text(
                  election.hasVoted ? 'Voted' : "Didn't Vote",
                  style: TextStyle(
                    color: election.hasVoted ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: election.hasVoted
                    ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ElectionDetailsPage(election: election),
                          ),
                        )
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
