import 'package:flutter/material.dart';
import 'register_screen.dart'; // ប្រាកដថាអ្នកបាន import file នេះ

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState(); // ប្តូរឈ្មោះឱ្យត្រូវគ្នា
}

class _HomeScreenState extends State<HomeScreen> {
  void _navigateToRegister() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const RegisterScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // បង្កើត Animation រីក (Scale)
          var scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          );

          var fadeAnimation = Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeIn));

          return FadeTransition(
            opacity: fadeAnimation,
            child: ScaleTransition(scale: scaleAnimation, child: child),
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00698A), Color(0xFF00374C)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "ABA MOBILE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 200),

            // ប៊ូតុង ភាសាខ្មែរ
            _buildLanguageButton("ភាសាខ្មែរ"),

            const SizedBox(height: 30),

            // ប៊ូតុង English
            _buildLanguageButton("English"),

            const SizedBox(height: 30),

            // ប៊ូតុង Chinese
            _buildLanguageButton("Chinese"),
          ],
        ),
      ),
    );
  }

  // Widget ជំនួយសម្រាប់បង្កើតប៊ូតុង ដើម្បីកុំឱ្យកូដស្មុគស្មាញ
  Widget _buildLanguageButton(String label) {
    return SizedBox(
      width: 400,
      height: 50,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 226, 30, 30),
              Color.fromARGB(255, 223, 77, 77),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ElevatedButton(
          onPressed: _navigateToRegister, // នៅពេលចុច វានឹងទៅកាន់ RegisterScreen
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
