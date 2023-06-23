import 'package:flutter/material.dart';
import '../model/User.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.e});

  final User e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage(e.avatar),
              maxRadius: 60,
            ),
          ),
          Text("${e.firstName} ${e.lastName}"),
          Text(e.email),
        ],
      ),
    );
  }
}
