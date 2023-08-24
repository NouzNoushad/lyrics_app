import 'package:flutter/material.dart';
import 'package:lyrics_app/utils/colors.dart';

class Lyrics extends StatefulWidget {
  const Lyrics({super.key});

  @override
  State<Lyrics> createState() => _LyricsState();
}

class _LyricsState extends State<Lyrics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background1,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.background2,
        title: const Text(
          'Lyrics',
          style: TextStyle(
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 6,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        itemBuilder: (context, index) {
          return Card(
            color: const Color.fromARGB(255, 71, 34, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                'Lyrics text',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
