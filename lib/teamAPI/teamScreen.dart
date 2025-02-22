import 'package:flutter/material.dart';
import './model.dart';
import './apiService.dart';

class teamData extends StatelessWidget {
  teamData({super.key});

  teamAPI api = teamAPI();

  @override
  Widget build(BuildContext context) {
    api.getTeams();
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.blue,
        // ),
        // body: FutureBuilder(
        //     future: api.getTeams(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         return ListView.builder(
        //           itemBuilder: (context, index) {
        //             Teams teams = snapshot.data[index];
        //             return ListTile(
        //               title: Text(teams.abbreviation),
        //               subtitle: Text(teams.city),
        //             );
        //           },
        //         );
        //       } else {
        //         return CircularProgressIndicator();
        //       }
        //     }),
        );
  }
}
