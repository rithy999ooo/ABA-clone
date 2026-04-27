import 'package:flutter/material.dart';
import 'package:flutter_abaclone_1/ABA_clone_App/ABA_home_sreen.dart';

class MiniAppPage extends StatelessWidget {
  const MiniAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABA Mini Apps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0A2540),
      ),
      home: const MiniAppScreen(),
    );
  }
}

class MiniAppScreen extends StatelessWidget {
  const MiniAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A2540),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeroSection(),
                    const SizedBox(height: 8),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF0F2D4A),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          _buildDiscoverSection(),
                          const SizedBox(height: 24),
                          _buildCategoriesSection(),
                          const SizedBox(height: 24),
                          _buildPopularSection(),
                          const SizedBox(height: 24),
                        ],
                      ),
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

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const ABABankHomeScreen()),
                (route) => false,
              );
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'ABA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'Mini Apps',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  "Instantly access services from\nABA Bank's partners.",
                  style: TextStyle(
                    color: Color(0xFFB0C4D8),
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          _buildAppIconGrid(),
        ],
      ),
    );
  }

  Widget _buildAppIconGrid() {
    return SizedBox(
      width: 110,
      height: 90,
      child: GridView.count(
        crossAxisCount: 2,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: [
          _buildAppIcon(
            shape: BoxShape.rectangle,
            color: const Color(0xFFD4C5A9),
          ),
          _buildAppIcon(
            shape: BoxShape.rectangle,
            color: const Color(0xFFB0B8C8),
            isDiamond: true,
          ),
          _buildAppIcon(shape: BoxShape.circle, color: const Color(0xFF8090A8)),
          _buildAppIcon(
            shape: BoxShape.rectangle,
            color: const Color(0xFFD4C5A9),
          ),
        ],
      ),
    );
  }

  Widget _buildAppIcon({
    required BoxShape shape,
    required Color color,
    bool isDiamond = false,
  }) {
    Widget child = Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        shape: shape,
        borderRadius: shape == BoxShape.rectangle
            ? BorderRadius.circular(10)
            : null,
        border: Border.all(color: color.withOpacity(0.5), width: 1),
      ),
    );

    if (isDiamond) {
      return Transform.rotate(
        angle: 0.785398,
        child: Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color.withOpacity(0.5), width: 1),
          ),
        ),
      );
    }

    return child;
  }

  Widget _buildDiscoverSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Discover',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(child: _buildCinemaCard()),
              const SizedBox(width: 12),
              Expanded(child: _buildGiftCard()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCinemaCard() {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: const Color(0xFF1A3A5C),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned(
            bottom: -10,
            right: -10,
            child: Icon(
              Icons.chair,
              size: 80,
              color: Colors.blue.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Cinema Ticket',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Book & Watch.',
                  style: TextStyle(color: Color(0xFFB0C4D8), fontSize: 12),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    '10% off Prime Cineplex',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
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

  Widget _buildGiftCard() {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: const Color(0xFF1A3D40),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned(
            bottom: -5,
            right: -5,
            child: Icon(
              Icons.card_giftcard,
              size: 80,
              color: Colors.amber.withOpacity(0.4),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Gift',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Card',
                      style: TextStyle(
                        color: Colors.amber[400],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                const Text(
                  'Shop & Gift.',
                  style: TextStyle(color: Color(0xFFB0C4D8), fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection() {
    final categories = [
      {'label': 'Government\nServices', 'icon': Icons.account_balance},
      {'label': 'Insurance', 'icon': Icons.umbrella},
      {'label': 'Transport', 'icon': Icons.directions_car},
      {'label': 'Internet & TV', 'icon': Icons.router},
      {'label': 'Entertainment\n& Art', 'icon': Icons.sports_esports},
      {'label': 'Travel', 'icon': Icons.flight},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Categories',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Color(0xFF4FC3F7),
                    size: 14,
                  ),
                  const SizedBox(width: 2),
                  const Text(
                    'All Locations',
                    style: TextStyle(color: Color(0xFF4FC3F7), fontSize: 13),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF4FC3F7),
                    size: 18,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.0,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return _buildCategoryCard(
                label: categories[index]['label'] as String,
                icon: categories[index]['icon'] as IconData,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard({required String label, required IconData icon}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A3050),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -8,
            right: -8,
            child: Icon(icon, size: 55, color: Colors.white.withOpacity(0.15)),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '🔥 Popular in Area',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 90,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemCount: 4,
            itemBuilder: (context, index) => _buildPopularCard(index),
          ),
        ),
      ],
    );
  }

  Widget _buildPopularCard(int index) {
    final items = [
      {'name': 'Garden City Water Park', 'category': 'Entertainment & Art'},
      {'name': 'Ebook Cambodia', 'category': 'Education'},
      {'name': 'SmartPhone Store', 'category': 'Shopping'},
      {'name': 'Lucky Supermarket', 'category': 'Grocery'},
    ];

    return Container(
      width: 220,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A3050),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.store, color: Color(0xFF0A2540), size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  items[index]['name']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  items[index]['category']!,
                  style: const TextStyle(
                    color: Color(0xFFB0C4D8),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
