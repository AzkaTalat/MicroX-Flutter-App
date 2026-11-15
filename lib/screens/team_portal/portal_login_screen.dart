
import 'package:flutter/material.dart';
import 'portal_dashboard_screen.dart';

class PortalLoginScreen extends StatefulWidget {
  const PortalLoginScreen({super.key});

  @override
  State<PortalLoginScreen> createState() => _PortalLoginScreenState();
}

class _PortalLoginScreenState extends State<PortalLoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email and password.'),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const PortalDashboardScreen(),
      ),
    );
  }

  InputDecoration inputDecoration({bool password = false}) {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xFF211E1E),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 17,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF4A4444)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFC90000)),
      ),
      suffixIcon: password
          ? IconButton(
        onPressed: () {
          setState(() {
            isPasswordVisible = !isPasswordVisible;
          });
        },
        icon: Icon(
          isPasswordVisible
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: Colors.grey,
        ),
      )
          : null,
    );
  }

  // LEFT IMAGE PANEL - NO TEXT OR OVERLAY
  Widget brandingPanel() {
    return Image.asset(
      'assets/images/microx_left_panel.png',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return const ColoredBox(
          color: Color(0xFF211919),
          child: Center(
            child: Text(
              'Image not found',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  // RIGHT LOGIN PANEL
  Widget loginPanel() {
    return Container(
      color: const Color(0xFF151313),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 35,
            vertical: 35,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 390),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'MICROX TEAM WORKSPACE',
                  style: TextStyle(
                    color: Color(0xFFFF9FA5),
                    fontSize: 11,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 35),

                const Text(
                  'Welcome back to MicroX.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    height: 1.2,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 18),

                const Text(
                  'Sign in with the email and password approved by your MicroX admin.',
                  style: TextStyle(
                    color: Color(0xFFB9B5B8),
                    fontSize: 14,
                    height: 1.8,
                  ),
                ),

                const SizedBox(height: 35),

                const Text(
                  'Approved email',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                  decoration: inputDecoration(),
                ),

                const SizedBox(height: 25),

                const Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible,
                  style: const TextStyle(color: Colors.white),
                  decoration: inputDecoration(password: true),
                ),

                const SizedBox(height: 28),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB9090D),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.lock_outline,
                      color: Color(0xFFB9B5B8),
                      size: 17,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Invitation only. Ask your admin for access or a password reset.',
                        style: TextStyle(
                          color: Color(0xFFB9B5B8),
                          fontSize: 12,
                          height: 1.7,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 35),

                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Private recovery key access is coming soon.',
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'I have a private recovery key',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        '← Back to MicroX',
                        style: TextStyle(
                          color: Color(0xFFB9B5B8),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                const Center(
                  child: Text(
                    'Team workspace · MicroX',
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151313),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Desktop and large screens
            if (constraints.maxWidth >= 800) {
              return Row(
                children: [
                  Expanded(
                    child: brandingPanel(),
                  ),
                  Expanded(
                    child: loginPanel(),
                  ),
                ],
              );
            }

            // Mobile and small screens
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 280,
                    width: double.infinity,
                    child: brandingPanel(),
                  ),
                  loginPanel(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
