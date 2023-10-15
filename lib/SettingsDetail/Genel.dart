import 'package:flutter/material.dart';

class Genel extends StatefulWidget {
  const Genel({Key? key});

  @override
  State<Genel> createState() => _GenelState();
}

class _GenelState extends State<Genel> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: Text('Genel'),
          backgroundColor: Colors.grey.shade800,
          centerTitle: true,
        ),
    );
  }
}
