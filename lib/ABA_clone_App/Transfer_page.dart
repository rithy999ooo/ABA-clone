import 'package:flutter/material.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfer"),
        backgroundColor: const Color(0xFF013F7C),
      ),
      body: ListView(
        children: [
          _transferOption(Icons.sync_alt, "Transfer to ABA Account"),
          _transferOption(Icons.account_balance, "Transfer to Local Bank"),
          _transferOption(Icons.language, "International Transfer"),
        ],
      ),
    );
  }

  Widget _transferOption(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: () {},
    );
  }
}
