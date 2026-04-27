import 'package:flutter/material.dart';
import 'package:flutter_abaclone_1/ABA_clone_App/ABA_home_sreen.dart';

class GiftCardPage extends StatelessWidget {
  const GiftCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABA ECash',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Khmer',
        scaffoldBackgroundColor: const Color(0xFF0D1B2A),
      ),
      home: const WithdrawScreen(),
    );
  }
}

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  double _sliderValue = 100;
  bool _isUSD = true;
  final TextEditingController _noteController = TextEditingController();

  static const double _minAmount = 100;
  static const double _maxAmount = 1000;

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image / gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0A1628),
                  Color(0xFF112240),
                  Color(0xFF1A1A2E),
                ],
              ),
            ),
          ),

          // Angkor Wat silhouette illustration (painted overlay)
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            height: 280,
            child: CustomPaint(painter: AngkorWatPainter()),
          ),

          // Main content
          SafeArea(
            child: Column(
              children: [
                // App Bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ABABankHomeScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(width: 8),

                      const Text(
                        'ABA ធ្នើប្រាក់',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // ECash logo
                const SizedBox(height: 20),
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Color(0xFF00C896),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      'ECASH',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),
                const Text(
                  'ធ្នើប្រាក់តាមកូដ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 24),

                // Form card
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 8),
                    decoration: const BoxDecoration(
                      color: Color(0xFF1C2A3A),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Source account
                          _sectionLabel('គ្រឹះស្ថានគណនីរបស់អ្នក'),
                          const SizedBox(height: 8),
                          _dropdownField(),

                          const SizedBox(height: 20),

                          // Currency selector
                          _sectionLabel(
                            'គ្រឹះស្ថានចំនួនទឹកប្រាក់ដែលលុបក្រូឆ្នក',
                          ),
                          const SizedBox(height: 8),
                          _currencyToggle(),

                          const SizedBox(height: 16),

                          // Amount slider
                          _amountSlider(),

                          const SizedBox(height: 8),
                          _infoNote(),

                          const SizedBox(height: 16),

                          // Note field
                          _noteField(),

                          const SizedBox(height: 24),

                          // Summary
                          _summarySection(),

                          const SizedBox(height: 24),

                          // Withdraw button
                          _withdrawButton(),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Text(
      text,
      style: const TextStyle(color: Color(0xFF8899AA), fontSize: 12),
    );
  }

  Widget _dropdownField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF243447),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2E4060), width: 1),
      ),
      child: Row(
        children: [
          const Icon(Icons.credit_card, color: Color(0xFF8899AA), size: 20),
          const SizedBox(width: 12),
          const Text(
            'Savings: ',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          const Text(
            '0.97 USD',
            style: TextStyle(color: Color(0xFF00C896), fontSize: 15),
          ),
          const Spacer(),
          const Icon(Icons.keyboard_arrow_down, color: Color(0xFF8899AA)),
        ],
      ),
    );
  }

  Widget _currencyToggle() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF243447),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2E4060)),
      ),
      child: Row(
        children: [
          _toggleOption(
            'ខ្មែររៀល',
            !_isUSD,
            () => setState(() => _isUSD = false),
          ),
          _toggleOption(
            'ដុល្លារអាមេរិក',
            _isUSD,
            () => setState(() => _isUSD = true),
          ),
        ],
      ),
    );
  }

  Widget _toggleOption(String label, bool selected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF0099FF) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                selected ? Icons.attach_money : Icons.info_outline,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _amountSlider() {
    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: const Color(0xFF0099FF),
            inactiveTrackColor: const Color(0xFF2E4060),
            thumbColor: const Color(0xFF0099FF),
            overlayColor: const Color(0xFF0099FF33),
            valueIndicatorColor: const Color(0xFF0099FF),
            valueIndicatorTextStyle: const TextStyle(color: Colors.white),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
            showValueIndicator: ShowValueIndicator.always,
          ),
          child: Slider(
            min: _minAmount,
            max: _maxAmount,
            value: _sliderValue,
            divisions: 18,
            label: '\$${_sliderValue.toStringAsFixed(0)}',
            onChanged: (val) => setState(() => _sliderValue = val),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '\$100',
                style: TextStyle(color: Color(0xFF8899AA), fontSize: 12),
              ),
              Text(
                '\$1,000',
                style: TextStyle(color: Color(0xFF8899AA), fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _infoNote() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A3040),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: Color(0xFF8899AA), size: 16),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'ATM ផ្តល់តែប្រតិបត្តិការប្រាក់ \$100 ប៉ុណ្ណោះ។ សូមបញ្ចូលទៅ ដល់គ្រឹះស្ថានប្រើប្រាស់ ប្រសិនបើទ្រូការគ្រប់គ្រងស្ត្រូប្រាក់ច្រើនជាងនេះ។',
              style: TextStyle(
                color: Color(0xFF8899AA),
                fontSize: 12,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _noteField() {
    return TextField(
      controller: _noteController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'វិណ្ណ (មិនដាក់ក៏បាន)',
        hintStyle: const TextStyle(color: Color(0xFF8899AA)),
        prefixIcon: const Icon(
          Icons.edit_outlined,
          color: Color(0xFF8899AA),
          size: 18,
        ),
        filled: true,
        fillColor: const Color(0xFF243447),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF2E4060)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF2E4060)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF0099FF)),
        ),
      ),
    );
  }

  Widget _summarySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'សង្ខេប',
          style: TextStyle(
            color: Color(0xFF0099FF),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'ចំនួនដែលត្រូវដក:',
              style: TextStyle(color: Color(0xFF8899AA), fontSize: 14),
            ),
            Text(
              '${_sliderValue.toStringAsFixed(2)} USD',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _withdrawButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE8453C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
        ),
        child: const Text(
          'ធ្នើ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Simple Angkor Wat silhouette painter
class AngkorWatPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF0D1E30).withOpacity(0.85)
      ..style = PaintingStyle.fill;

    final path = Path();
    final w = size.width;
    final h = size.height;

    // Ground
    path.moveTo(0, h * 0.85);

    // Left towers
    path.lineTo(w * 0.05, h * 0.85);
    path.lineTo(w * 0.05, h * 0.6);
    path.lineTo(w * 0.08, h * 0.55);
    path.lineTo(w * 0.11, h * 0.6);
    path.lineTo(w * 0.11, h * 0.75);
    path.lineTo(w * 0.18, h * 0.75);
    path.lineTo(w * 0.18, h * 0.5);
    path.lineTo(w * 0.21, h * 0.42);
    path.lineTo(w * 0.24, h * 0.5);
    path.lineTo(w * 0.24, h * 0.7);

    // Center main tower
    path.lineTo(w * 0.35, h * 0.7);
    path.lineTo(w * 0.35, h * 0.45);
    path.lineTo(w * 0.38, h * 0.38);
    path.lineTo(w * 0.42, h * 0.28);
    path.lineTo(w * 0.46, h * 0.2);
    path.lineTo(w * 0.5, h * 0.1);
    path.lineTo(w * 0.54, h * 0.2);
    path.lineTo(w * 0.58, h * 0.28);
    path.lineTo(w * 0.62, h * 0.38);
    path.lineTo(w * 0.65, h * 0.45);
    path.lineTo(w * 0.65, h * 0.7);

    // Right towers (mirror)
    path.lineTo(w * 0.76, h * 0.7);
    path.lineTo(w * 0.76, h * 0.5);
    path.lineTo(w * 0.79, h * 0.42);
    path.lineTo(w * 0.82, h * 0.5);
    path.lineTo(w * 0.82, h * 0.75);
    path.lineTo(w * 0.89, h * 0.75);
    path.lineTo(w * 0.89, h * 0.6);
    path.lineTo(w * 0.92, h * 0.55);
    path.lineTo(w * 0.95, h * 0.6);
    path.lineTo(w * 0.95, h * 0.85);

    path.lineTo(w, h * 0.85);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.close();

    canvas.drawPath(path, paint);

    // Reflection / water
    final waterPaint = Paint()
      ..color = const Color(0xFF071525).withOpacity(0.6)
      ..style = PaintingStyle.fill;

    final waterPath = Path();
    waterPath.moveTo(0, h * 0.85);
    waterPath.lineTo(w, h * 0.85);
    waterPath.lineTo(w, h);
    waterPath.lineTo(0, h);
    waterPath.close();
    canvas.drawPath(waterPath, waterPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
