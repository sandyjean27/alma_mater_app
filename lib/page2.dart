import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'history_screen.dart';
import 'strands_screen.dart';
import 'teachers_screen.dart';
import 'classrooms_screen.dart';
import 'events_screen.dart';
import 'achievements_screen.dart';

class Page2 extends StatefulWidget {
  final AudioPlayer audioPlayer;

  Page2({required this.audioPlayer}); // Accept the AudioPlayer instance

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  bool isPlaying = true;

  @override
  void initState() {
    super.initState();
    widget.audioPlayer.setSource(AssetSource("music/music.mp3"));
    _playMusic();
  }

  void _playMusic() async {
    await widget.audioPlayer.resume();
    setState(() {
      isPlaying = true;
    });
  }

  void _pauseMusic() async {
    if (isPlaying) {
      await widget.audioPlayer.pause();
    } else {
      await widget.audioPlayer.resume();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    widget.audioPlayer.stop(); // Stop music when leaving the page
    super.dispose();
  }

  final List<Map<String, dynamic>> menuItems = [
    {"title": "About", "icon": Icons.history, "screen": HistoryScreen()},
    {"title": "Strands", "icon": Icons.school, "screen": StrandsScreen()},
    {"title": "Teachers", "icon": Icons.people, "screen": TeachersScreen()},
    {"title": "Classrooms", "icon": Icons.class_, "screen": ClassroomsScreen()},
    {"title": "Achievements", "icon": Icons.star, "screen": AchievementsScreen()},
    {"title": "Events", "icon": Icons.event, "screen": EventsScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Iponan National High School"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: _pauseMusic,
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"), // Corrected asset path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // School Name (Centered at the Top)
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Text(
              "Iponan National High School",
              textAlign: TextAlign.center,
              style: GoogleFonts.merriweather(
                fontSize: 26,
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
          // Grid Menu Items
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return GridItem(
                    title: menuItems[index]["title"],
                    icon: menuItems[index]["icon"],
                    screen: menuItems[index]["screen"],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GridItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final Widget screen;

  GridItem({required this.title, required this.icon, required this.screen});

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.screen),
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isHovered ? Colors.blue.withOpacity(0.7) : Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(12),
            boxShadow: isHovered
                ? [BoxShadow(color: Colors.blueAccent, blurRadius: 8, spreadRadius: 2)]
                : [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 50, color: Colors.blue),
              SizedBox(height: 8),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isHovered ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
