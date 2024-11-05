import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/home/settings_screen.dart';

import '../../models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profil",
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/me.jpg'),
              ),
              const SizedBox(height: 16),
              Text(
                widget.user.name,
                style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Type d’emploi préféré: ${widget.user.preferredJobType}',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),

              // Actions rapides (Appel, Message, etc.)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.email, color: Colors.black),
                    onPressed: () {
                      // Action pour envoyer un email
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.phone, color: Colors.black),
                    onPressed: () {
                      // Action pour appeler
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.star, color: Colors.black),
                    onPressed: () {
                      // Action pour ajouter aux favoris
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.share, color: Colors.black),
                    onPressed: () {
                      // Action pour partager
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Section principale avec fond coloré
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: const Text(
                        'Email',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(widget.user.email),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Numéro de téléphone',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(widget.user.phoneNumber),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Adresse',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(widget.user.address),
                      trailing: const Icon(Icons.location_on),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Préférences de travail',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Type: ${widget.user.preferredJobType}\n'
                        'Secteur: ${widget.user.preferredIndustry}\n'
                        'Localisation: ${widget.user.preferredLocation}',
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Candidatures en cours',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('2 candidatures en attente'),
                      trailing: const Icon(Icons.work_outline),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Événements et webinaires',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Prochain événement : Webinaire sur le CV'),
                      trailing: const Icon(Icons.event),
                      onTap: () {
                        // Naviguer vers la page des événements
                      },
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Recommandations',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Emplois recommandés pour vous'),
                      trailing: const Icon(Icons.recommend),
                      onTap: () {
                        // Naviguer vers la page des recommandations
                      },
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Réseaux sociaux',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          'LinkedIn: ${widget.user.linkedIn}\nTwitter: ${widget.user.twitter}\nInstagram: ${widget.user.instagram}'),
                      trailing: const Icon(Icons.link),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text(
                        'Paramètres',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Bouton pour modifier le profil
              ElevatedButton.icon(
                onPressed: () {
                  // Action de modification du profil
                },
                icon: const Icon(Icons.edit),
                label: const Text('Modifier le profil'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4C41A3),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
