import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medico')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: [
            _buildFeatureCard(
              icon: Icons.person,
              title: 'Doctors',
              onTap: () => Navigator.pushNamed(context, '/doctors'),
            ),
            _buildFeatureCard(
              icon: Icons.calendar_today,
              title: 'Appointments',
              onTap: () {}, // Add navigation later
            ),
            _buildFeatureCard(
              icon: Icons.video_call,
              title: 'Telemedicine',
              onTap: () {}, // Add navigation later
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(height: 10),
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
