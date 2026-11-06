import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

/// Home screen of the app.
///
/// From top to bottom it shows:
/// 1. A header with the user's avatar, greeting and name.
/// 2. A purple banner with the progress of today's tasks.
/// 3. "In Progress": horizontally scrollable project cards.
/// 4. "Task Groups": a list of task groups with their progress.
///
/// Note: all names, counts and percentages are static sample data for now.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 22,

          // Header: user avatar + greeting + user name
          title: const Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/2.png'),
                backgroundColor: Color(0xffD9D9D9),
              ),

              SizedBox(width: 16),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello!',
                    style: TextStyle(
                      fontFamily: 'hello',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff24252C),
                    ),
                  ),

                  Text(
                    'Livia Vaccaro!',
                    style: TextStyle(
                      fontFamily: 'hello',
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff24252C),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Icon on the right with a small purple dot on its corner
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 22),
              child: Stack(
                children: [
                  SvgPicture.asset('assets/Icons/1.svg'),
                  Positioned(
                    top: 1,
                    right: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff5F33E1),
                      ),
                      height: 8,
                      width: 8,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.only(left: 19),

          // The whole screen scrolls vertically
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),

                // ---------------------------------------------------------
                // Banner: progress of today's tasks
                // ---------------------------------------------------------
                Container(
                  margin: const EdgeInsets.only(left: 3, right: 22),
                  decoration: BoxDecoration(
                    color: const Color(0xff5F33E1),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      right: 16,
                      left: 22,
                      bottom: 22,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left side: message + "View Task" button
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 6),
                              child: Text(
                                ' Your today’s task \n almost done!,',
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Lexend Deca',
                                ),
                              ),
                            ),

                            const SizedBox(height: 28),

                            // "View Task" button (only a styled box, it is
                            // not clickable yet)
                            Container(
                              margin: const EdgeInsets.only(right: 50),
                              decoration: BoxDecoration(
                                color: const Color(0xffEEE9FF),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                child: Center(
                                  child: Text(
                                    ' View Task',
                                    style: TextStyle(
                                      color: Color(0xff5F33E1),
                                      fontFamily: 'Lexend Deca',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Circular progress with the percentage in the middle.
                        // The circle is set to 0.8 (80%) but the text says
                        // 85%; both values are hard-coded.
                        const Padding(
                          padding: EdgeInsets.only(top: 19, right: 32),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircularProgressIndicator(
                                constraints: BoxConstraints(
                                  minHeight: 76,
                                  minWidth: 76,
                                ),
                                value: 0.8,
                                strokeWidth: 8,
                                backgroundColor: Color(0xff8764FF),
                                valueColor: AlwaysStoppedAnimation(
                                  Color(0xffEEE9FF),
                                ),
                                strokeCap: StrokeCap.round,
                              ),
                              Text(
                                '85%',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Spacer(),

                        // "More" icon at the right edge of the banner
                        Image.asset('assets/Icons/more.png'),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // ---------------------------------------------------------
                // "In Progress" section title + number of projects
                // ---------------------------------------------------------
                Row(
                  children: [
                    const Text(
                      'In Progress',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Lexend Deca',
                        fontSize: 19,
                        color: Color(0xff24252C),
                      ),
                    ),

                    const SizedBox(width: 11),

                    // Small round badge with the count
                    Container(
                      padding: const EdgeInsets.only(
                        top: 1,
                        bottom: 1,
                        left: 5,
                        right: 4,
                      ),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffEEE9FF),
                      ),
                      child: const Text(
                        '6',
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          color: Color(0xff5F33E1),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                // Project cards: scroll sideways. Each card shows a project
                // category, a title and a progress bar.
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // Project card 1 (blue)
                      Container(
                        width: 202,
                        margin: const EdgeInsets.only(left: 3),
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 12,
                          top: 16,
                          bottom: 16,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffE7F3FF),
                          borderRadius: BorderRadius.circular(19),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Project category name + category icon
                            Row(
                              children: [
                                const Text(
                                  'Office Project',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff6E6A7C),
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 11,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: const Color(0xffFFE4F2),
                                  ),
                                  child: Image.asset(
                                    'assets/Icons/briefcase.png',
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            // Project title
                            const Text(
                              'Grocery shopping  app \n design',
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Lexend Deca',
                                fontSize: 14,
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Progress bar (0.6 = 60% done)
                            LinearProgressIndicator(
                              value: 0.6,
                              minHeight: 6,
                              borderRadius: BorderRadius.circular(3),
                              backgroundColor: const Color(0xffFFFFFF),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xff0087FF),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 16),

                      // Project card 2 (orange background, orange progress bar)
                      Container(
                        width: 202,
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 16,
                          bottom: 16,
                          right: 12,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffFFE9E1),
                          borderRadius: BorderRadius.circular(19),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Project category name
                            const Text(
                              'Personal Project',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                fontWeight: FontWeight.w400,
                                color: Color(0xff6E6A7C),
                                fontSize: 11,
                              ),
                            ),

                            const SizedBox(height: 15),

                            // Extra empty space before the title
                            Padding(padding: EdgeInsetsGeometry.only(top: 12)),

                            // Project title
                            Text(
                              'Uber Eats redesign \n challange',
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight(400),
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Progress bar (0.6 = 60% done)
                            LinearProgressIndicator(
                              value: 0.6,
                              minHeight: 6,
                              borderRadius: BorderRadius.circular(3),
                              backgroundColor: const Color(0xffFFFFFF),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xffFF7D53),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 16),

                      // Project card 3 (orange background, blue progress bar)
                      Container(
                        width: 202,
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 16,
                          bottom: 16,
                          right: 12,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffFFE9E1),
                          borderRadius: BorderRadius.circular(19),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Project category name
                            const Text(
                              'Personal Project',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                fontWeight: FontWeight.w400,
                                color: Color(0xff6E6A7C),
                                fontSize: 11,
                              ),
                            ),

                            const SizedBox(height: 15),

                            // Extra empty space before the title
                            Padding(padding: EdgeInsetsGeometry.only(top: 12)),

                            // Project title
                            Text(
                              'Uber Eats redesign \n challange',
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight(400),
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Progress bar (0.6 = 60% done)
                            LinearProgressIndicator(
                              value: 0.6,
                              minHeight: 6,
                              borderRadius: BorderRadius.circular(3),
                              backgroundColor: const Color(0xffFFFFFF),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xff0087FF),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 16),

                      // Project card 4 (blue, same as card 1)
                      Container(
                        width: 202,
                        margin: const EdgeInsets.only(left: 3),
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 12,
                          top: 16,
                          bottom: 16,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffE7F3FF),
                          borderRadius: BorderRadius.circular(19),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Project category name + category icon
                            Row(
                              children: [
                                const Text(
                                  'Office Project',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff6E6A7C),
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 11,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: const Color(0xffFFE4F2),
                                  ),
                                  child: Image.asset(
                                    'assets/Icons/briefcase.png',
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            // Project title
                            const Text(
                              'Grocery shopping  app \n design',
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Lexend Deca',
                                fontSize: 14,
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Progress bar (0.6 = 60% done, 6 px high)
                            LinearProgressIndicator(
                              value: 0.6,
                              minHeight: 6,
                              borderRadius: BorderRadius.circular(3),
                              backgroundColor: const Color(0xffFFFFFF),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xff0087FF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // ---------------------------------------------------------
                // "Task Groups" section title + number of groups
                // ---------------------------------------------------------
                Row(
                  children: [
                    const Text(
                      'Task Groups',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                        fontFamily: 'Lexend Deca',
                        color: Color(0xff24252C),
                      ),
                    ),

                    const SizedBox(width: 11),

                    // Small round badge with the count
                    Container(
                      padding: const EdgeInsets.only(
                        top: 1,
                        bottom: 1,
                        left: 5,
                        right: 4,
                      ),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffEEE9FF),
                      ),
                      child: const Text(
                        '4',
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          color: Color(0xff5F33E1),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Task group cards. Every card has the same layout: icon on
                // the left, group name + task count in the middle and a
                // circular progress with its percentage on the right.

                // Group card 1: Office Project
                Container(
                  margin: const EdgeInsets.only(left: 3, right: 19),
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 19,
                    top: 13,
                    bottom: 11,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffFFFFFF),
                  ),
                  child: Row(
                    children: [
                      // Empty widget (no child), adds no visible content
                      const Padding(
                        padding: EdgeInsets.only(top: 3, bottom: 5),
                      ),

                      // Group icon with a pink background
                      Container(
                        padding: const EdgeInsets.only(
                          left: 7,
                          right: 7,
                          top: 7,
                          bottom: 7,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: const Color(0xffFFE4F2),
                        ),
                        child: Image.asset('assets/Icons/briefcase.png'),
                      ),

                      // Group name + number of tasks
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Office Project',
                              style: TextStyle(
                                color: Color(0xff24252C),
                                fontFamily: 'Lexend Deca',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),

                            Text(
                              '23 Tasks',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xff6E6A7C),
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),

                      // Circular progress (0.7 = 70%)
                      const Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: 0.7,
                            strokeWidth: 4,
                            backgroundColor: Color(0xffFFE4F2),
                            valueColor: AlwaysStoppedAnimation(
                              Color(0xffF478B8),
                            ),
                          ),
                          Text(
                            '70%',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: Color(0xff24252C),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // Group card 2: Personal Project
                Container(
                  margin: const EdgeInsets.only(left: 3, right: 19),
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 19,
                    top: 13,
                    bottom: 11,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffFFFFFF),
                  ),
                  child: Row(
                    children: [
                      // Empty widget (no child), adds no visible content
                      const Padding(
                        padding: EdgeInsets.only(top: 3, bottom: 5),
                      ),

                      // Group icon with a pink background
                      Container(
                        padding: const EdgeInsets.only(
                          left: 7,
                          right: 7,
                          top: 7,
                          bottom: 7,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: const Color(0xffFFE4F2),
                        ),
                        child: SvgPicture.asset('assets/Icons/3.svg'),
                      ),

                      // Group name + number of tasks
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Personal Project',
                              style: TextStyle(
                                color: Color(0xff24252C),
                                fontFamily: 'Lexend Deca',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),

                            Text(
                              '30 Tasks',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xff6E6A7C),
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),

                      // Circular progress (0.52 = 52%)
                      const Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: 0.52,
                            strokeWidth: 4,
                            backgroundColor: Color(0xffFFE4F2),
                            valueColor: AlwaysStoppedAnimation(
                              Color(0xff9260F4),
                            ),
                          ),
                          Text(
                            '52%',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: Color(0xff24252C),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // Group card 3: Daily Study
                Container(
                  margin: const EdgeInsets.only(left: 3, right: 19),
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 19,
                    top: 13,
                    bottom: 11,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffFFFFFF),
                  ),
                  child: Row(
                    children: [
                      // Empty widget (no child), adds no visible content
                      const Padding(
                        padding: EdgeInsets.only(top: 3, bottom: 5),
                      ),

                      // Group icon with a pink background
                      Container(
                        padding: const EdgeInsets.only(
                          left: 7,
                          right: 7,
                          top: 7,
                          bottom: 7,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: const Color(0xffFFE4F2),
                        ),
                        child: SvgPicture.asset('assets/Icons/2.svg'),
                      ),

                      // Group name + number of tasks
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Daily Study',
                              style: TextStyle(
                                color: Color(0xff24252C),
                                fontFamily: 'Lexend Deca',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),

                            Text(
                              '23 Tasks',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xff6E6A7C),
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),

                      // Circular progress (0.87 = 87%)
                      const Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: 0.87,
                            strokeWidth: 4,
                            backgroundColor: Color(0xffFFE4F2),
                            valueColor: AlwaysStoppedAnimation(
                              Color(0xffFF9142),
                            ),
                          ),
                          Text(
                            '87%',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: Color(0xff24252C),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // Group card 4: Office Project
                Container(
                  margin: const EdgeInsets.only(left: 3, right: 19),
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 19,
                    top: 13,
                    bottom: 11,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffFFFFFF),
                  ),
                  child: Row(
                    children: [
                      // Empty widget (no child), adds no visible content
                      const Padding(
                        padding: EdgeInsets.only(top: 3, bottom: 5),
                      ),

                      // Group icon with a pink background
                      Container(
                        padding: const EdgeInsets.only(
                          left: 7,
                          right: 7,
                          top: 7,
                          bottom: 7,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: const Color(0xffFFE4F2),
                        ),
                        child: Image.asset('assets/Icons/briefcase.png'),
                      ),

                      // Group name + number of tasks
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Office Project',
                              style: TextStyle(
                                color: Color(0xff24252C),
                                fontFamily: 'Lexend Deca',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),

                            Text(
                              '23 Tasks',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xff6E6A7C),
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),

                      // Circular progress (0.7 = 70%)
                      const Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: 0.7,
                            strokeWidth: 4,
                            backgroundColor: Color(0xffFFE4F2),
                            valueColor: AlwaysStoppedAnimation(
                              Color(0xffF478B8),
                            ),
                          ),
                          Text(
                            '70%',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: Color(0xff24252C),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // Group card 5: School Project
                Container(
                  margin: const EdgeInsets.only(left: 3, right: 19),
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 19,
                    top: 13,
                    bottom: 11,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffFFFFFF),
                  ),
                  child: Row(
                    children: [
                      // Empty widget (no child), adds no visible content
                      const Padding(
                        padding: EdgeInsets.only(top: 3, bottom: 5),
                      ),

                      // Group icon with a pink background
                      Container(
                        padding: const EdgeInsets.only(
                          left: 7,
                          right: 7,
                          top: 7,
                          bottom: 7,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: const Color(0xffFFE4F2),
                        ),
                        child: Image.asset('assets/Icons/briefcase.png'),
                      ),

                      // Group name + number of tasks
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'School Project',
                              style: TextStyle(
                                color: Color(0xff24252C),
                                fontFamily: 'Lexend Deca',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),

                            Text(
                              '40 Tasks',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xff6E6A7C),
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),

                      // Circular progress (0.1 = 10%)
                      const Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: 0.1,
                            strokeWidth: 4,
                            backgroundColor: Color(0xffFFE4F2),
                            valueColor: AlwaysStoppedAnimation(
                              Color(0xffF478B8),
                            ),
                          ),
                          Text(
                            '10%',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: Color(0xff24252C),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}