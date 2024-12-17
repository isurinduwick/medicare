import 'package:flutter/material.dart';
import 'login_page.dart';
import 'onboarding_page.dart';
import '../widgets/dot_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/360_F_707893394_5DEhlBjWOmse1nyu0rC9T7ZRvsAFDkYC.jpg",
      "title": "Medicare simplifies healthcare",
      "description":
          "Medicare simplifies healthcare with features like appointment booking, AI-driven health insights, and medication reminders. Manage your health effortlessly—all in one app."
    },
    {
      "image": "assets/giphy.gif",
      "title": "Schedule Appointments",
      "description": "Easily book appointments and manage your healthcare schedule."
    },
    {
      "image": "assets/istockphoto-479378798-612x612.jpg",
      "title": "Get Health Insights",
      "description": "Receive personalized health tips powered by AI-driven insights."
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _goToLoginPage();
    }
  }

  void _goToLoginPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 254, 254),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _onboardingData.length,
                itemBuilder: (context, index) {
                  return OnboardingPage(
                    imagePath: _onboardingData[index]["image"]!,
                    title: _onboardingData[index]["title"]!,
                    description: _onboardingData[index]["description"]!,
                  );
                },
              ),
            ),
            // Bottom navigation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip Button
                  TextButton(
                    onPressed: _goToLoginPage,
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Color.fromRGBO(7, 7, 7, 0.702), fontSize: 16),
                    ),
                  ),
                  // Dots Indicator
                  Row(
                    children: List.generate(
                      _onboardingData.length,
                      (index) => DotIndicator(isActive: _currentPage == index),
                    ),
                  ),
                  // Next Button
                  ElevatedButton(
                    onPressed: _goToNextPage,
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Icon(Icons.arrow_forward, color: Color.fromARGB(255, 237, 234, 234)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
