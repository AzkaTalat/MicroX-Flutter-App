
import 'package:flutter/material.dart';
import '../../widgets/microx_header.dart';
import '../team_portal/portal_login_screen.dart';

class FrontendInternScreen extends StatefulWidget {
  const FrontendInternScreen({super.key});

  @override
  State<FrontendInternScreen> createState() =>
      _FrontendInternScreenState();
}

class _FrontendInternScreenState extends State<FrontendInternScreen> {
  static const background = Color(0xFF111111);
  static const card = Color(0xFF1D1B1B);
  static const red = Color(0xFFC90000);
  static const white = Colors.white;
  static const grey = Color(0xFF999999);
  static const border = Color(0xFF444040);

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final portfolioController = TextEditingController();
  final introductionController = TextEditingController();

  // Hidden honeypot field for basic spam protection.
  final honeypotController = TextEditingController();

  bool privacyAccepted = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    portfolioController.dispose();
    introductionController.dispose();
    honeypotController.dispose();
    super.dispose();
  }

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

  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0xFF777777)),
      filled: true,
      fillColor: card,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 18,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: red, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: Colors.red),
      ),
    );
  }

  Widget fieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          color: white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget applicationForm() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: border),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Regarding Frontend developer intern',
              style: TextStyle(
                color: grey,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 28),

            // Hidden honeypot field. Real users should never see or fill it.
            Offstage(
              offstage: true,
              child: TextFormField(
                controller: honeypotController,
                decoration: const InputDecoration(
                  hintText: 'Leave this empty',
                ),
              ),
            ),

            fieldLabel('Your name *'),
            TextFormField(
              controller: nameController,
              style: const TextStyle(color: white),
              decoration: inputDecoration('Alex Morgan'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),

            const SizedBox(height: 22),

            fieldLabel('Email address *'),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: white),
              decoration: inputDecoration('alex@company.com'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your email';
                }

                if (!RegExp(
                  r'^[^@]+@[^@]+\.[^@]+$',
                ).hasMatch(value.trim())) {
                  return 'Enter a valid email address';
                }

                return null;
              },
            ),

            const SizedBox(height: 22),

            fieldLabel('Portfolio or GitHub'),
            TextFormField(
              controller: portfolioController,
              keyboardType: TextInputType.url,
              style: const TextStyle(color: white),
              decoration: inputDecoration(
                'https://github.com/yourname',
              ),
            ),

            const SizedBox(height: 22),

            fieldLabel('Introduce yourself *'),
            TextFormField(
              controller: introductionController,
              maxLines: 5,
              style: const TextStyle(color: white),
              decoration: inputDecoration(
                'Tell us about yourself and what you want to learn...',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please introduce yourself';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: privacyAccepted,
                  activeColor: red,
                  checkColor: white,
                  side: const BorderSide(color: grey),
                  onChanged: (value) {
                    setState(() {
                      privacyAccepted = value ?? false;
                    });
                  },
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Text(
                      'I agree to the privacy notice and to being contacted about this request.',
                      style: TextStyle(
                        color: grey,
                        fontSize: 13,
                        height: 1.6,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 22),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: submitApplication,
                style: ElevatedButton.styleFrom(
                  backgroundColor: red,
                  foregroundColor: white,
                  padding: const EdgeInsets.symmetric(vertical: 19),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Send application',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 12),
                    Icon(Icons.arrow_outward, size: 18),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Center(
              child: Text(
                'No pressure. Just possibilities.',
                style: TextStyle(
                  color: grey,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void submitApplication() {
    // If the hidden field is filled, silently reject the submission.
    if (honeypotController.text.trim().isNotEmpty) {
      return;
    }

    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!privacyAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please accept the privacy notice.'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Form completed. Application submission will be connected later.',
        ),
      ),
    );
  }

  Widget internshipDetails() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              detailTag('INTERNSHIP'),
              detailTag('SAMPLE CONCEPT'),
            ],
          ),

          const SizedBox(height: 30),

          const Text(
            'Frontend developer intern',
            style: TextStyle(
              color: white,
              fontSize: 34,
              height: 1.2,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Learn by building, with guidance from the team and room to ask questions.',
            style: TextStyle(
              color: grey,
              fontSize: 16,
              height: 1.8,
            ),
          ),

          const SizedBox(height: 25),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              detailTag('React'),
              detailTag('CSS'),
              detailTag('JavaScript'),
            ],
          ),

          const SizedBox(height: 25),

          const Divider(color: border),

          const SizedBox(height: 20),

          const Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: grey,
                size: 19,
              ),
              SizedBox(width: 10),
              Text(
                'Remote',
                style: TextStyle(color: grey, fontSize: 14),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            'Sample opening — applications register interest until the team confirms this role.',
            style: TextStyle(
              color: grey,
              fontSize: 14,
              height: 1.7,
            ),
          ),

          const SizedBox(height: 18),

          const Text(
            'Proposed duration: 3 months. Proposed arrangement: unpaid internship. Working hours, mentorship, responsibilities and eligibility must be agreed in a written offer.',
            style: TextStyle(
              color: grey,
              fontSize: 14,
              height: 1.8,
            ),
          ),

          const SizedBox(height: 18),

          const Text(
            'A certificate and experience letter are planned on successful completion under the agreed terms.',
            style: TextStyle(
              color: grey,
              fontSize: 14,
              height: 1.8,
            ),
          ),

          const SizedBox(height: 18),

          const Text(
            'We welcome an introduction, a portfolio or GitHub link, and a short note on what you want to learn.',
            style: TextStyle(
              color: grey,
              fontSize: 14,
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }

  Widget detailTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF332020),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFFFF9999),
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget closingSection() {
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Contact MicroX to start a conversation.',
                      ),
                    ),
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

  Widget footer() {
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
            style: TextStyle(color: grey, fontSize: 14),
          ),

          const SizedBox(height: 12),

          const Text(
            'Remote · Working across time zones',
            style: TextStyle(color: grey, fontSize: 13),
          ),

          const SizedBox(height: 35),

          footerHeading('EXPLORE'),
          footerLinks('Services     Our work     The studio     Our team'),

          const SizedBox(height: 28),

          footerHeading('CONNECT'),
          footerLinks('Community     Careers     Contact us'),

          const SizedBox(height: 28),

          footerHeading('STAY IN THE LOOP'),
          footerLinks('Studio notes     LinkedIn     GitHub'),

          const SizedBox(height: 30),

          const Divider(color: border),

          const SizedBox(height: 18),

          const Text(
            '© 2026 MicroX. Built with purpose.',
            style: TextStyle(color: grey, fontSize: 12),
          ),

          const SizedBox(height: 18),

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
        ],
      ),
    );
  }

  Widget footerHeading(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: white,
        fontSize: 12,
        letterSpacing: 2,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget footerLinks(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text(
        text,
        style: const TextStyle(
          color: grey,
          fontSize: 13,
          height: 2,
        ),
      ),
    );
  }

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

                  // HACKATHON BANNER
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

                  // BACK TO CAREERS
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: 25,
                    ),
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.maybePop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: grey,
                        size: 17,
                      ),
                      label: const Text(
                        'Back to careers',
                        style: TextStyle(color: grey),
                      ),
                    ),
                  ),

                  // INTERNSHIP DETAILS
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 1100,
                        ),
                        child: internshipDetails(),
                      ),
                    ),
                  ),

                  const SizedBox(height: 70),

                  // APPLICATION SECTION
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 1100,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // APPLY FOR THIS ROLE label removed.

                            const Text(
                              'Make an introduction.',
                              style: TextStyle(
                                color: white,
                                fontSize: 38,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 15),

                            const Text(
                              'This is a sample listing. Register interest; final details will be confirmed by the team.',
                              style: TextStyle(
                                color: grey,
                                fontSize: 15,
                                height: 1.7,
                              ),
                            ),

                            const SizedBox(height: 30),

                            applicationForm(),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 100),

                  closingSection(),

                  footer(),

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
