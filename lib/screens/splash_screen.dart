import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final Color purple = Color(0xFF4F46E5);
  final Color background = Color(0xFFF4F6FB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 21),
          child: Column(
            children: [
              SizedBox(height: 48),

              // Logo
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: purple,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: purple.withOpacity(0.25),
                      blurRadius: 24,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Icon(Icons.check_rounded, color: Colors.white, size: 40),
              ),

              SizedBox(height: 22),

              Text(
                'Todo List',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF111827),
                ),
              ),

              SizedBox(height: 8),

              Text(
                'Plan your day, finish what matters',
                style: TextStyle(fontSize: 14, color: Color(0xFF344054)),
              ),

              SizedBox(height: 40),

              // Task cards
              Transform.rotate(
                angle: -0.04,
                child: taskCard(Color(0xFFC4D0FF)),
              ),
              SizedBox(height: 14),
              Transform.rotate(
                angle: 0.04,
                child: taskCard(purple, isSelected: true),
              ),
              SizedBox(height: 14),
              Transform.rotate(
                angle: -0.02,
                child: taskCard(Color(0xFF8AF0C8)),
              ),

              SizedBox(height: 48),
             
              button('Get started', filled: true),
              SizedBox(height: 12),
              button('I have an account', filled: false),

              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }


  Widget button(String text, {required bool filled}) {
    return SizedBox(
      width: double.infinity,
      height: 53,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: filled ? purple : Colors.white,
          foregroundColor: filled ? Colors.white : purple,
          elevation: filled ? 6 : 0,
          side: filled ? null : BorderSide(color: Color(0xFFC7D2FE)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  // One method for all task cards
  Widget taskCard(Color color, {bool isSelected = false}) {
    return Container(
      height: 54,
      padding: EdgeInsets.symmetric(horizontal: 17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 25,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? color : Colors.white,
              border: Border.all(color: color, width: 2),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 7,
              decoration: BoxDecoration(
                color: Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}