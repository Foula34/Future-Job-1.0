import 'package:flutter/material.dart';
import 'package:myapp/authentication/profile_screen.dart';
import 'package:myapp/authentication/signin.dart';
import 'package:myapp/authentication/signup.dart';
import 'package:myapp/authentication/welcome_screen.dart';
import 'package:myapp/home/home_screen.dart';
import 'package:myapp/home/job_detail_screen.dart';
import 'package:myapp/home/notification_screen.dart';
import 'package:myapp/home/subscribe_job_screen.dart';


import 'package:myapp/models/job_item_model.dart'; 
import 'package:myapp/models/user_model.dart';
import 'package:myapp/widget/drawer.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    User currentUser = User(
      name: 'Foula Fofana',
      email: 'fofanafoula70@gmail.com',
      phoneNumber: '+224 624366897',
      address: 'Tombolia cité, Conakry',
      preferredJobType: 'Développeur Mobile',
      preferredIndustry: 'Technologie',
      preferredLocation: 'Guinée',
      linkedIn: 'linkedin.com/in/foulafofana',
      twitter: '@foulafofana',
      instagram: '@foula_insta',
      id: '12',
    );

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(Colors.blue.value),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/profile': (context) => ProfileScreen(user: currentUser), // Transmettez l'utilisateur ici
        '/welcome': (context) => const WelcomeScreen(),
        '/notification': (context) => const NotificationScreen(),
        '/sign': (context) => const SignScreen(),
        '/home': (context) => JobHomePage(user: currentUser), // Passez l'utilisateur ici
        '/drawer': (context) => const DrawerWidget(),
        '/details': (context) {
          final JobItem jobItem = ModalRoute.of(context)!.settings.arguments as JobItem; // Récupérer le JobItem ici
          return JobDetailsPage(jobItem: jobItem);
        },
        '/subscribe': (context) => const JobApplicationPage(),
      },
    );
  }
}
