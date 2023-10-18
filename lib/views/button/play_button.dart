import 'package:flutter/material.dart';


class PlayButtonState extends StatefulWidget {
  const PlayButtonState({super.key});

  @override
  State<PlayButtonState> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButtonState> {
  bool _isPlaying = false;

  void _togglePlayPause(){
    setState(() {
      _isPlaying =!_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:_togglePlayPause,
       icon: _isPlaying ? const Icon(Icons.pause,color: Color(0xff863ED5),):Image.asset("images/play.png"));
  }
}
