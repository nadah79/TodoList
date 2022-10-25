// ignore_for_file: implementation_imports, unused_import, prefer_const_constructors, use_key_in_widget_constructors

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

class HomeScrren extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeList'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/list');
          },
          child: Icon(Icons.list)),
    );
  }
}
