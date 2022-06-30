import 'package:flutter/material.dart';

class VideoDetailView extends StatelessWidget {
  const VideoDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('動画', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.blueGrey[100],
      ),
    );
  }
}
