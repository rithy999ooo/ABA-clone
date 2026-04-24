import 'package:flutter/material.dart';
import 'register_screen4.dart';

class RegisterScreen3 extends StatefulWidget {
  const RegisterScreen3({super.key});

  @override
  State<RegisterScreen3> createState() => _RegisterScreen3State();
}

class _RegisterScreen3State extends State<RegisterScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002D3D), // ពណ៌ផ្ទៃក្រោយ
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
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 50),
            // រូបតំណាង ទូរស័ព្ទ
            Center(
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.phone_android,
                  color: Colors.white70,
                  size: 50,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "លេខទូរស័ព្ទ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "ស៊ីមកាតដែលភ្ជាប់ទៅនឹងលេខដែលបានចុះឈ្មោះនៅ ABA ត្រូវតែនៅក្នុងទូរស័ព្ទនេះ។",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
            const SizedBox(height: 50),

            // ផ្នែកបញ្ចូលលេខទូរស័ព្ទ
            Row(
              children: [
                // លេខកូដប្រទេស
                Expanded(
                  flex: 2,
                  child: TextField(
                    readOnly: true,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    decoration: const InputDecoration(
                      labelText: "លេខកូដប្រទេស",
                      labelStyle: TextStyle(color: Colors.cyan, fontSize: 14),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),
                      ),
                    ),
                    controller: TextEditingController(text: "+855"),
                  ),
                ),
                const SizedBox(width: 20),
                // លេខទូរស័ព្ទ
                Expanded(
                  flex: 5,
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    decoration: const InputDecoration(
                      labelText: "លេខទូរស័ព្ទ",
                      labelStyle: TextStyle(color: Colors.cyan, fontSize: 14),
                      hintText: "012 345 678",
                      hintStyle: TextStyle(color: Colors.white24),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 2),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const Spacer(),

            // ប៊ូតុង "បន្ទាប់"
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // កូដសម្រាប់ផ្ទេរទៅទំព័រទី ៤
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen4(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE21E1E), // ពណ៌ក្រហម ABA
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "បន្ទាប់",
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
}
