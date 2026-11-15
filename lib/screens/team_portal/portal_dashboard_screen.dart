
import 'package:flutter/material.dart';

class PortalDashboardScreen extends StatelessWidget {
  const PortalDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D1B1B),
        foregroundColor: Colors.white,
        title: const Text('MicroX Team Portal'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to your workspace!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Manage your work and stay connected with your team.',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            const SizedBox(height: 30),

            dashboardCard(
              Icons.task_alt,
              'My Tasks',
              'View and manage assigned tasks',
            ),
            dashboardCard(
              Icons.groups,
              'Team Members',
              'Connect with your team',
            ),
            dashboardCard(
              Icons.person_outline,
              'My Profile',
              'View your personal information',
            ),
            dashboardCard(
              Icons.notifications_none,
              'Notifications',
              'Stay updated with announcements',
            ),
          ],
        ),
      ),
    );
  }

  Widget dashboardCard(
      IconData icon,
      String title,
      String description,
      ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1B1B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF444040)),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFC90000), size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios,
              color: Colors.grey, size: 16),
        ],
      ),
    );
  }
}
