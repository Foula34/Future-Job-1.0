
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/home/job_detail_screen.dart';
import 'package:myapp/models/job_item_model.dart';



class JobPost extends StatelessWidget {
  final JobItem jobItem;

  const JobPost({
    super.key,
    required this.jobItem,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => JobDetailsPage(jobItem: jobItem),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(jobItem.companyLogo, width: 40),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    jobItem.jobTitle,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Temps Plein',
                    style: GoogleFonts.roboto(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              jobItem.salary,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}