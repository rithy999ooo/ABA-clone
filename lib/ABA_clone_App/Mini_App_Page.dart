import 'package:flutter/material.dart';

// ===== THEME COLORS =====
const kBg = Color(0xFF0B1220);
const kTextPrimary = Colors.white;

/// =======================================================
/// MINI APP PAGE
/// =======================================================
class MiniAppPage extends StatelessWidget {
  const MiniAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final apps = [
      {
        'icon': Icons.electric_bolt_rounded,
        'label': 'Electricity',
        'color': 0xFFFFD700,
      },
      {
        'icon': Icons.water_drop_rounded,
        'label': 'Water Bill',
        'color': 0xFF00C8FF,
      },
      {'icon': Icons.wifi_rounded, 'label': 'Internet', 'color': 0xFF00D97E},
      {
        'icon': Icons.phone_android_rounded,
        'label': 'Mobile Top-Up',
        'color': 0xFFFF6B35,
      },
      {
        'icon': Icons.local_hospital_rounded,
        'label': 'Insurance',
        'color': 0xFFFF3B5C,
      },
      {'icon': Icons.school_rounded, 'label': 'Education', 'color': 0xFF6C3FD4},
      {'icon': Icons.tv_rounded, 'label': 'Cable TV', 'color': 0xFF00C8FF},
      {
        'icon': Icons.directions_bus_rounded,
        'label': 'Transport',
        'color': 0xFFFF6B35,
      },
      {'icon': Icons.more_horiz_rounded, 'label': 'More', 'color': 0xFF8A9BB5},
    ];

    return Scaffold(
      backgroundColor: kBg,
      appBar: _buildAppBar(context, 'មីនីអេប', Icons.apps_rounded),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: apps.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (_, i) {
            final color = Color(apps[i]['color'] as int);

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        DetailPage(title: apps[i]['label'] as String),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: color.withOpacity(0.3)),
                    ),
                    child: Icon(
                      apps[i]['icon'] as IconData,
                      color: color,
                      size: 26,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    apps[i]['label'] as String,
                    style: const TextStyle(
                      color: kTextPrimary,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

/// =======================================================
/// SIMPLE DETAIL PAGE (OPEN WHEN CLICK)
/// =======================================================
class DetailPage extends StatelessWidget {
  final String title;

  const DetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      appBar: AppBar(backgroundColor: kBg, title: Text(title)),
      body: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: kTextPrimary,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
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
