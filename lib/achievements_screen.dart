import 'package:flutter/material.dart';

class Achievement {
  final String title;
  final String description;
  final String year;
  final String category;
  final String imageUrl;

  Achievement({
    required this.title,
    required this.description,
    required this.year,
    required this.category,
    required this.imageUrl,
  });
}

class AchievementsScreen extends StatefulWidget {
  @override
  _AchievementsScreenState createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  List<Achievement> achievements = [
    Achievement(
      title: "GRADE 12 ICT BATCH 2024-2025 FOR BEING CSS NC II COMPETENT",
      description: "CONGRATULATIONS GRADE 12 ICT BATCH 2024-2025 FOR BEING CSS NC II COMPETENT.",
      year: "2025",
      category: "Academic",
      imageUrl: "images/ach1.png",
    ),
    Achievement(
      title: "IponanONE Youth Day Celebration 2024",
      description: "Nirepresenta ng mga mag-aaral mula sa Grade 12 HUMSS B Grade 12 at ABM ang Iponan NHS at naiuwi ang sumusunod na parangal.",
      year: "2024",
      category: "Academic",
      imageUrl: "images/ach2.png",
    ),
    Achievement(
      title: "District Meet 2024-2025",
      description: "District Meet 2024-2025 | 12/6/24 | Via Acera & Rodriguez",
      year: "2024",
      category: "Sports",
      imageUrl: "images/ach3.png",
    ),
    Achievement(
      title: "Division Meet para sa larong Baseball! ",
      description: "Iponan vs pagatpat",
      year: "2024",
      category: "Sports",
      imageUrl: "images/ach4.png",
    ),
    Achievement(
      title: "Divisions Schools Press Conference",
      description: "Iponan National High School campus journalists!",
      year: "2024",
      category: "Academic",
      imageUrl: "images/ach5.png",
    ),
    Achievement(
      title: "VSR Radio Station at Agos News Express!",
      description: "Radio Broadcasting Team!",
      year: "2024",
      category: "Academic",
      imageUrl: "images/ach5.png",
    ),

    // Add more achievements if necessary
  ];

  String selectedCategory = 'All';
  String selectedYear = 'All Years';

  List<String> categories = ['All', 'Academic', 'Sports'];
  List<String> years = ['All Years', '2024', '2025'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Achievements"),
        backgroundColor: Colors.blueAccent, // White background for the app bar

        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              _showFilterDialog(context);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image without darken effect
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
              itemCount: achievements.length,
              itemBuilder: (context, index) {
                final achievement = achievements[index];
                // Apply filtering
                if ((_isCategorySelected(achievement.category) && _isYearSelected(achievement.year))) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 5,
                    child: InkWell(
                      onTap: () => _showAchievementDetails(context, achievement),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                            child: Image.asset(
                              achievement.imageUrl,
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
                                Text(
                                  achievement.title,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(
                                      achievement.category == "Academic" ? Icons.school : Icons.sports,
                                      color: achievement.category == "Academic" ? Colors.blue : Colors.orange,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "${achievement.category} - ${achievement.year}",
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                         
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container();  // Don't show items that don't match the filter
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  bool _isCategorySelected(String category) {
    return selectedCategory == 'All' || category == selectedCategory;
  }

  bool _isYearSelected(String year) {
    return selectedYear == 'All Years' || year == selectedYear;
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Filter Achievements"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Category Dropdown
            DropdownButton<String>(
              value: selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
                Navigator.pop(context);  // Close the dialog after selection
              },
              items: categories.map<DropdownMenuItem<String>>((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            // Year Dropdown
            DropdownButton<String>(
              value: selectedYear,
              onChanged: (String? newValue) {
                setState(() {
                  selectedYear = newValue!;
                });
                Navigator.pop(context);  // Close the dialog after selection
              },
              items: years.map<DropdownMenuItem<String>>((String year) {
                return DropdownMenuItem<String>(
                  value: year,
                  child: Text(year),
                );
              }).toList(),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text("Close"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void _showAchievementDetails(BuildContext context, Achievement achievement) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(achievement.title),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    achievement.category == "Academic" ? Icons.school : Icons.sports,
                    color: achievement.category == "Academic" ? Colors.blue : Colors.orange,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Category: ${achievement.category}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text("Year: ${achievement.year}", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Description: ${achievement.description}", style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: Text("Close"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

 
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AchievementsScreen(),
  ));
}
