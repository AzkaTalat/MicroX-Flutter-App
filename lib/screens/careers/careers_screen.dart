
import 'package:flutter/material.dart';
import '../../widgets/microx_header.dart';
import '../team_portal/portal_login_screen.dart';
import 'frontend_intern_screen.dart';

class CareersScreen extends StatelessWidget {
  const CareersScreen({super.key});

  static const background = Color(0xFF111111);
  static const card = Color(0xFF1D1B1B);
  static const red = Color(0xFFC90000);
  static const white = Colors.white;
  static const grey = Color(0xFF999999);
  static const border = Color(0xFF444040);

  Widget sectionLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFFFF7777),
        fontSize: 11,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      ),
    );
  }

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // OPEN FRONTEND INTERNSHIP PAGE
  void openFrontendIntern(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FrontendInternScreen(),
      ),
    );
  }

  // INTERNSHIP CARD
  Widget internshipCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF332020),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'INTERNSHIP',
                  style: TextStyle(
                    color: Color(0xFFFF9999),
                    fontSize: 10,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_outward,
                color: grey,
                size: 20,
              ),
            ],
          ),

          const SizedBox(height: 25),

          const Text(
            'Remote Frontend developer intern',
            style: TextStyle(
              color: white,
              fontSize: 25,
              height: 1.3,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 14),

          const Text(
            'Learn by building, with guidance from the team and room to ask questions.',
            style: TextStyle(
              color: grey,
              fontSize: 15,
              height: 1.7,
            ),
          ),

          const SizedBox(height: 25),
          const Divider(color: border),
          const SizedBox(height: 15),

          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            children: [
              const Icon(
                Icons.work_outline,
                color: grey,
                size: 17,
              ),
              const Text(
                'Sample opening',
                style: TextStyle(
                  color: grey,
                  fontSize: 13,
                ),
              ),
              TextButton(
                onPressed: () {
                  openFrontendIntern(context);
                },
                child: const Text(
                  'Register interest →',
                  style: TextStyle(
                    color: Color(0xFFFF7777),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // CLOSING SECTION
  Widget closingSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 75,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF191515),
        border: Border(
          top: BorderSide(color: border),
          bottom: BorderSide(color: border),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionLabel('YOUR NEXT CHAPTER STARTS HERE'),

              const SizedBox(height: 25),

              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'A good idea deserves\n',
                      style: TextStyle(color: white),
                    ),
                    TextSpan(
                      text: 'a great team.',
                      style: TextStyle(
                        color: Color(0xFFFF7777),
                      ),
                    ),
                  ],
                ),
                style: TextStyle(
                  fontSize: 42,
                  height: 1.2,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Tell us what you’re thinking. Let’s work out what’s next.',
                style: TextStyle(
                  color: grey,
                  fontSize: 16,
                  height: 1.7,
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  showMessage(
                    context,
                    'Contact MicroX to start a conversation.',
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: red,
                  foregroundColor: white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Start a conversation'),
                    SizedBox(width: 12),
                    Icon(Icons.north_east, size: 17),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // FOOTER LINK STYLE
  Widget footerLinks(List<String> links) {
    return Wrap(
      spacing: 18,
      runSpacing: 12,
      children: links.map((link) {
        return Text(
          link,
          style: const TextStyle(
            color: grey,
            fontSize: 13,
          ),
        );
      }).toList(),
    );
  }

  // NORMAL FOOTER
  Widget footer(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      color: background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'micro x.',
            style: TextStyle(
              color: white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: -1,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'Good ideas deserve great engineering.',
            style: TextStyle(
              color: grey,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'Remote · Working across time zones',
            style: TextStyle(
              color: grey,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 35),

          const Text(
            'EXPLORE',
            style: TextStyle(
              color: white,
              fontSize: 12,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          footerLinks([
            'Services',
            'Our work',
            'The studio',
            'Our team',
          ]),

          const SizedBox(height: 28),

          const Text(
            'CONNECT',
            style: TextStyle(
              color: white,
              fontSize: 12,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          footerLinks([
            'Community',
            'Careers',
            'Contact us',
            'Verify a certificate',
          ]),

          const SizedBox(height: 28),

          const Text(
            'STAY IN THE LOOP',
            style: TextStyle(
              color: white,
              fontSize: 12,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          footerLinks([
            'Studio notes',
            'LinkedIn',
            'GitHub',
          ]),

          const SizedBox(height: 30),

          const Divider(color: border),

          const SizedBox(height: 18),

          const Text(
            '© 2026 MicroX. Built with purpose.',
            style: TextStyle(
              color: grey,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 12),

          footerLinks([
            'Privacy',
          ]),

          const SizedBox(height: 12),

          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PortalLoginScreen(),
                ),
              );
            },
            child: const Text(
              'Team portal →',
              style: TextStyle(color: grey),
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Pause motion',
            style: TextStyle(
              color: grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // LARGE FINAL MICROX BRANDING
  Widget finalBrandSection(bool isDesktop) {
    return Container(
      width: double.infinity,
      color: background,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 60 : 20,
        vertical: isDesktop ? 70 : 45,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: const Text(
              'micro x.',
              style: TextStyle(
                color: white,
                fontSize: 150,
                height: 0.9,
                fontWeight: FontWeight.w800,
                letterSpacing: -10,
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'INDEPENDENT MINDS. SHARED AMBITION.',
            style: TextStyle(
              color: grey,
              fontSize: 12,
              letterSpacing: 3,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth >= 800;
            final horizontalPadding = isDesktop ? 70.0 : 25.0;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HEADER
                  MicroxHeader(
                    onPortalTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const PortalLoginScreen(),
                        ),
                      );
                    },
                  ),

                  // HACKATHON ANNOUNCEMENT
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    color: red,
                    child: const Text(
                      'MicroX November Hackathon · Planned after 9 November. Early registration is open.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: white,
                        fontSize: 13,
                      ),
                    ),
                  ),

                  // HERO SECTION
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: isDesktop ? 90 : 65,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 1100,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sectionLabel('GROW WITH US'),

                            const SizedBox(height: 28),

                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 850,
                              ),
                              child: Text(
                                'Your next chapter starts with curiosity.',
                                style: TextStyle(
                                  color: white,
                                  fontSize: isDesktop ? 64 : 42,
                                  height: 1.12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            const SizedBox(height: 25),

                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 650,
                              ),
                              child: const Text(
                                'Bring your perspective, your questions and your willingness to build. Explore opportunities to join MicroX.',
                                style: TextStyle(
                                  color: grey,
                                  fontSize: 17,
                                  height: 1.8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // INTERNSHIP SECTION
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 1100,
                        ),
                        child: internshipCard(context),
                      ),
                    ),
                  ),

                  const SizedBox(height: 100),

                  // CLOSING SECTION
                  closingSection(context),

                  // NORMAL FOOTER
                  footer(context),

                  // LARGE FINAL BRANDING
                  finalBrandSection(isDesktop),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
