
import 'package:flutter/material.dart';

class MicroxHeader extends StatelessWidget {
  final VoidCallback onPortalTap;

  const MicroxHeader({
    super.key,
    required this.onPortalTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      color: const Color(0xFF111111),
      child: Row(
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              children: [
                TextSpan(text: 'micro'),
                TextSpan(
                  text: 'x',
                  style: TextStyle(color: Color(0xFFC90000)),
                ),
              ],
            ),
          ),
          const Spacer(),
          OutlinedButton(
            onPressed: onPortalTap,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(
                color: Color(0xFFC90000),
              ),
            ),
            child: const Text('Team Portal'),
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
