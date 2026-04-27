import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'Account_Detail_Page.dart';
import 'Cards_Page.dart';
import 'Payment_Page.dart';
import 'QR_Scan_Page.dart';
import 'Gift_Card_Page.dart';
import 'Mini_App_Page.dart';
import 'ABA_Business_Page.dart';
import 'Transfer_page.dart';
import 'Favorite_Payments_Page.dart';
import 'ProfilePage.dart';

// ─── Color Palette ───────────────────────────────────────────────────────────
const kBg = Color(0xFF0A0E1A);
const kCard = Color(0xFF131825);
const kCardAlt = Color(0xFF1A2235);
const kCyan = Color(0xFF00C8FF);
const kRed = Color(0xFFFF3B5C);
const kGreen = Color(0xFF00D97E);
const kTextPrimary = Color(0xFFFFFFFF);
const kTextSecondary = Color(0xFF8A9BB5);
const kDivider = Color(0xFF1E2D45);

// ─── Data Models ─────────────────────────────────────────────────────────────
class _ActionItem {
  final IconData icon;
  final String label;
  final bool isCyan;
  const _ActionItem({
    required this.icon,
    required this.label,
    this.isCyan = false,
  });
}

// ─── Promo Banner URLs ────────────────────────────────────────────────────────
// Replace these with your actual banner image URLs
const List<String> kPromoImages = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9g7V0xwcVHU09nNcMWM7lpjt2E0QLzaTGdg&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHwpX4LVM32j8UUu-JsfhP9_gdjyGbgMQf6g&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqMGEZGYGjDiNAoMxXuw7B89Jf9Q4W8YM9PQ&s',
];

// ─── App Entry ───────────────────────────────────────────────────────────────
class ABABankHomeScreen extends StatelessWidget {
  const ABABankHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABA Bank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: kBg, fontFamily: 'Roboto'),
      home: const HomeScreen(),
    );
  }
}

// ─── Home Screen ─────────────────────────────────────────────────────────────
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool _balanceVisible = false;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();
    _fadeAnim = CurvedAnimation(parent: _fadeController, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: FadeTransition(
        opacity: _fadeAnim,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                _buildTopBar(),
                const SizedBox(height: 16),
                _buildAccountCard(),
                const SizedBox(height: 16),
                _buildQuickActions(),
                const SizedBox(height: 16),
                _buildPromoSection(), // ← now properly called here
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── Top Bar ────────────────────────────────────────────────────────────────
  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfilePage()),
            ),
            child: CircleAvatar(
              radius: 26,
              backgroundImage: const NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTajPeGBmvhWwp9cgkPYj-aoBKq5xEARDV5QQ&s',
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: kCyan.withOpacity(0.4), width: 2),
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,',
                style: TextStyle(color: kTextSecondary, fontSize: 13),
              ),
              Text(
                'ABAA_App',
                style: TextStyle(
                  color: kTextPrimary,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const Spacer(),
          _topIcon(Icons.chat_bubble_outline_rounded),
          const SizedBox(width: 8),
          _topIcon(Icons.notifications_none_rounded),
          const SizedBox(width: 8),
          _topIcon(Icons.account_balance_wallet_outlined),
          const SizedBox(width: 8),
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: kRed,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.qr_code, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _topIcon(IconData icon) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kDivider),
      ),
      child: Icon(icon, color: kTextSecondary, size: 20),
    );
  }

  // ── Account Card ───────────────────────────────────────────────────────────
  Widget _buildAccountCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF131F35), Color(0xFF0D1628)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kDivider),
          boxShadow: [
            BoxShadow(
              color: kCyan.withOpacity(0.06),
              blurRadius: 30,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: _balanceVisible
                      ? const Text(
                          '\$4,285.50',
                          style: TextStyle(
                            color: kTextPrimary,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        )
                      : Container(
                          height: 32,
                          width: 130,
                          decoration: BoxDecoration(
                            color: kCyan.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                ),
                GestureDetector(
                  onTap: () =>
                      setState(() => _balanceVisible = !_balanceVisible),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: kCyan.withOpacity(0.12),
                      shape: BoxShape.circle,
                      border: Border.all(color: kCyan.withOpacity(0.3)),
                    ),
                    child: Icon(
                      _balanceVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: kCyan,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _badge('គណនីតាង', kCyan),
                const SizedBox(width: 8),
                const Text(
                  'Savings',
                  style: TextStyle(color: kTextSecondary, fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 18),
            const Divider(color: kDivider, height: 1),
            const SizedBox(height: 16),
            Row(
              children: [
                _transferBtn(
                  icon: Icons.arrow_upward_rounded,
                  label: 'ទទួលសប',
                  color: kGreen,
                  bgColor: kGreen.withOpacity(0.12),
                ),
                const SizedBox(width: 16),
                _transferBtn(
                  icon: Icons.arrow_downward_rounded,
                  label: 'ផ្ញើសប',
                  color: kRed,
                  bgColor: kRed.withOpacity(0.12),
                ),
                const Spacer(),
                Container(width: 1, height: 36, color: kDivider),
                const Spacer(),
                _transferBtn(
                  icon: Icons.bar_chart_rounded,
                  label: 'វិភាគ',
                  color: kCyan,
                  bgColor: kCyan.withOpacity(0.12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _badge(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _transferBtn({
    required IconData icon,
    required String label,
    required Color color,
    required Color bgColor,
  }) {
    return Column(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
          child: Icon(icon, color: color, size: 18),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // ── Quick Actions ──────────────────────────────────────────────────────────
  Widget _buildQuickActions() {
    final actions = [
      _ActionItem(
        icon: Icons.account_balance_wallet_rounded,
        label: 'គណនី',
        isCyan: true,
      ),
      _ActionItem(icon: Icons.credit_card_rounded, label: 'កាត', isCyan: true),
      _ActionItem(
        icon: Icons.attach_money_rounded,
        label: 'ទូទាត់',
        isCyan: true,
      ),
      _ActionItem(
        icon: Icons.qr_code_scanner_rounded,
        label: 'ABA ស្គែន',
        isCyan: true,
      ),
      _ActionItem(
        icon: Icons.star_border_rounded,
        label: 'គំរូទូទាត់',
        isCyan: true,
      ),
      _ActionItem(
        icon: Icons.swap_horiz_rounded,
        label: 'ផ្ទេរប្រាក់',
        isCyan: true,
      ),
    ];

    final bottomActions = [
      _ActionItem(
        icon: Icons.card_giftcard_rounded,
        label: 'កាតូ',
        isCyan: true,
      ),
      _ActionItem(icon: Icons.apps_rounded, label: 'មីនីអេប', isCyan: true),
      _ActionItem(
        icon: Icons.storefront_rounded,
        label: 'អាជីវកម ABA',
        isCyan: true,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kCard,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kDivider),
        ),
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.1,
              ),
              itemCount: actions.length,
              itemBuilder: (_, i) => _actionTile(actions[i], i),
            ),
            const SizedBox(height: 12),
            const Divider(color: kDivider, height: 1),
            const SizedBox(height: 12),
            Row(
              children: List.generate(bottomActions.length, (i) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: _pillAction(bottomActions[i], i),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionTile(_ActionItem item, int index) {
    return GestureDetector(
      onTap: () {
        Widget? page;
        switch (index) {
          case 0:
            page = const AccountDetailPage();
            break;
          case 1:
            page = const CardsPage();
            break;
          case 2:
            page = const PaymentPage();
            break;
          case 3:
            page = const QRScanPage();
            break;
          case 4:
            page = const FavoritePaymentsPage();
            break;
          case 5:
            page = const TransferScreen();
            break;
        }
        if (page != null) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page!));
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: kCyan.withOpacity(0.12),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: kCyan.withOpacity(0.4)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, color: kCyan, size: 28),
            const SizedBox(height: 8),
            Text(
              item.label,
              style: const TextStyle(
                color: kCyan,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _pillAction(_ActionItem item, int index) {
    return GestureDetector(
      onTap: () {
        Widget page;
        switch (index) {
          case 0:
            page = const GiftCardPage();
            break;
          case 1:
            page = const MiniAppPage();
            break;
          case 2:
            page = const ABABusinessPage();
            break;
          default:
            return;
        }
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: kCardAlt,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: kDivider),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, color: kCyan, size: 16),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                item.label,
                style: const TextStyle(
                  color: kTextPrimary,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Promo / Banner Slider ─────────────────────────────────────────────────
  Widget _buildPromoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: CarouselSlider(
        items: kPromoImages.map((url) => _promoSlide(url)).toList(),
        options: CarouselOptions(
          height: 160.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.88,
        ),
      ),
    );
  }

  /// Single promo banner card using Image.network with error fallback
  Widget _promoSlide(String url) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kDivider),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.network(
        url,
        fit: BoxFit.cover,
        width: double.infinity,
        // ── shown while image is downloading ──
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            color: kCardAlt,
            child: const Center(
              child: CircularProgressIndicator(color: kCyan, strokeWidth: 2),
            ),
          );
        },
        // ── shown if the URL fails to load ──
        errorBuilder: (context, error, stack) {
          return Container(
            color: kCardAlt,
            child: const Center(
              child: Icon(
                Icons.broken_image_rounded,
                color: kTextSecondary,
                size: 40,
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─── Shared AppBar ────────────────────────────────────────────────────────────
PreferredSizeWidget buildAppBar(
  BuildContext context,
  String title,
  IconData icon,
) {
  return AppBar(
    backgroundColor: kCard,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_rounded, color: kCyan),
      onPressed: () => Navigator.pop(context),
    ),
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: kCyan, size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            color: kTextPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(height: 1, color: kDivider),
    ),
  );
}
