import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        title:  Text("Profile",style: GoogleFonts.roboto(
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
                'Preferred Job: ${widget.user.preferredJobType}',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),

              // Actions (Appel, Message, etc.)
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

              // Contenu principal sur fond bleu
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue,
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
                        'Réseaux sociaux',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          'LinkedIn: ${widget.user.linkedIn}\nTwitter: ${widget.user.twitter}\nInstagram: ${widget.user.instagram}'),
                      trailing: const Icon(Icons.link),
                    ),
                    const Divider(),

                    
                    ListTile(
                      leading:const Icon(Icons.settings) ,
                      title: const Text(
                        'Paramètres',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(Icons.arrow_back),
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      
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
            ],
          ),
        ),
      ),
    );
  }
}

// SettingsScreen reste inchangé
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Compte'),
            subtitle: Text('Modifier les informations de votre compte'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Sécurité'),
            subtitle: Text('Modifier les paramètres de sécurité'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            subtitle: Text('Configurer les préférences de notification'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Confidentialité'),
            subtitle: Text('Paramètres de confidentialité'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Langue'),
            subtitle: Text('Changer la langue de l\'application'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Aide et support'),
            subtitle: Text('Obtenir de l\'aide pour utiliser l\'application'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('À propos'),
            subtitle: Text('Informations sur l\'application'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}