import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'page2.dart'; // Page2 import

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alma Mater',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  void _playMusic() async {
    if (!isPlaying) {
      await _audioPlayer.play(AssetSource("music/music.mp3"));
      setState(() {
        isPlaying = true;
      });
    } else {
      await _audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // School Name
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Text(
              "Iponan National High School",
              textAlign: TextAlign.center,
              style: GoogleFonts.merriweather(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 5.0,
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
          ),
          // Logo (Click to Play Music & Navigate to Page2) Centered
          Center(
            child: GestureDetector(
              onTap: () {
                _playMusic(); // Toggle music on tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page2(audioPlayer: _audioPlayer)),
                );
              },
              child: AnimatedScale(
                scale: isPlaying ? 1.2 : 1.0, // Animate scale for play effect
                duration: Duration(milliseconds: 300),
                child: CircleAvatar(
                  radius: 140,
                  backgroundImage: AssetImage("images/event9.png"),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ),
          // Play/Pause Indicator
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                ),
                onPressed: _playMusic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
