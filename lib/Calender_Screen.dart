import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

/// Calendar screen that shows the tasks of the selected day.
///
/// The screen has three parts:
/// 1. A horizontal date picker (day number + weekday name).
/// 2. A horizontal list of filter tabs (All, To do, In Progress, ...).
/// 3. A list of task cards.
///
/// Note: all dates and task cards are static sample data for now.
class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

/// Index of the currently selected date in the date picker.
int CurrentDate = 0;

/// Day numbers shown in the date picker (1 to 31).
List<String> date = [
  '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11',
  '12', '13', '14', '15', '16', '17', '18', '19', '20', '21',
  '22', '23', '24', '25', '26', '27', '28', '29', '30', '31'
];

/// Weekday names shown under each date.
/// This list has the same length as [date], so days[i] belongs to date[i].
List<String> days = [
  'Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun',
  'Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun',
  'Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun',
  'Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun',
  'Mon', 'Tue', 'Wed'
];

/// Index of the currently selected filter tab.
int CurrentIndex = 0;

/// Labels of the filter tabs. The last two are placeholders for now.
List<String> names = ['All', 'To do', 'In Progress', '4th text', '5th text'];

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Todays Tasks',
          style: TextStyle(
            color: Color(0xff24252C),
            fontFamily: 'Lexend Deca',
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),

        // Back button: goes back to the previous screen
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Image.asset('assets/Icons/8.png'),
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
                    height: 8,
                    width: 8,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff5F33E1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 4, right: 3),
        child: Column(
          children: [
            // Date picker: horizontal list of dates + weekday names.
            // The selected date has a purple background.
            SizedBox(
              height: 95,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: date.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          print('tapped Index $index');
                          CurrentDate = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 8,
                          right: 21,
                          bottom: 8,
                        ),
                        decoration: BoxDecoration(
                          color: CurrentDate == index
                              ? const Color(0xff5F33E1)
                              : const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            // Month name (hard-coded to May for now)
                            Text(
                              'May',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                                fontFamily: 'Lexend Deca',
                                color: CurrentDate == index
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xff24252C),
                              ),
                            ),

                            const SizedBox(height: 8),

                            // Day number
                            Text(
                              date[index],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: CurrentDate == index
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xff24252C),
                                fontSize: 19,
                                fontFamily: 'Lexend Deca',
                              ),
                            ),

                            const SizedBox(height: 8),

                            // Weekday name
                            Text(
                              days[index],
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Lexend Deca',
                                fontSize: 11,
                                color: CurrentDate == index
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xff24252C),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Space between the date picker and the filter tabs
            const SizedBox(height: 22),

            // Filter tabs: horizontal list (All, To do, In Progress, ...).
            // The selected tab has a purple background.
            SizedBox(
              height: 34,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        enableFeedback: true, // true by default
                        autofocus: true,
                        onTap: () {
                          setState(() {
                            CurrentIndex = index;
                            print('tapped Index $index');
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: CurrentIndex == index
                                ? const Color(0xff5F33E1)
                                : const Color(0xffEDE8FF),
                          ),
                          child: Text(
                            names[index],
                            style: TextStyle(
                              fontSize: 14,
                              color: CurrentIndex == index
                                  ? const Color(0xffFFFFFF)
                                  : const Color(0xff5F33E1),
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Lexend Deca',
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 22),

            // Task cards (static sample data for now).
            // Every card has the same layout: project name, task title and
            // time on the left; category icon and status label on the right.
            Column(
              children: [
                // Task card 1
                Container(
                  margin: const EdgeInsets.only(left: 18, right: 19),
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 12,
                    top: 12,
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffFFFFFF),
                  ),
                  child: Row(
                    children: [
                      // Left side: project name, task title, time
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              'Grocery shopping app design',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xff6E6A7C),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Lexend Deca',
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Market Research',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff24252C),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Lexend Deca',
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Time (clock icon + text)
                          Row(
                            children: [
                              Image.asset(
                                'assets/Icons/9.png',
                                width: 14,
                                height: 14,
                                color: const Color(0xffAB94FF),
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                '10:00 AM',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xffAB94FF),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const Spacer(),

                      // Right side: category icon (top), status label (bottom)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: const Color(0xffFFE4F2),
                            ),
                            child: Image.asset(
                              'assets/Icons/briefcase.png',
                              color: const Color(0xffF478B8),
                            ),
                          ),
                          const SizedBox(height: 29),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 6,
                              top: 1,
                              right: 6,
                              bottom: 2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: const Color(0xffEDE8FF),
                            ),
                            child: const Text(
                              'Done',
                              style: TextStyle(
                                color: Color(0xff5F33E1),
                                fontSize: 9,
                                fontFamily: 'Lexend Deca',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // Task card 2
                Container(
                  margin: const EdgeInsets.only(left: 18, right: 19),
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 12,
                    top: 12,
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffFFFFFF),
                  ),
                  child: Row(
                    children: [
                      // Left side: project name, task title, time
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              'Grocery shopping app design',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xff6E6A7C),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Lexend Deca',
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Competitive Analysis',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff24252C),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Lexend Deca',
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Time (clock icon + text)
                          Row(
                            children: [
                              Image.asset(
                                'assets/Icons/9.png',
                                width: 14,
                                height: 14,
                                color: const Color(0xffAB94FF),
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                '12:00 PM',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xffAB94FF),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const Spacer(),

                      // Right side: category icon (top), status label (bottom)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: const Color(0xffFFE4F2),
                            ),
                            child: Image.asset(
                              'assets/Icons/briefcase.png',
                              color: const Color(0xffF478B8),
                            ),
                          ),
                          const SizedBox(height: 29),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 6,
                              top: 1,
                              right: 6,
                              bottom: 2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: const Color(0xffFFE9E1),
                            ),
                            child: const Text(
                              'In Progress',
                              style: TextStyle(
                                color: Color(0xffFF7D53),
                                fontSize: 9,
                                fontFamily: 'Lexend Deca',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // Task card 3
                Container(
                  margin: const EdgeInsets.only(left: 18, right: 19),
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 12,
                    top: 12,
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffFFFFFF),
                  ),
                  child: Row(
                    children: [
                      // Left side: project name, task title, time
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              'Uber Eats redesign challange',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xff6E6A7C),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Lexend Deca',
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Create Low-fidelity Wireframe',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff24252C),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Lexend Deca',
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Time (clock icon + text)
                          Row(
                            children: [
                              Image.asset(
                                'assets/Icons/9.png',
                                width: 14,
                                height: 14,
                                color: const Color(0xffAB94FF),
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                '07:00 PM',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xffAB94FF),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const Spacer(),

                      // Right side: category icon (top), status label (bottom)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: const Color(0xffEDE4FF),
                            ),
                            child: SvgPicture.asset('assets/Icons/3.svg'),
                          ),
                          const SizedBox(height: 29),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 6,
                              top: 1,
                              right: 6,
                              bottom: 2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: const Color(0xffE3F2FF),
                            ),
                            child: const Text(
                              'To-do',
                              style: TextStyle(
                                color: Color(0xff0087FF),
                                fontSize: 9,
                                fontFamily: 'Lexend Deca',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // Task card 4
                Container(
                  margin: const EdgeInsets.only(left: 18, right: 19),
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 12,
                    top: 12,
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffFFFFFF),
                  ),
                  child: Row(
                    children: [
                      // Left side: project name, task title, time
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              'About design sprint',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xff6E6A7C),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Lexend Deca',
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'How to pitch a Design Sprint',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff24252C),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Lexend Deca',
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Time (clock icon + text)
                          Row(
                            children: [
                              Image.asset(
                                'assets/Icons/9.png',
                                width: 14,
                                height: 14,
                                color: const Color(0xffAB94FF),
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                '09:00 PM',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xffAB94FF),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const Spacer(),

                      // Right side: category icon (top), status label (bottom)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: const Color(0xffFFE6D4),
                            ),
                            child: SvgPicture.asset('assets/Icons/2.svg'),
                          ),
                          const SizedBox(height: 29),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 6,
                              top: 1,
                              right: 6,
                              bottom: 2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: const Color(0xffE3F2FF),
                            ),
                            child: const Text(
                              'To-do',
                              style: TextStyle(
                                color: Color(0xff0087FF),
                                fontSize: 9,
                                fontFamily: 'Lexend Deca',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}