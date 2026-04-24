import 'package:flutter/material.dart';

// ===== THEME COLORS =====
const kBg = Color(0xFF0B1220);
const kTextPrimary = Colors.white;
const kGreen = Color(0xFF2ECC71);
const kCyan = Color(0xFF00C2FF);
const kRed = Color(0xFFE74C3C);

class GiftCardPage extends StatelessWidget {
  const GiftCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      appBar: _buildAppBar(context, 'កាត', Icons.card_giftcard_rounded),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== HEADER CARD =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6C3FD4), Color(0xFF3F1FA8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.card_giftcard_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Gift Cards',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'Send joy to your loved ones',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Categories',
              style: TextStyle(
                color: kTextPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 12),

            // ===== GRID =====
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.6,
              children: [
                _giftCard(
                  'Shopping',
                  Icons.shopping_bag_outlined,
                  const Color(0xFFFF6B35),
                ),
                _giftCard('Dining', Icons.restaurant_outlined, kGreen),
                _giftCard('Travel', Icons.flight_outlined, kCyan),
                _giftCard('Entertainment', Icons.movie_outlined, kRed),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ===== GIFT CARD ITEM =====
  Widget _giftCard(String title, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: kTextPrimary,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ===== APP BAR =====
AppBar _buildAppBar(BuildContext context, String title, IconData icon) {
  return AppBar(
    backgroundColor: kBg,
    elevation: 0,
    title: Text(title),
    actions: [IconButton(icon: Icon(icon), onPressed: () {})],
  );
}
