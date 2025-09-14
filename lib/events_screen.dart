import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// Event class definition
class Event {
  final String title;
  final String date;
  final String location;
  final String description;
  final List<String> images; // List of image paths for the album
  final String? videoUrl;  // Add video URL

  Event({
    required this.title,
    required this.date,
    required this.location,
    required this.description,
    required this.images,
    this.videoUrl, // Add videoUrl as optional
  });
}

// EventsScreen that lists the events
class EventsScreen extends StatelessWidget {
  final List<Event> events = [
    Event(
      title: "Iponan NHS 7th Commencement Exercises & 9th Moving-Up Ceremony",
      date: "May 29, 2024",
      location: "INHS Covered Court",
      description: "Completion Ceremony",
      images: [
        "images/event.png",
        "images/event1.png",
        "images/event2.png",
        "images/event3.png",
        "images/event4.png",
      ],
    ),
    Event(
      title: "𝟐𝟎𝟐𝟒 𝗡𝗔𝗧𝗜𝗢𝗡𝗔𝗟 𝗟𝗘𝗔𝗥𝗡𝗜𝗡𝗚 𝗖𝗔𝗠𝗣 (NLC)",
      date: "July 1, 2024",
      location: "INHS Covered Court",
      description: "A day full of fun and competitive sports activities.",
      images: [
        "images/event5.png",
      ],
    ),
    Event(
      title: "Brigada Skwela Commitment 2024",
      date: "July 19, 2024",
      location: "INHS Covered Court",
      description: "A day full of fun and competitive sports activities.",
      images: [
        "images/event6.png",
      ],
    ),
    Event(
      title: "MOBILE JOURNALISM",
      date: "July 18, 2024",
      location: "INHS",
      description: "Watch this special video for the event!",
      images: [        
        "images/event7.png",
      ],
      videoUrl: "videos/event_4.mp4",  // Add video URL here
    ),
    Event(
      title: "Madrasah Education Program (MEP) Symposium",
      date: "January 30, 2025",
      location: "INHS Covered Court",
      description: "",
      images: [
        "images/event8.png",
      ],
    ),
    Event(
      title: "YES-O & BSP Clean-Up Drive",
      date: "January 17, 2025",
      location: "Barra, Opol",
      description: "",
      images: [
        "images/10.png",
      ],
    ),
     Event(
      title: "Retro Dance Contest 2025",
      date: "January 8, 2025",
      location: "Iponan Plaza",
      description: "",
      images: [
        "images/event10.png",
      ],
    ),
     Event(
      title: "Mr. & Ms. Kalikasan 2024",
      date: "December 13, 2024",
      location: "INHS Covered Court",
      description: "",
      images: [
        "images/event11.png",
      ],
    ),
    Event(
      title: "National Drug Education Program Symposium",
      date: "December 12, 2024",
      location: "INHS Covered Court",
      description: "",
      images: [
        "images/event12.png",
      ],
    ),
     Event(
      title: "National Drug Education Program Symposium",
      date: "December 12, 2024",
      location: "INHS Covered Court",
      description: "",
      images: [
        "images/event12.png",
      ],
    ),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
                backgroundColor: Colors.blueAccent, // White background for the app bar

      ),
      body: Stack(
        children: [
          // Background Image without darkening effect
          Positioned.fill(
            child: Image.asset(
              'images/bg.png',  // Use your desired background image
              fit: BoxFit.cover,
            ),
          ),
          // Content with padding
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),  // Add opacity to the card
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EventGalleryScreen(event: event)),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                            child: Image.asset(
                              event.images.isNotEmpty ? event.images[0] : "images/default_image.png", // Use the first image or default if empty
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(event.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Text("Date: ${event.date}", style: TextStyle(color: Colors.grey[700])),
                                Text("Location: ${event.location}", style: TextStyle(color: Colors.grey[700])),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// EventGalleryScreen to display images and video for the selected event
class EventGalleryScreen extends StatefulWidget {
  final Event event;

  EventGalleryScreen({required this.event});

  @override
  _EventGalleryScreenState createState() => _EventGalleryScreenState();
}

class _EventGalleryScreenState extends State<EventGalleryScreen> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    if (widget.event.videoUrl != null) {
      _videoController = VideoPlayerController.asset(widget.event.videoUrl!)
        ..initialize().then((_) {
          setState(() {});
          _videoController.play();  // Auto-play the video when it's ready
        });
    }
  }

  @override
  void dispose() {
    if (_videoController.value.isInitialized) {
      _videoController.dispose();  // Dispose of the video controller when leaving the screen
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.event.title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.event.videoUrl != null && _videoController.value.isInitialized
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.event.description, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  AspectRatio(
                    aspectRatio: _videoController.value.aspectRatio,
                    child: VideoPlayer(_videoController),
                  ),
                  VideoProgressIndicator(_videoController, allowScrubbing: true),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.event.description, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 columns for images
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: widget.event.images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => _showFullImage(context, widget.event.images[index]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(widget.event.images[index], fit: BoxFit.cover),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void _showFullImage(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: EventsScreen(),
  ));
}
