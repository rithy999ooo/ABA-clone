import 'package:flutter/material.dart';
import 'register_screen3.dart';

class RegisterScreen2 extends StatefulWidget {
  const RegisterScreen2({super.key});

  @override
  State<RegisterScreen2> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<RegisterScreen2> {
  void goToRegister3() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterScreen3()),
    );
  }

  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isAllChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002D3D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: const Text("ABA' Mobile", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "លក្ខខណ្ឌនៃការប្រើប្រាស់ ABA\nMobile",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "សូមអានលក្ខខណ្ឌខាងក្រោមអោយបានច្បាស់លាស់ មុននឹងបើកដំណើរការកម្មវិធី ABA Mobile។",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 15),
            const Text(
              "ដោយចុច “យល់ព្រម” អ្នកបានបញ្ជាក់ថាអ្នកយល់ព្រមអនុវត្តតាមលក្ខខណ្ឌនៃកម្មវិធី ABA Mobile និង គណនីរហ័ស។",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),

            const Spacer(), // រុញផ្នែកខាងក្រោមឱ្យទៅបាតអេក្រង់
            // ផ្នែក Checkbox
            _buildCheckboxRow(
              "ខ្ញុំបានអាន និងយល់ព្រមតាម លក្ខខណ្ឌកម្មវិធី ABA Mobile",
              isChecked1,
              (val) {
                setState(() => isChecked1 = val!);
              },
            ),
            _buildCheckboxRow(
              "ខ្ញុំបានអាន និងយល់ព្រមតាម លក្ខខណ្ឌនៃការប្រើប្រាស់ សេវារបស់ ABA",
              isChecked2,
              (val) {
                setState(() => isChecked2 = val!);
              },
            ),
            const Divider(color: Colors.white24),
            _buildCheckboxRow(
              "ខ្ញុំព្រមទទួលយកលក្ខខណ្ឌទាំងអស់ខាងលើ",
              isAllChecked,
              (val) {
                setState(() {
                  isAllChecked = val!;
                  isChecked1 = val;
                  isChecked2 = val;
                });
              },
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: (isChecked1 && isChecked2) ? goToRegister3 : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: (isChecked1 && isChecked2)
                      ? const Color(0xFFE21E1E)
                      : const Color(0xFF00374C),
                  disabledBackgroundColor: Colors.white10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.white24),
                  ),
                ),
                child: Text(
                  "យល់ព្រម",
                  style: TextStyle(
                    color: (isChecked1 && isChecked2)
                        ? Colors.white
                        : Colors.white54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxRow(String text, bool value, Function(bool?) onChanged) {
    return Row(
      children: [
        Theme(
          data: ThemeData(unselectedWidgetColor: Colors.white54),
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.cyan,
            shape: const CircleBorder(), // ធ្វើឱ្យ Checkbox មូលដូចក្នុងរូប
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ),
      ],
    );
  }
}
