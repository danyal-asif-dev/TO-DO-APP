import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

/// Screen for adding a new project.
///
/// Shows a form-like list of cards: task group, project name, description,
/// start date, end date, project logo and an "Add Project" button.
///
/// Note: the screen is design-only for now. All values are static and none
/// of the cards or buttons are functional yet.
class AddprojectScreen extends StatefulWidget {
  const AddprojectScreen({super.key});

  @override
  State<AddprojectScreen> createState() => _AddprojectScreenState();
}

class _AddprojectScreenState extends State<AddprojectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add Project',
          style: TextStyle(
            color: Color(0xff24252C),
            fontSize: 19,
            fontWeight: FontWeight.w600,
            fontFamily: 'Lexend Deca',
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
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            // Task group card: icon + label + selected group name + arrow
            Container(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 16,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  // Group icon with a pink background
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color(0xffFFE4F2),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Image.asset('assets/Icons/briefcase.png'),
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Small label + selected group name
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Task Group',
                        style: TextStyle(
                          fontSize: 9,
                          color: Color(0xff6E6A7C),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Lexend Deca',
                        ),
                      ),
                      Text(
                        'Work',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff24252C),
                          fontFamily: 'Lexend Deca',
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Arrow icon on the right (nothing happens on tap yet)
                  InkWell(
                    onTapDown: (details) {
                      // Not implemented yet
                    },
                    child: Image.asset('assets/Icons/10.png'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Project name card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Project Name',
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          fontWeight: FontWeight.w400,
                          fontSize: 9,
                          color: Color(0xff6E6A7C),
                        ),
                      ),

                      SizedBox(height: 2),

                      Text(
                        'Grocery Shopping App',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Lexend Deca',
                          color: Color(0xff24252C),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Description card (slightly transparent white background).
            // The large bottom padding (47) makes the card taller.
            Container(
              padding: const EdgeInsets.only(
                left: 16,
                top: 16,
                bottom: 47,
                right: 19,
              ),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 9,
                          color: Color(0xff6E6A7C),
                          fontFamily: 'Lexend Deca',
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      SizedBox(height: 12),

                      Text(
                        'This application is designed for super shops. By using\n'
                        'this application they can enlist all their products in one\n'
                        'place and can deliver. Customers will get a one-stop  \n'
                        ' solution for their daily shopping.',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xff24252C),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Lexend Deca',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Start date card: calendar icon + label + date + arrow
            Container(
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 4),
                    child: Image.asset('assets/Icons/5.png'),
                  ),

                  const SizedBox(width: 12),

                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Star Date',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Lexend Deca',
                          color: Color(0xff6E6A7C),
                        ),
                      ),

                      SizedBox(height: 2),

                      Text(
                        '01 May, 2022',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff24252C),
                          fontFamily: 'Lexend Deca',
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 4),
                    child: Image.asset('assets/Icons/10.png'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // End date card: calendar icon + label + date + arrow
            Container(
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 4),
                    child: Image.asset('assets/Icons/5.png'),
                  ),

                  const SizedBox(width: 12),

                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Date',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Lexend Deca',
                          color: Color(0xff6E6A7C),
                        ),
                      ),

                      SizedBox(height: 2),

                      Text(
                        '30 June, 2022',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff24252C),
                          fontFamily: 'Lexend Deca',
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 4),
                    child: Image.asset('assets/Icons/10.png'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Project logo card: current logo (image + "Grocery Shop" text)
            // and a "Change Logo" button (only a styled box, not clickable yet)
            Container(
              padding: const EdgeInsets.only(
                left: 16,
                top: 10,
                bottom: 9,
                right: 16,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Image.asset('assets/Icons/11.png'),

                  const SizedBox(width: 8),

                  // Logo text: "Grocery" in green and "Shop" in orange
                  const Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Grocery ',
                          style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color: Color(0xff047C78),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Text(
                          'Shop',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffF2582C),
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // "Change Logo" button
                  Container(
                    margin: const EdgeInsets.only(top: 16, bottom: 7),
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 8,
                      bottom: 9,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: const Color(0xffEDE8FF),
                    ),
                    child: const Center(
                      child: Text(
                        'Change Logo',
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          color: Color(0xff5F33E1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 23),

            // "Add Project" button (only a styled box, not clickable yet)
            Container(
              padding: const EdgeInsets.only(
                left: 110,
                right: 110,
                bottom: 14,
                top: 14,
              ),
              decoration: BoxDecoration(
                color: const Color(0xff5F33E1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Text(
                'Add Project',
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontFamily: 'Lexend Deca',
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}