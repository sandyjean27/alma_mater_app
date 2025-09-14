import 'package:flutter/material.dart';

class Strand {
  final String name;
  final List<String> subjects;

  Strand({required this.name, required this.subjects});
}

class StrandsScreen extends StatelessWidget {
  final List<Strand> strands = [
    Strand(name: "STEM", subjects: ["Mathematics", "Science", "Technology"]),
    Strand(name: "ICT", subjects: ["Computer Science", "Programming", "Information Technology"]),
    Strand(name: "HUMMS", subjects: ["Humanities", "Social Studies", "Arts"]),
    Strand(name: "HE", subjects: ["Home Economics", "Food Technology", "Entrepreneurship"]),
    Strand(name: "ABM", subjects: ["Accounting", "Business Management", "Marketing"]),
    Strand(name: "TVL", subjects: ["Culinary Arts", "Electrical Installation", "Welding Technology"]),
  ];

  final String backgroundImage = 'images/bg.png'; // Background image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Strands", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 10,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backgroundImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: strands.length,
                itemBuilder: (context, index) {
                  final strand = strands[index];
                  return _buildFancyCard(strand);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFancyCard(Strand strand) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(0, 4),
            color: Colors.black26,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.school, color: Colors.white, size: 35),
        ),
        title: Text(
          strand.name,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
            letterSpacing: 1.2,
          ),
        ),
        subtitle: Text(
          strand.subjects.join(', '),
          style: TextStyle(fontSize: 16, color: Colors.blueGrey),
        ),
      ),
    );
  }
}
