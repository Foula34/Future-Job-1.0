import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart'; // N'oubliez pas d'importer le package share_plus

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 18.0, right: 18.0, bottom: 50.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/me.jpg'),
                  fit: BoxFit.cover, // Ajuste l'image pour couvrir tout le conteneur
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Foula Fofana',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 3.0),
            Text(
              "fofanafoula70@gmail.com",
              style: GoogleFonts.roboto(
                color: Colors.grey,
                fontSize: 15.0,
              ),
            ),
            const SizedBox(height: 20.0),

            // GestureDetector for Profile
            _buildDrawerItem(
              context,
              icon: Icons.person_rounded,
              text: 'Modifier le Profil',
              onTap: () => Navigator.pushNamed(context, '/profile'),
            ),

            const SizedBox(height: 20.0),

            // GestureDetector for Settings
            _buildDrawerItem(
              context,
              icon: Icons.settings,
              text: 'Paramètre',
              onTap: () => Navigator.pushNamed(context, '/setting'),
            ),

            const SizedBox(height: 20.0),

            // GestureDetector for Share
            _buildDrawerItem(
              context,
              icon: Icons.favorite,
              text: "Partager l'application",
              onTap: () => _shareApp(), // Appel de la méthode _shareApp
            ),

            const SizedBox(height: 20.0),

            // Logout
            _buildDrawerItem(
              context,
              icon: Icons.logout,
              text: 'Se déconnecter',
              iconColor: Colors.red[200],
              onTap: () => Navigator.pushNamed(context, '/login'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, {
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color? iconColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: iconColor ?? Colors.black),
          const SizedBox(width: 10.0),
          Text(
            text,
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  void _shareApp() {
    final String appLink = 'https://example.com/download'; // Remplacez par votre lien d'application
    final String message = 'Découvrez cette application incroyable : $appLink';
    Share.share(message);
  }
}
