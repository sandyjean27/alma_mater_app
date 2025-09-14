import 'package:flutter/material.dart';

class Teacher {
  final String name;
  final String subject;
  final String photoUrl;
  final double rating; // Add rating field

  Teacher({
    required this.name,
    required this.subject,
    required this.photoUrl,
    required this.rating, // Initialize rating
  });
}

class TeachersScreen extends StatefulWidget {
  @override
  _TeachersScreenState createState() => _TeachersScreenState();
}

class _TeachersScreenState extends State<TeachersScreen> {
  String selectedGradeLevel = 'All';
  String selectedSubject = 'All';

  final Map<String, List<Teacher>> teachersByGrade = {
    'Junior High School': [
      Teacher(
        name: "Ms. Agumana",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Anay",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Mr. Alias",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Mrs. Alias",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Bajas",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Mr. Boborol",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Mr. Boloron",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Borbon",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Mrs. Cagurangan",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Ceniza",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Dagala",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Driz",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),Teacher(
        name: "Ms. Puerto",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Tenistrante",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Tubalado",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Vacalarez",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Wong",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Ybanez",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Mr. Zarzosa",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Gumera",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Ievent9n",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Illanaa",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Lecunan",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Mahayag",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Magno",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Maderse",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Mr. Oclarit",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Okit",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Adas",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Mr. Paday",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Mr. Presas",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Rabong",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Roble",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Rubin",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      Teacher(
        name: "Ms. Samijon",
        subject: "Teacher",
        photoUrl: "images/event9.png",
        rating: 4.5,
      ),
      
    ],
    'Senior High School': [
      Teacher(
        name: "Ms. Alagon",
        subject: "Coordinator",
        photoUrl: "images/event9.png",
        rating: 4.9,
      ),
      Teacher(
        name: "Ms. Cabezas",
        subject: "HUMSS",
        photoUrl: "images/event9.png",
        rating: 4.4,
      ),
      Teacher(
        name: "Mr. Culanse",
        subject: "ICT",
        photoUrl: "images/event9.png",
        rating: 4.2,
      ),
      Teacher(
        name: "Ms. Gamutan",
        subject: "ABM",
        photoUrl: "images/event9.png",
        rating: 4.7,
      ),
      Teacher(
        name: "Ms. Guerra",
        subject: "HUMSS",
        photoUrl: "images/event9.png",
        rating: 4.8,
      ),
      Teacher(
        name: "Ms. Llanderal",
        subject: "ABM",
        photoUrl: "images/event9.png",
        rating: 4.8,
      ),
      Teacher(
        name: "Ms. Nambatac",
        subject: "HE",
        photoUrl: "images/event9.png",
        rating: 4.8,
      ),
      Teacher(
        name: "Ms. TOLENTINO",
        subject: "ICT",
        photoUrl: "images/event9.png",
        rating: 4.8,
      ),
      Teacher(
        name: "Ms. Aceret",
        subject: "HE",
        photoUrl: "images/event9.png",
        rating: 4.8,
      ),
      Teacher(
        name: "Ms. Abu Habil",
        subject: "Sub",
        photoUrl: "images/event9.png",
        rating: 4.8,
      ),
      Teacher(
        name: "Ms. Cabahug",
        subject: "Registrar",
        photoUrl: "images/event9.png",
        rating: 4.8,
      ),
      Teacher(
        name: "Mr. Cael",
        subject: "HUMSS",
        photoUrl: "images/event9.png",
        rating: 4.8,
      ),
      Teacher(
        name: "Mr. Labajan",
        subject: "ICT",
        photoUrl: "images/event9.png",
        rating: 4.8,
      ),
      Teacher(
        name: "Ms. Palmares",
        subject: "ICT",
        photoUrl: "images/event9.png",
        rating: 4.8,
      ),
      Teacher(
        name: "Ms. Tongco",
        subject: "ICT",
        photoUrl: "images/event9.png",
        rating: 4.8,
      ),
      Teacher(
        name: "Ms. Torres",
        subject: "HUMSS",
        photoUrl: "images/event9.png",
        rating: 4.8,
      ),
      Teacher(
        name: "Ms. Luzica",
        subject: "Sub",
        photoUrl: "images/event9.png",
        rating: 4.8,
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    List<Teacher> filteredTeachers = [];
    if (selectedGradeLevel == 'All') {
      filteredTeachers = [
        ...teachersByGrade['Junior High School']!,
        ...teachersByGrade['Senior High School']!,
      ];
    } else {
      filteredTeachers = teachersByGrade[selectedGradeLevel]!;
    }

    filteredTeachers = filteredTeachers
        .where((teacher) => selectedSubject == 'All' || teacher.subject == selectedSubject)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Teachers'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        value: selectedGradeLevel,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedGradeLevel = newValue!;
                          });
                        },
                        items: ['All', 'Junior High School', 'Senior High School']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: DropdownButton<String>(
                        value: selectedSubject,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedSubject = newValue!;
                          });
                        },
                        items: [
                          'All',
                          'Coordinator',
                          'HUMSS',
                          'ICT',
                          'ABM',
                          'HE',
                          'Sub',
                          'Registrar',
                          'teacher'
                        ]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: filteredTeachers.length,
                    itemBuilder: (context, index) {
                      Teacher teacher = filteredTeachers[index];
                      return _buildTeacherCard(teacher);
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

  Widget _buildTeacherCard(Teacher teacher) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () => _showTeacherDetails(context, teacher),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                teacher.photoUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              teacher.name,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(teacher.subject, style: TextStyle(color: Colors.blueAccent)),
            SizedBox(height: 5),
            SizedBox(height: 5),
            _buildStarRating(teacher.rating), // Add star rating display
          ],
        ),
      ),
    );
  }

  Widget _buildStarRating(double rating) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return Icon(Icons.star, color: Colors.amber, size: 16);
        } else if (index == fullStars && hasHalfStar) {
          return Icon(Icons.star_half, color: Colors.amber, size: 16);
        } else {
          return Icon(Icons.star_border, color: Colors.amber, size: 16);
        }
      }),
    );
  }

  void _showTeacherDetails(BuildContext context, Teacher teacher) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(teacher.name),
        content: Text("Subject: ${teacher.subject}"),
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
