import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = false;

  final Color purple = Color(0xFF5145ED);
  final Color background = Color(0xFFF4F6FC);
  final Color borderColor = Color(0xFFD5DAE6);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signIn() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color.fromARGB(255, 130, 229, 132),
          content: Text(
            'Form validated successfully!',
            style: TextStyle(fontWeight: FontWeight(800)),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),

                // Back button
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: borderColor),
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.chevron_left),
                  ),
                ),

                SizedBox(height: 36),

                // Logo
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: purple,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 25),
                ),

                SizedBox(height: 26),

                Text(
                  'Welcome back',
                  style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF111827),
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  'Sign in to keep making progress.',
                  style: TextStyle(fontSize: 14, color: Color(0xFF526078)),
                ),

                SizedBox(height: 40),

                // Email label
                Text(
                  'Email address',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),

                SizedBox(height: 10),

                // Email field with validation
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: inputDecoration('you@example.com'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[\w.-]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value.trim())) {
                      return 'Please enter a valid email';
                    }

                    return null;
                  },
                ),

                SizedBox(height: 20),

                // Password label
                Text(
                  'Password',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),

                SizedBox(height: 10),

                // Password field with validation
                TextFormField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: inputDecoration('Enter your password').copyWith(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off_outlined,
                        size: 20,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }

                    return null;
                  },
                ),

                SizedBox(height: 12),

                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: purple,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Sign in button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      signIn();

                      if (formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(context, '/all_task');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: purple,
                      foregroundColor: Colors.white,
                      elevation: 8,
                      shadowColor: purple.withOpacity(0.22),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),

                Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Text(
                        'New to DoneList? ',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF526078),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Create account',
                          style: TextStyle(
                            fontSize: 13,
                            color: purple,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Color(0xFF929CB1), fontSize: 14),
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      errorMaxLines: 2,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: BorderSide(color: purple),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: BorderSide(color: Colors.red),
      ),
    );
  }
}
