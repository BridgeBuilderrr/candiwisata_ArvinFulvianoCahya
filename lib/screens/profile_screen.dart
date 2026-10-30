import 'package:flutter/material.dart';
import 'package:joy/providers/auth_provider.dart';
import 'package:joy/providers/favorite_provider.dart';
import 'package:joy/screens/sign_in_screen.dart';
import 'package:provider/provider.dart';

class ProfileInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ProfileInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 130,
            child: Row(
              children: [
                Icon(icon, color: Colors.deepPurple),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteCount = context.watch<FavoriteProvider>().count;
    final auth = context.watch<AuthProvider>();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 200 - 50),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.deepPurple,
                            width: 2,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('images/placeholder_image.png'),
                        ),
                      ),
                      if (auth.isSignedIn)
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.deepPurple[50],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ProfileInfoItem(
                icon: Icons.favorite,
                label: 'Favorit',
                value: favoriteCount > 0 ? '$favoriteCount' : '0',
              ),
              ProfileInfoItem(
                icon: Icons.person,
                label: 'User',
                value: auth.isSignedIn ? auth.username : 'Belum login',
              ),
              ProfileInfoItem(
                icon: Icons.lock,
                label: 'Status',
                value: auth.isSignedIn ? 'Signed In' : 'Signed Out',
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.deepPurple),
              const SizedBox(height: 20),
              auth.isSignedIn
                  ? TextButton(
                      onPressed: () => context.read<AuthProvider>().signOut(),
                      child: const Text('Sign Out'),
                    )
                  : TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignInScreen(),
                          ),
                        );
                      },
                      child: const Text('Sign In'),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
