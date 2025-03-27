import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // Welcome Text & Notification Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Welcome !',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: authController.logout,
                  )
                  // Icon(Icons.notifications, color: Colors.black, size: 28),
                ],
              ),

              const SizedBox(height: 16), // Space before student info
              // Student Information Container
              Container(
                height: 150,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade900,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    // Circle Avatar
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        'assets/student.jpg',
                      ), // Replace with actual image
                    ),
                    SizedBox(width: 16),
                    // Student Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'John Doe',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Roll No: 12345',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Grade: 10th',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 9),
              Expanded(
                child: Container(
                  // height: ,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade900,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Daily Activities",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12), // Space below heading
                      // Grid Layout (2 Rows, 3 Columns)
                      Expanded(
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 6, // 6 items (2 rows × 3 columns)
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 4,
                                mainAxisSpacing: 4,
                                childAspectRatio: 1,
                              ),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.shade700,
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/activity_$index.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 9), // Space before upcoming events section
              // Upcoming Events Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade900,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.only(
                  top: 7,
                ), // Optional, remove top padding if not needed
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Center(
                        child: const Text(
                          "Upcoming Events",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12), // Space below heading

                    // Outer container (change width and height here)
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                      padding: const EdgeInsets.all(16),
                      width: double.infinity, // Width of the outer container
                      height: 150, // Adjust the height of the outer container
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          // Special Day Quote positioned inside the Stack
                          Positioned(
                            top: 20,
                            left: 16,
                            child: Text(
                              "“Education is the most powerful weapon \nwhich you can use to change the world.”",
                              style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          // Date Positioned at the Bottom Right inside the Stack
                          Positioned(
                            bottom: 10,
                            right: 16,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                "20 Feb 2025",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
