import 'package:flutter/material.dart';
import 'package:flutter_application_1/Addproject_Screen.dart';
import 'package:flutter_application_1/Calender_Screen.dart';
import 'package:flutter_application_1/Home_Screen.dart';

/// Main screen of the app that holds the bottom navigation bar.
///
/// The body shows one of the tab screens depending on the selected bottom
/// icon. A floating "+" button in the center opens the [AddprojectScreen].
class NavigationShell extends StatefulWidget {
  const NavigationShell({super.key});

  @override
  State<NavigationShell> createState() => _NavigationShellState();
}

class _NavigationShellState extends State<NavigationShell> {
  /// Screens shown in the body, in the same order as the bottom icons.
  /// Only Home and Calendar have screens so far; the last two bottom icons
  /// (tabs 2 and 3) are not connected to a screen yet.
  final List<Widget> _screens = [
    HomeScreen(),
    CalenderScreen(),
  ];

  /// Index of the selected tab (0 = Home, 1 = Calendar).
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Show the screen of the selected tab
      body: _screens[_currentIndex],

      // Floating "+" button in the center: opens the Add Project screen
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff5F33E1),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddprojectScreen()),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom navigation bar with a black background
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Tab 0 (Home): icon changes when this tab is selected
              IconButton(
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
                icon: _currentIndex == 0
                    ? Image.asset('assets/Icons/4.png')
                    : Image.asset('assets/Icons/13.png'),
              ),

              // Tab 1 (Calendar): icon changes when this tab is selected
              IconButton(
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
                icon: _currentIndex == 1
                    ? Image.asset('assets/Icons/14.png')
                    : Image.asset('assets/Icons/5.png'),
              ),

              // Empty gap in the middle so the icons stay clear of the
              // floating "+" button
              const SizedBox(width: 30),

              // Tab 2 (no screen yet): does nothing when tapped
              IconButton(
                onPressed: () {
                  // Not connected to a screen yet
                },
                icon: Image.asset('assets/Icons/6.png'),
              ),

              // Tab 3 (no screen yet): does nothing when tapped
              IconButton(
                onPressed: () {
                  // Not connected to a screen yet
                },
                icon: Image.asset('assets/Icons/7.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}