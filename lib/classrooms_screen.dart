import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Classroom {
  final String roomNumber;
  final String subject;
  final String gradeLevel;

  Classroom({required this.roomNumber, required this.subject, required this.gradeLevel});
}

class ClassroomsScreen extends StatefulWidget {
  @override
  _ClassroomsScreenState createState() => _ClassroomsScreenState();
}

class _ClassroomsScreenState extends State<ClassroomsScreen> {
  late VideoPlayerController _controller;
  bool _isVideoPlaying = false;

  final List<Classroom> classrooms = [
    Classroom(roomNumber: "HUMSS A", subject: "HUMSS", gradeLevel: "Grade 12"),
    Classroom(roomNumber: "HUMSS A", subject: "HUMSS", gradeLevel: "Grade 11"),
    Classroom(roomNumber: "HUMSS B", subject: "HUMSS", gradeLevel: "Grade 12"),
    Classroom(roomNumber: "HUMSS B", subject: "HUMSS", gradeLevel: "Grade 11"),
    Classroom(roomNumber: "ICT A", subject: "ICT", gradeLevel: "Grade 12"),
    Classroom(roomNumber: "ICT A", subject: "ICT", gradeLevel: "Grade 11"),
    Classroom(roomNumber: "ICT B", subject: "ICT", gradeLevel: "Grade 12"),
    Classroom(roomNumber: "ICT B", subject: "ICT", gradeLevel: "Grade 11"),
    Classroom(roomNumber: "ICT B", subject: "II ICT", gradeLevel: "Grade 11"),
    Classroom(roomNumber: "ABM", subject: "ABM", gradeLevel: "Grade 12"),
    Classroom(roomNumber: "ABM", subject: "ABM", gradeLevel: "Grade 11"),
    Classroom(roomNumber: "HE", subject: "HE", gradeLevel: "Grade 12"),
    Classroom(roomNumber: "HE", subject: "HE", gradeLevel: "Grade 11"),

  ];

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('videos/school.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Classrooms"),
              backgroundColor: Colors.blueAccent, // White background for the app bar
),
      body: Stack(
        children: [
          // Background image without darkening effect
          Positioned.fill(
            child: Image.asset(
              'images/bg.png', // Background image (without darken)
              fit: BoxFit.cover,
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Virtual School Tour button with color and padding
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_isVideoPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                      _isVideoPlaying = !_isVideoPlaying;
                    });
                  },
                  child: Text(_isVideoPlaying ? "Pause Virtual Tour" : "Take a Virtual Tour"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent.withOpacity(0.8), // Adjusted color with opacity
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                // Show video when initialized
                _controller.value.isInitialized
                    ? Column(
                        children: [
                          Container(
                            height: 200,
                            child: VideoPlayer(_controller),
                          ),
                          // Add a progress bar for video
                          VideoProgressIndicator(
                            _controller,
                            allowScrubbing: true,
                          ),
                        ],
                      )
                    : CircularProgressIndicator(),
                SizedBox(height: 20),
                // List of classrooms
                Expanded(
                  child: ListView.builder(
                    itemCount: classrooms.length,
                    itemBuilder: (context, index) {
                      final classroom = classrooms[index];
                      return Opacity(
                        opacity: 0.9, // Apply opacity to cards (less faded)
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          child: ListTile(
                            title: Text(
                              "Room ${classroom.roomNumber} - ${classroom.subject}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("Grade Level: ${classroom.gradeLevel}"),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
