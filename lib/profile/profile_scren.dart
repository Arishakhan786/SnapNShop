import 'package:flutter/material.dart';
import 'package:frehas_task/navigations/navigator.dart'; // Use your existing named routes

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Mock (read-only) data – later you can pass real user data via constructor/Provider.
  String get _name => 'Matilda Brown';
  String get _email => 'matilda.brown@email.com';
  String get _address =>
      '24, Riverbend Court,\nChicago, IL 60609, United States';
  String get _paymentMasked => 'Visa **** 1234 (Exp 12/25)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _ProfileHeader(name: _name, email: _email),

              const SizedBox(height: 24),
              const _SectionTitle('Account'),

              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _ProfileTile(
                      icon: Icons.receipt_long,
                      title: 'My Orders',
                      subtitle: 'View order history and status',
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.orders, // e.g. '/orders'
                      ),
                    ),
                    const Divider(height: 1),
                    _ProfileTile(
                      icon: Icons.location_on,
                      title: 'Shipping addresses',
                      subtitle: 'Default address (read-only)',
                      onTap: () => _showReadonlySheet(
                        context,
                        title: 'Shipping Address',
                        lines: [_address],
                      ),
                    ),
                    const Divider(height: 1),
                    _ProfileTile(
                      icon: Icons.credit_card,
                      title: 'Payment methods',
                      subtitle: 'Default payment (read-only)',
                      onTap: () => _showReadonlySheet(
                        context,
                        title: 'Payment Method',
                        lines: [_paymentMasked],
                      ),
                    ),
                    const Divider(height: 1),
                    _ProfileTile(
                      icon: Icons.settings,
                      title: 'Settings',
                      subtitle: 'Personal info, notifications, password',
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.settings, // e.g. '/settings'
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              _DangerCard(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.logout),
                  label: const Text(
                    'Log out',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  onPressed: () => _confirmLogout(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- Helpers ----------

  void _showReadonlySheet(
    BuildContext context, {
    required String title,
    required List<String> lines,
  }) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ...lines.map(
                (t) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(t, style: const TextStyle(fontSize: 15)),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: const [
                  Icon(Icons.info_outline, size: 18, color: Colors.grey),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'This information is read-only on this screen.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Close'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _confirmLogout(BuildContext context) async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Log out?'),
        content: const Text(
          'You will need to sign in again to access your account.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Log out', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (shouldLogout == true) {
      // TODO: Add your sign-out logic here (Supabase/Firebase/etc.)
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Logged out')));
      Navigator.pop(context); // go back after logout
    }
  }
}

// ================== UI bits ==================

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.name, required this.email});

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150?img=12', // placeholder avatar
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(email, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            IconButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.settings),
              icon: const Icon(Icons.edit_outlined),
              tooltip: 'Go to Settings',
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.red.withOpacity(0.12),
        child: Icon(icon, color: Colors.red),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
    );
  }
}

class _DangerCard extends StatelessWidget {
  const _DangerCard({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red.withOpacity(0.06),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(padding: const EdgeInsets.all(12), child: child),
    );
  }
}
