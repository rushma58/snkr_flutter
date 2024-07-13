import 'package:flutter/material.dart';

class ComparisonResult extends StatelessWidget {
  final String comparison;

  const ComparisonResult({super.key, required this.comparison});

  @override
  Widget build(BuildContext context) {
    final sections = comparison.split('\n\n');
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sections.length,
      itemBuilder: (context, index) {
        final section = sections[index];
        if (section.startsWith('##')) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              section.replaceAll('#', '').trim(),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          );
        } else if (section.startsWith('**')) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              section.replaceAll('*', '').trim(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: section.split('\n').map((line) {
                if (line.startsWith('***')) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      line.replaceAll('*', '').trim(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child:
                        Text(line.trim(), style: const TextStyle(fontSize: 16)),
                  );
                }
              }).toList(),
            ),
          );
        }
      },
    );
  }
}
