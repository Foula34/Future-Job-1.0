// filter_bottom_sheet.dart
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  final String? selectedCategory;
  final String? selectedSubCategory;
  final String? selectedLocation;
  final String? selectedSalary;
  final String? selectedJobType;
  final List<String> locations;
  final List<String> salaries;
  final Function(String?) onCategoryChanged;
  final Function(String?) onSubCategoryChanged;
  final Function(String?) onLocationChanged;
  final Function(String?) onSalaryChanged;
  final Function(String?) onJobTypeChanged;

  const FilterBottomSheet({
    super.key,
    required this.selectedCategory,
    required this.selectedSubCategory,
    required this.selectedLocation,
    required this.selectedSalary,
    required this.selectedJobType,
    required this.locations,
    required this.salaries,
    required this.onCategoryChanged,
    required this.onSubCategoryChanged,
    required this.onLocationChanged,
    required this.onSalaryChanged,
    required this.onJobTypeChanged,
  });

  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filtrer',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Dropdown pour la catégorie
            const Text('Categorie'),
            DropdownButton<String>(
              isExpanded: true,
              value: widget.selectedCategory,
              hint: const Text('Selectionnez une categorie'),
              items: <String>['UI/UX Design', 'Development', 'Marketing']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: widget.onCategoryChanged,
            ),
            const SizedBox(height: 20),

            // Dropdown pour la sous-catégorie
            const Text('Sous-categorie'),
            DropdownButton<String>(
              isExpanded: true,
              value: widget.selectedSubCategory,
              hint: const Text('Selectionnez une sous-categorie'),
              items: <String>['Web Development', 'Mobile Development']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: widget.onSubCategoryChanged,
            ),
            const SizedBox(height: 20),

            // Dropdown pour la localisation
            const Text('Localisation'),
            DropdownButton<String>(
              isExpanded: true,
              value: widget.selectedLocation,
              hint: const Text('Selectionnez une localisation'),
              items: widget.locations.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: widget.onLocationChanged,
            ),
            const SizedBox(height: 20),

            // Dropdown pour le salaire
            const Text('Salaire'),
            DropdownButton<String>(
              isExpanded: true,
              value: widget.selectedSalary,
              hint: const Text('Selectionnez un salaire'),
              items: widget.salaries.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: widget.onSalaryChanged,
            ),
            const SizedBox(height: 20),

            // Dropdown pour le type de travail
            const Text('Type de travail'),
            DropdownButton<String>(
              isExpanded: true,
              value: widget.selectedJobType,
              hint: const Text('Selectionnez un type de travail'),
              items: <String>['Temps plein', 'Temps partiel']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: widget.onJobTypeChanged,
            ),
            const SizedBox(height: 20),

            // Bouton pour appliquer les filtres
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Appliquer'),
            ),
          ],
        ),
      ),
    );
  }
}