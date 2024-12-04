import 'package:flutter/material.dart';

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final doctors = [
      {'name': 'Dr. John Doe', 'specialty': 'Cardiologist'},
      {'name': 'Dr. Jane Smith', 'specialty': 'Dermatologist'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Doctors')),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return Card(
            child: ListTile(
              title: Text(doctor['name']!),
              subtitle: Text(doctor['specialty']!),
            ),
          );
        },
      ),
    );
  }
}
