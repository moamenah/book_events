import 'package:book_events/ui/home/tabs/profile_tabs.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: ProfileTabs(),
    );
  }
}
