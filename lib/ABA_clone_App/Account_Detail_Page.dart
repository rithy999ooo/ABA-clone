import 'package:flutter/material.dart';

const kBg = Color(0xFF0B1220);
const kCard = Color(0xFF111A2E);
const kDivider = Color(0xFF1F2A44);

const kTextPrimary = Colors.white;
const kTextSecondary = Color(0xFF9AA4B2);

const kCyan = Color(0xFF00C2FF);
const kGreen = Color(0xFF2ECC71);
const kRed = Color(0xFFE74C3C);

class AccountDetailPage extends StatelessWidget {
  const AccountDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,

      appBar: _buildAppBar(
        context,
        'My Account',

        Icons.account_balance_wallet_rounded,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== Balance Card =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF131F35), Color(0xFF0D1628)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: kDivider),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Balance',
                    style: TextStyle(color: kTextSecondary, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '\$4,285.50',
                    style: TextStyle(
                      color: kTextPrimary,
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _chip(Icons.trending_up_rounded, '+2.4%', kGreen),
                      const SizedBox(width: 8),
                      _chip(Icons.calendar_today_rounded, 'This Month', kCyan),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ===== Account Details =====
            const Text(
              'Account Details',
              style: TextStyle(
                color: kTextPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),

            Container(
              decoration: BoxDecoration(
                color: kCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: kDivider),
              ),
              child: Column(
                children: [
                  _detailRow(
                    Icons.person_outline_rounded,
                    'Account Name',
                    'Rithy',
                  ),
                  _dividerLine(),
                  _detailRow(
                    Icons.tag_rounded,
                    'Account No.',
                    '1234 5678 9012',
                  ),
                  _dividerLine(),
                  _detailRow(
                    Icons.account_balance_rounded,
                    'Account Type',
                    'Savings',
                  ),
                  _dividerLine(),
                  _detailRow(
                    Icons.location_on_outlined,
                    'Branch',
                    'Phnom Penh Central',
                  ),
                  _dividerLine(),
                  _detailRow(Icons.verified_outlined, 'Status', 'Active'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ===== Transactions =====
            const Text(
              'Recent Transactions',
              style: TextStyle(
                color: kTextPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),

            Container(
              decoration: BoxDecoration(
                color: kCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: kDivider),
              ),
              child: Column(
                children: [
                  _txRow(
                    'Online Shopping',
                    Icons.shopping_bag_outlined,
                    'Apr 20',
                    '-\$45.00',
                    true,
                  ),
                  _dividerLine(),
                  _txRow(
                    'Salary Deposit',
                    Icons.arrow_downward_rounded,
                    'Apr 18',
                    '+\$1,200.00',
                    false,
                  ),
                  _dividerLine(),
                  _txRow(
                    'Restaurant',
                    Icons.restaurant_outlined,
                    'Apr 17',
                    '-\$12.50',
                    true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===== AppBar =====
  AppBar _buildAppBar(BuildContext context, String title, IconData icon) {
    return AppBar(
      backgroundColor: kBg,
      elevation: 0,
      title: Text(title),
      actions: [IconButton(icon: Icon(icon), onPressed: () {})],
    );
  }

  // ===== Chip =====
  static Widget _chip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 13),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ===== Detail Row =====
  static Widget _detailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Icon(icon, color: kCyan, size: 18),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(color: kTextSecondary, fontSize: 13),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: kTextPrimary,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ===== Transaction Row =====
  static Widget _txRow(
    String title,
    IconData icon,
    String date,
    String amount,
    bool isDebit,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: (isDebit ? kRed : kGreen).withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: isDebit ? kRed : kGreen, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: kTextPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(color: kTextSecondary, fontSize: 11),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              color: isDebit ? kRed : kGreen,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  // ===== Divider =====
  static Widget _dividerLine() =>
      const Divider(color: kDivider, height: 1, indent: 16, endIndent: 16);
}
