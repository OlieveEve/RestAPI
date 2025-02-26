import 'package:flutter/material.dart';
import './model.dart';
import './apiService.dart';

class teamData extends StatefulWidget {
  teamData({super.key});

  @override
  State<teamData> createState() => _teamDataState();
}

class _teamDataState extends State<teamData> {
  teamAPI api = teamAPI();

  @override
  Widget build(BuildContext context) {
    // api.getDogs();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber),
      body: FutureBuilder(
          future: api.getDogs(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Dogs dogs = snapshot.data; //ถ้าข้อมูลที่ได้จาก API มีข้อมูลเดียว
              return Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Random dog image',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(height: 20),
                  Image(image: NetworkImage(dogs.message)),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text('Random'))
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
