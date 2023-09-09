import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_tutorial/team.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Team> teams = [];

  // Future that fetches teams and populates the 'teams' list
  Future<List<Team>> getTeams() async {
    var response =
        await http.get(Uri.parse('https://www.balldontlie.io/api/v1/teams'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      for (var eachTeam in jsonData['data']) {
        final team = Team(
          abbreviation: eachTeam['abbreviation'],
          city: eachTeam['city'],
        );
        teams.add(team);
      }
      return teams; // Return the list of teams
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pretty"),
      ),
      body: FutureBuilder<List<Team>>(
        future: getTeams(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              // Data has been fetched successfully
              return ListView.builder(
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: ListTile(
                      title: Text(teams[index].abbreviation),
                    ),
                  );
                },
              );
            }
          } else {
            // Still loading
            return const Center(
              child: CircularProgressIndicator(),
            );
}
        },
      ),
    );
  }
}
