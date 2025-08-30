import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.deepOrange,
        elevation: 0,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),

          // Profile Section
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg",
              ),
            ),
            title: const Text("Arisha Khan"),
            subtitle: const Text("arisha@example.com"),
            trailing: const Icon(Icons.edit, color: Colors.grey),
            onTap: () {
              // Navigate to Edit Profile
            },
          ),

          const Divider(),

          // Settings Options
          buildSettingItem(Icons.person, "Edit Profile", () {}),
          buildSettingItem(Icons.notifications, "Notifications", () {}),
          buildSettingItem(Icons.lock, "Privacy & Security", () {}),
          buildSettingItem(Icons.help_outline, "Help & Support", () {}),
          buildSettingItem(Icons.logout, "Logout", () {}),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildSettingItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepOrange),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
