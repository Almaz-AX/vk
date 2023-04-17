import 'package:flutter/material.dart';

class MusicTab extends StatelessWidget {
  const MusicTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Icon(Icons.music_note_outlined, color: Colors.blue),
          SizedBox(
            width: 10,
          ),
          Text('Музыка', style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}

class Music extends StatelessWidget {
  const Music({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 80,
                width: double.infinity,
                color: Colors.amber,
              );
  }
}
