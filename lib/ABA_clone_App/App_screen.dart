import 'package:flutter/material.dart';
import '/ABA_clone_App/ABA_home_sreen.dart';

import '/ABA_clone_App/main.dart';
import '/ABA_clone_App/register_screen.dart';

class Appscreen extends StatelessWidget {
  const Appscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: RegisterScreen());
  }
}
