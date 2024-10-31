import 'package:flutter/material.dart';

class JobAsk extends StatefulWidget {
  const JobAsk({super.key});

  @override
  State<JobAsk> createState() => _JobAskState();
}

class _JobAskState extends State<JobAsk> {
  
  final List<Map<String, dynamic>> jobs = [
    {'title': 'Développeur Flutter', 'date': '2024-10-01', 'status': 'Accepté'},
    {'title': 'Ingénieur DevOps', 'date': '2024-09-28', 'status': 'En attente'},
    {'title': 'Analyste Sécurité', 'date': '2024-09-20', 'status': 'Refusé'},
    {'title': 'Chef de Projet IT', 'date': '2024-09-15', 'status': 'Accepté'},
  ];

  
  bool isDatePassed(String date) {
    final jobDate = DateTime.parse(date);
    return jobDate.isBefore(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
           
            Expanded(
              child: ListView.builder(
                itemCount: jobs.length,
                itemBuilder: (context, index) {
                  final isPassed = isDatePassed(jobs[index]['date']);
                  return Card(
                    elevation: 5,
                    // margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: const Icon(
                        Icons.work,
                        color: Colors.blueAccent,
                      ),
                      title: Text(
                        jobs[index]['title']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_today, 
                                size: 16,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 4),
                              Text('Postulé le: ${jobs[index]['date']}'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle, // Icône pour l'état
                                size: 16,
                                color: isPassed ? Colors.red : Colors.green,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'État: ${jobs[index]['status']}',
                                style: TextStyle(
                                  color: isPassed ? Colors.red : Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                         
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          
                        },
                        child: const Text('Détails'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}