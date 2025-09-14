import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool isPaused = false;
  String currentAudioPath = '';

  void _toggleAudio(String assetPath) async {
    if (currentAudioPath != assetPath) {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource(assetPath));
      setState(() {
        isPlaying = true;
        isPaused = false;
        currentAudioPath = assetPath;
      });
    } else {
      if (isPlaying && !isPaused) {
        await _audioPlayer.pause();
        setState(() {
          isPaused = true;
        });
      } else {
        await _audioPlayer.resume();
        setState(() {
          isPaused = false;
        });
      }
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
      appBar: AppBar(
        title: Text("History and Values of INHS"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 10,
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'images/bg.png', // Replace with your background image path
              fit: BoxFit.cover,
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSection(
                      "History",
                      historyText,
                      Icons.history,
                      Colors.blue,
                      'music/history.mp3',
                    ),
                    SizedBox(height: 20),
                    _buildSection(
                      "Mission",
                      mission,
                      Icons.flag,
                      Colors.green,
                      'music/mission.mp3',
                    ),
                    SizedBox(height: 20),
                    _buildSection(
                      "Vision",
                      vision,
                      Icons.visibility,
                      Colors.deepOrange,
                      'music/vission.mp3',
                    ),
                    SizedBox(height: 20),
                    _buildSection(
                      "Core Values",
                      coreValues,
                      Icons.star,
                      Colors.purple,
                      'music/values.mp3',
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Styled section for each part of the history page
  Widget _buildSection(String title, String content, IconData icon, Color iconColor, String audioPath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            children: [
              Icon(icon, color: iconColor, size: 30),
              SizedBox(width: 12),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: iconColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          // Content Text
          Text(
            content,
            style: GoogleFonts.roboto(fontSize: 16, color: Colors.black87, height: 1.6),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 12),
          // Play/Pause Button
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(
                isPlaying && currentAudioPath == audioPath && !isPaused ? Icons.pause : Icons.play_arrow,
                color: iconColor,
                size: 30,
              ),
              onPressed: () => _toggleAudio(audioPath),
            ),
          ),
        ],
      ),
    );
  }

  // Sample Data for History, Mission, Vision, and Core Values
  final String historyText = """
    Iponan National High School (INHS) is a public secondary educational institution located in Zone 5, Iponan, Cagayan de Oro City, Misamis Oriental, Philippines. 
    Established to provide quality education to the youth of the community, INHS has been serving students for decades, nurturing the next generation of leaders and professionals.
  """;

  final String mission = """
    To protect and promote the right of every Filipino to quality, equitable, culture-based, and complete basic education where:

    - Students learn in a child-friendly, gender-sensitive, safe, and motivating environment.
    - Teachers facilitate learning and constantly nurture every learner.
    - Administrators and staff, as stewards of the institution, ensure an enabling and supportive environment for effective learning to happen.
    - Family, community, and other stakeholders are actively engaged and share responsibility for developing life-long learners.
  """;

  final String vision = """
    We dream of Filipinos who passionately love their country and whose values and competencies enable them to realize their full potential and contribute meaningfully to building the nation.

    As a learner-centered public institution, the Department of Education continuously improves itself to better serve its stakeholders.  
  """;

  final String coreValues = """
    Maka-Diyos
    Maka-tao
    Makakalikasan
    Makabansa
  """;
}
