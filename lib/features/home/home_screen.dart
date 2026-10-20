import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:taskati_app/core/widgets/my_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('Image');
    return MyScaffold(
      body: Center(
        child: Column(
          children: [
            if (box.get('image') != null)
            ClipOval(
              child: Image.file(
                File( box.get('image')),
                height: 180,
                width: 180,
                fit: BoxFit.cover,  
              ),
            ),
            Text(" Name: ${box.get('name')}"),
          ],
        ),
      ),
    );
  }
}
