
import 'package:flutter/material.dart';
import 'package:todoapp/custom/bottomnavbar.dart';

class TodayScreen extends StatefulWidget {
  TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  final Color purple = Color(0xFF5145ED);
  final Color background = Color(0xFFF4F6FC);

  int selectedTab = 0;

  final List<Map<String, dynamic>> tasks = [
    {
      'title': 'Review project proposal',
      'category': 'Work',
      'time': '9:30 AM',
      'color': Color(0xFF5145ED),
      'done': false,
      'priority': 'High',
    },
    {
      'title': 'Book dentist appointment',
      'category': 'Health',
      'time': '11:00 AM',
      'color': Color(0xFF36C99A),
      'done': false,
      'priority': '',
    },
    {
      'title': 'Pick up groceries',
      'category': 'Home',
      'time': '5:30 PM',
      'color': Color(0xFFFFA726),
      'done': false,
      'priority': '',
    },
    {
      'title': '30-minute walk',
      'category': 'Health',
      'time': '6:00 PM',
      'color': Color(0xFF36C99A),
      'done': true,
      'priority': '',
    },
    {
      'title': 'Reply to Maya',
      'category': 'Personal',
      'time': '',
      'color': Color(0xFFEC4899),
      'done': true,
      'priority': '',
    },
    {
      'title': 'Plan tomorrow',
      'category': 'Personal',
      'time': '8:00 PM',
      'color': Color(0xFFEC4899),
      'done': true,
      'priority': '',
    },
  ];

  int get completedTasks =>
      tasks.where((task) => task['done'] == true).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(27, 28, 27, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'WEDNESDAY, OCTOBER 21',
                              style: TextStyle(
                                fontSize: 10,
                                letterSpacing: 0.4,
                                color: Color(0xFF43516B),
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Today',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF101828),
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xFFE2E7FF),
                          child: Text(
                            'AL',
                            style: TextStyle(
                              color: purple,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    // Progress card
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: purple,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: purple.withOpacity(0.18),
                            blurRadius: 18,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '$completedTasks of ${tasks.length} done',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '${(completedTasks / tasks.length * 100).round()}%',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: completedTasks / tasks.length,
                              minHeight: 6,
                              backgroundColor: Colors.white24,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'A little progress adds up.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 22),

                    // Task heading
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My tasks',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${tasks.length} tasks',
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF526078),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    // Task list
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.025),
                            blurRadius: 15,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: tasks.length,
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 1,
                            thickness: 0.7,
                            color: Color(0xFFE8EBF2),
                          );
                        },
                        itemBuilder: (context, index) {
                          final task = tasks[index];
                          final bool isDone = task['done'];

                          return InkWell(
                            onTap: () {
                              setState(() {
                                task['done'] = !isDone;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 13,
                              ),
                              child: Row(
                                children: [
                                  // Checkbox
                                  Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isDone
                                          ? purple
                                          : Colors.white,
                                      border: Border.all(
                                        color: isDone
                                            ? purple
                                            : Color(0xFFC8D0DF),
                                        width: 1.2,
                                      ),
                                    ),
                                    child: isDone
                                        ? Icon(
                                            Icons.check,
                                            size: 16,
                                            color: Colors.white,
                                          )
                                        : null,
                                  ),

                                  SizedBox(width: 11),

                                  // Task information
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          task['title'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: isDone
                                                ? Color(0xFF8993A6)
                                                : Color(0xFF172033),
                                            decoration: isDone
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none,
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Row(
                                          children: [
                                            Container(
                                              height: 6,
                                              width: 6,
                                              decoration: BoxDecoration(
                                                color: task['color'],
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            Flexible(
                                              child: Text(
                                                '${task['category']}${task['time'] == '' ? '' : ' · ${task['time']}'}',
                                                style: TextStyle(
                                                  fontSize: 9,
                                                  color: Color(0xFF526078),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Priority badge
                                  if (task['priority'] != '')
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 9,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFF1C2),
                                        borderRadius:
                                            BorderRadius.circular(7),
                                      ),
                                      child: Text(
                                        task['priority'],
                                        style: TextStyle(
                                          color: Color(0xFFB77900),
                                          fontSize: 9,
                                        ),
                                      ),
                                    ),
                                ],
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
          ],
        ),
      ),

      // Reusable custom navbar
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedTab,
        onItemSelected: (index) {
          setState(() {
            selectedTab = index;
          });
        },
      ),

      // Floating add button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: purple,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 27,
        ),
      ),
    );
  }
}
