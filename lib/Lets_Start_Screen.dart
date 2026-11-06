import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigation_shell.dart';

/// Welcome screen shown when the user opens the app.
///
/// Shows the app logo, a title, a short description and a "Let’s Start"
/// button that opens the main app screen ([NavigationShell]).
class LetsStartScreen extends StatefulWidget {
  const LetsStartScreen({super.key});

  @override
  State<LetsStartScreen> createState() => _LetsStartScreenState();
}

class _LetsStartScreenState extends State<LetsStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 147),

          // App logo
          Image.asset(
            'assets/images/1.png',
            width: 159,
            height: 184,
          ),

          const SizedBox(height: 182),

          // Screen title
          const Text(
            'Task Management & \n To-Do List',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Lexend Deca',
              fontWeight: FontWeight.w600,
              color: Color(0xff24252C),
            ),
          ),

          const SizedBox(height: 20),

          // Short description under the title (each line is centered)
          const Padding(
            padding: EdgeInsets.only(left: 54, right: 55),
            child: Text(
              'This productive tool is designed to help \n'
              'you better manage your task \n'
              'project-wise conveniently!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Lexend Deca',
                color: Color(0xff6E6A7C),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // "Let’s Start" button: opens the main navigation screen
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NavigationShell()),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 22),
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 22,
              ),
              decoration: BoxDecoration(
                color: const Color(0xff5F33E1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // The two Spacers keep the text in the center of the
                  // button and push the arrow icon to the right edge.
                  const Spacer(),
                  const Text(
                    'Let’s Start',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                      fontFamily: 'Lexend Deca',
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/Icons/Arrow - Left.png',
                    width: 18,
                    height: 12,
                    color: const Color(0xffFFFFFF),
                  ),
                ],
              ),
            ),
          ),

          // Empty space at the bottom of the screen
          const SizedBox(height: 73),
        ],
      ),
    );
  }
}