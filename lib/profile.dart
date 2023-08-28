import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Image(
          fit: BoxFit.cover,
          height: double.infinity,
          image: AssetImage('assets/img/profile.jpg')),
    );
  }
}
