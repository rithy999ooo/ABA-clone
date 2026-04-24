import 'package:flutter/material.dart';

const kBg = Color(0xFF0B1220);
const kCard = Color(0xFF111A2E);
const kDivider = Color(0xFF1F2A44);

const kTextPrimary = Colors.white;
const kTextSecondary = Color(0xFF9AA4B2);

const kCyan = Color(0xFF00C2FF);

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      appBar: _buildAppBar(context, 'ទូទាត់', Icons.attach_money_rounded),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== TITLE =====
            const Text(
              'Pay To',
              style: TextStyle(
                color: kTextPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 12),

            // ===== SEARCH BOX =====
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: kCard,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: kDivider),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search_rounded, color: kTextSecondary, size: 20),
                  SizedBox(width: 10),
                  Text(
                    'Search account or phone...',
                    style: TextStyle(color: kTextSecondary, fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ===== RECENT =====
            const Text(
              'Recent',
              style: TextStyle(
                color: kTextPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 12),

            // ===== LIST =====
            ...['Sokha', 'Dara', 'Mony'].map(
              (name) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: kCard,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: kDivider),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: kCyan.withOpacity(0.2),
                      child: Text(
                        name[0],
                        style: const TextStyle(
                          color: kCyan,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          color: kTextPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: kTextSecondary,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
}
