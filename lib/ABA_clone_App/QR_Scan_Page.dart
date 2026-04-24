import 'package:flutter/material.dart';

// ===== THEME COLORS =====
const kBg = Color(0xFF0B1220);
const kCard = Color(0xFF111A2E);
const kDivider = Color(0xFF1F2A44);

const kTextPrimary = Colors.white;
const kTextSecondary = Color(0xFF9AA4B2);

const kCyan = Color(0xFF00C2FF);
const kGreen = Color(0xFF2ECC71);

/// =======================================================
/// QR SCAN PAGE
/// =======================================================
class QRScanPage extends StatelessWidget {
  const QRScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      appBar: _buildAppBar(context, 'ABA ស្គែន', Icons.qr_code_scanner_rounded),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                border: Border.all(color: kCyan, width: 3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.qr_code_2_rounded,
                color: kCyan,
                size: 160,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Scan QR Code',
              style: TextStyle(
                color: kTextPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Point camera at a QR code to pay',
              style: TextStyle(color: kTextSecondary, fontSize: 14),
            ),

            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              decoration: BoxDecoration(
                color: kCyan,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Open Camera',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// =======================================================
/// FAVORITES PAGE
/// =======================================================
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      appBar: _buildAppBar(context, 'Favorites', Icons.star_border_rounded),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Favourite Contacts',
              style: TextStyle(
                color: kTextPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 16),

            ...['Sokha ★', 'Dara ★', 'Mony ★'].map(
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
                      backgroundColor: kGreen.withOpacity(0.2),
                      child: Text(
                        name[0],
                        style: const TextStyle(
                          color: kGreen,
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
                      Icons.star_rounded,
                      color: Color(0xFFFFD700),
                      size: 20,
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
}

/// =======================================================
/// APP BAR
/// =======================================================
AppBar _buildAppBar(BuildContext context, String title, IconData icon) {
  return AppBar(
    backgroundColor: kBg,
    elevation: 0,
    title: Text(title),
    actions: [IconButton(icon: Icon(icon), onPressed: () {})],
  );
}
