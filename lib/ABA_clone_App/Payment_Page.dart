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
    // ✅ DATA (correct place)
    final transactions = [
      {
        "title": "ABA Transfer",
        "date": "24 Apr 2026",
        "amount": -50.0,
        "isIncome": false,
      },
      {
        "title": "Salary",
        "date": "23 Apr 2026",
        "amount": 500.0,
        "isIncome": true,
      },
      {
        "title": "Coffee",
        "date": "22 Apr 2026",
        "amount": -3.5,
        "isIncome": false,
      },
      {
        "title": "ABA Transfer",
        "date": "24 Apr 2026",
        "amount": -50.0,
        "isIncome": false,
      },
      {
        "title": "Salary",
        "date": "23 Apr 2026",
        "amount": 500.0,
        "isIncome": true,
      },
      {
        "title": "Coffee",
        "date": "22 Apr 2026",
        "amount": -3.5,
        "isIncome": false,
      },
    ];

    final contacts = [
      'ABA Transfer',
      'Salary',
      'Coffee',
      'ABA Transfer',
      'Salary',
      'Coffee',
    ];

    return Scaffold(
      backgroundColor: kBg,
      appBar: _buildAppBar(context, 'ទូទាត់', Icons.attach_money_rounded),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ===== TITLE =====
            const Text(
              'Pay To',
              style: TextStyle(
                color: kTextPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 12),

            /// ===== SEARCH =====
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
                    style: TextStyle(color: kTextSecondary),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// ===== RECENT CONTACTS =====
            const Text(
              'Recent',
              style: TextStyle(
                color: kTextPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final name = contacts[index];

                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: kCyan.withOpacity(0.2),
                          child: Text(
                            name[0],
                            style: const TextStyle(
                              color: kCyan,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          name,
                          style: const TextStyle(
                            color: kTextPrimary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            /// ===== TRANSACTIONS =====
            const Text(
              'Transactions',
              style: TextStyle(
                color: kTextPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 12),

            /// ✅ LIST FIXED (no overflow)
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final tx = transactions[index];

                  return TxRow(
                    title: tx["title"] as String,
                    date: tx["date"] as String,
                    amount: tx["amount"] as double,
                    isIncome: tx["isIncome"] as bool,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ===== APP BAR =====
  AppBar _buildAppBar(BuildContext context, String title, IconData icon) {
    return AppBar(
      backgroundColor: kBg,
      elevation: 0,
      title: Text(title),
      actions: [IconButton(icon: Icon(icon), onPressed: () {})],
    );
  }
}

/// ===== TX ROW =====
class TxRow extends StatelessWidget {
  final String title;
  final String date;
  final double amount;
  final bool isIncome;

  const TxRow({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.isIncome,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            backgroundColor: isIncome
                ? Colors.green.withOpacity(0.2)
                : Colors.red.withOpacity(0.2),
            child: Icon(
              isIncome ? Icons.arrow_downward : Icons.arrow_upward,
              color: isIncome ? Colors.green : Colors.red,
            ),
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
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(color: kTextSecondary, fontSize: 12),
                ),
              ],
            ),
          ),

          Text(
            "${isIncome ? "+" : "-"}\$${amount.abs()}",
            style: TextStyle(
              color: isIncome ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
