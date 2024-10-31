import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/models/notification_model.dart'; 

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<AppNotification> notifications = [ 
    AppNotification(
      id: 'notif1',
      userId: 'user1',
      title: 'Nimba Hub Notification',
      body: 'Vous avez reçu une notification de la part de Nimba hub',
      timestamp: DateTime.now(),
    ),
    AppNotification(
      id: 'notif2',
      userId: 'user2',
      title: 'Nimba Hub Notification',
      body: 'Vous avez reçu une notification de la part de Nimba hub',
      timestamp: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notifications',
                style: GoogleFonts.roboto(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10.0),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return ListTile(
                    leading: const CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage('assets/images/me.jpg'),
                    ),
                    title: Text(
                      notification.body,
                      style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      '${notification.timestamp.hour}:${notification.timestamp.minute.toString().padLeft(2, '0')}',
                      style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}