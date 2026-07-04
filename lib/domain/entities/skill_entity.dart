import 'package:flutter/material.dart';

enum SkillCategory { language, framework, backend, tools }

class SkillEntity {
  final String name;
  final IconData icon;
  final double proficiency; // 0.0 - 1.0
  final SkillCategory category;

  const SkillEntity({
    required this.name,
    required this.icon,
    required this.proficiency,
    required this.category,
  });
}
