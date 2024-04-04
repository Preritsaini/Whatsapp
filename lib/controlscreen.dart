import 'package:flutter/material.dart';
import 'package:whatsapp/callscreen.dart';
import 'package:whatsapp/coummunities.dart';
import 'package:whatsapp/dashboard.dart';
import 'package:whatsapp/updatesscreen.dart';

class controlScreen extends StatefulWidget {
  const controlScreen({super.key});

  @override
  State<controlScreen> createState() => _controlScreenState();
}

class _controlScreenState extends State<controlScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          Dashboard(),
          updatesScreen(),
          communitiesScreen(),
          callScreen(),
        ],
      ),
    );
  }
}