import 'package:flutter/material.dart';
import 'register_screen.dart';

const kBg = Color(0xFF0A0E1A);
const kCard = Color(0xFF131825);
const kDivider = Color(0xFF1E2D45);
const kTextPrimary = Colors.white;
const kTextSecondary = Color(0xFF8A9BB5);
const kCyan = Color(0xFF00C8FF);

@override
Widget build(BuildContext context) {
  return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfilePage(),
  );
}

// ===== PROFILE PAGE =====
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,

      appBar: AppBar(
        backgroundColor: kBg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("ABA Profile", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),

      body: Column(
        children: [
          const SizedBox(height: 20),

          // PROFILE
          Column(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: kCyan, width: 2),
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTajPeGBmvhWwp9cgkPYj-aoBKq5xEARDV5QQ&s",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Rithy",
                style: TextStyle(
                  color: kTextPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "ID: 3925742",
                style: TextStyle(color: kTextSecondary, fontSize: 13),
              ),
            ],
          ),

          const SizedBox(height: 25),

          // MENU
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _item(context, Icons.person_outline, "Profile Information"),
                _item(context, Icons.lock_outline, "Security"),
                _item(context, Icons.grid_view_outlined, "Preferences"),
                _item(context, Icons.language, "Language"),
                _item(context, Icons.phone_outlined, "Contact Support"),

                // ✅ LOGOUT FIX
                _item(
                  context,
                  Icons.logout,
                  "Logout",
                  isRed: true,
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "ABA BANK",
              style: TextStyle(
                color: kTextSecondary,
                fontSize: 12,
                letterSpacing: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ITEM
  Widget _item(
    BuildContext context,
    IconData icon,
    String title, {
    bool isRed = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: kCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: kDivider),
        ),
        child: Row(
          children: [
            Icon(icon, color: isRed ? Colors.red : kCyan),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(color: isRed ? Colors.red : kTextPrimary),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: kTextSecondary,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
