import 'package:flutter/material.dart';
import '/ABA_clone_App/ABA_home_sreen.dart';

class RegisterScreen4 extends StatelessWidget {
  const RegisterScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002D3D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          "ABA' បើកដំណើរការ",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Center(
              // លុប const ចេញពីទីនេះ
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTajPeGBmvhWwp9cgkPYj-aoBKq5xEARDV5QQ&s',
                    width: 50, // សាកល្បងដាក់ ១៥០ ឬ ២០០ ដើម្បីឱ្យសមនឹងអេក្រង់
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "តម្រូវអោយបង្កើតសោរមុខ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "សោរមុខ គឺជាបច្ចេកវិទ្យាស្គាល់ផ្ទៃមុខកម្រិតខ្ពស់បំផុតដែលបានរចនាឡើងដើម្បីឱ្យការប្រើប្រាស់ ABA របស់អ្នកមានសុវត្ថិភាពបំផុត។",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
            const SizedBox(height: 40),

            // បញ្ជីណែនាំ (Instructions)
            _buildInstruction(Icons.person_outline, "សូមប្រាកដថាជាមុខរបស់អ្នក"),
            _buildInstruction(
              Icons.camera_alt_outlined,
              "កញ្ចក់កាមេរ៉ា ត្រូវតែស្អាត មិនប្រឡាក់",
            ),
            _buildInstruction(
              Icons.wb_sunny_outlined,
              "ពន្លឺខាងក្រោយត្រូវមានពន្លឺគ្រប់គ្រាន់ និងច្បាស់ល្អ",
            ),
            _buildInstruction(
              Icons.visibility_outlined,
              "សូមប្រាកដថាផ្ទៃមុខរបស់អ្នក មើលឃើញច្បាស់ល្អ មិនមានពាក់ម៉ាស់ មួក ឬវ៉ែនតាខ្មៅ",
            ),

            const Spacer(),

            // ប៊ូតុង "ចាប់ផ្តើម"
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // កូដសម្រាប់បើកកាមេរ៉ាស្កេនមុខ
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ABABankHomeScreen(),
                    ),
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE21E1E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "ចាប់ផ្តើម",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget ជំនួយសម្រាប់បង្ហាញជួរណែនាំនីមួយៗ
  Widget _buildInstruction(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white10,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white70, size: 20),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
