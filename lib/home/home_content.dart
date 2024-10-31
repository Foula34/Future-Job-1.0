import 'package:flutter/material.dart';
import 'package:myapp/utils/list.dart';
import 'package:myapp/widget/job_card.dart';
import 'package:myapp/widget/job_post.dart';

import 'package:myapp/widget/section_title.dart';


class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
 
  

  
  String? selectedCategory;
  String? selectedSubCategory;
  String? selectedLocation;
  String? selectedSalary;
  String? selectedJobType;

  final List<String> locations = ['Toronto, Canada', 'New York, USA', 'Paris, France'];
  final List<String> salaries = ['< \$2000', '\$2000 - \$4000', '> \$4000'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          const SectionTitle(title: 'Jobs populaires'),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: jobItems.map((jobItem) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/details',
                      arguments: jobItem, 
                    );
                  },
                  child: JobCard(jobItem: jobItem),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),
          const SectionTitle(title: 'Nouvelles offres'),
          const SizedBox(height: 10),
          Column(
            children: jobItems.map((jobItem) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/details',
                    arguments: jobItem, 
                  );
                },
                child: JobPost(jobItem: jobItem),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}