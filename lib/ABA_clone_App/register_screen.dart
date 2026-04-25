import 'package:flutter/material.dart';
import 'register_screen2.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // ១. ប្តូរឈ្មោះ Function កុំឱ្យដូចឈ្មោះ Class
  void goToRegister2() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterScreen2()),
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
              "ABA' Mobile",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 200),
            _buildABAButton(
              icon: Icons.phone_android,
              title: "បើកដំណើរការជាមួយ ABA Mobile",
              subtitle: "សម្រាប់អ្នកមានគណនី ABA ស្រាប់",
              isRed: true,
            ),
            const SizedBox(height: 20),

            const SizedBox(height: 20),
            _buildABAButton(
              icon: Icons.account_balance_wallet,
              title: "បើក គណនីរហ័ស",
              subtitle: "បើកគណនី ABA ដំបូងរបស់អ្នកក្នុងរយៈពេលពីរីបីនាទី",
              isRed: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildABAButton({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isRed,
  }) {
    return Container(
      width: 380,
      height: 80,
      decoration: BoxDecoration(
        gradient: isRed
            ? const LinearGradient(
                colors: [Color(0xFFE21E1E), Color(0xFFDF4D4D)],
              )
            : null,
        color: isRed ? null : Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: isRed ? null : Border.all(color: Colors.white24),
      ),
      child: ElevatedButton(
        // ២. ហៅប្រើ function នៅទីនេះ
        onPressed: goToRegister2,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 35),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white54,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
