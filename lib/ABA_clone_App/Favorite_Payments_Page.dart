import 'package:flutter/material.dart';
import '/ABA_clone_App/ABA_home_sreen.dart';

/// ================= APP =================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ABA Favorites',
      theme: ThemeData(fontFamily: 'Kantumruy'),
      home: const FavoritePaymentsPage(),
    );
  }
}

/// ================= HOME PAGE =================

/// ================= FAVORITE PAGE =================
class FavoritePaymentsPage extends StatelessWidget {
  const FavoritePaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FavoritesScreen();
  }
}

/// ================= MODEL =================
class SavedAccount {
  final String name;
  final String accountNumber;

  SavedAccount({required this.name, required this.accountNumber});
}

/// ================= MAIN SCREEN =================
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<SavedAccount> _savedAccounts = [
    SavedAccount(name: 'ផ្សេង', accountNumber: '2940918-1646005'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 22, 32),
      body: Column(
        children: [
          _buildHeader(),
          _buildTabBar(),
          const SizedBox(height: 12),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [_buildSavedTab(), _buildPayTab(), _buildTransferTab()],
            ),
          ),
        ],
      ),
    );
  }

  // ================= HEADER =================
  Widget _buildHeader() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 11, 18, 32),
            Color.fromARGB(255, 17, 21, 46),
          ],
        ),
      ),
      padding: const EdgeInsets.only(top: 45, left: 16, right: 16, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                  color: Color.fromARGB(255, 11, 18, 70),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                "គំរូទូទាត់",
                style: TextStyle(
                  color: Color.fromARGB(255, 17, 21, 46),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const Text(
            "កំណត់ចំណាំ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "ប្រើកំណត់ស្រាប់ ដើម្បីបង់លឿន និងងាយស្រួល",
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }

  // ================= TAB BAR =================
  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.blue,
      tabs: const [
        Tab(text: "Saved"),
        Tab(text: "Pay"),
        Tab(text: "Transfer"),
      ],
    );
  }

  // ================= SAVED TAB =================
  Widget _buildSavedTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: _savedAccounts.length,
      itemBuilder: (context, index) {
        final acc = _savedAccounts[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: const Icon(Icons.account_balance),
            title: Text(acc.name),
            subtitle: Text(acc.accountNumber),
            trailing: const Icon(Icons.more_horiz),
            onTap: () => _showPayment(acc),
          ),
        );
      },
    );
  }

  // ================= PAY TAB =================
  Widget _buildPayTab() {
    return const Center(child: Text("Pay Page"));
  }

  // ================= TRANSFER TAB =================
  Widget _buildTransferTab() {
    return const Center(child: Text("Transfer Page"));
  }

  // ================= PAYMENT MODAL =================
  void _showPayment(SavedAccount acc) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Pay to ${acc.name}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(acc.accountNumber),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        ),
      ),
    );
  }
}
