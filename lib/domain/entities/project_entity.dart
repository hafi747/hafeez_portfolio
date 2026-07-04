import 'package:flutter/material.dart';

enum ProjectCategory { mobile, ai, uiux }

/// Pure domain entity describing a portfolio project.
/// Has no dependency on data sources or UI beyond IconData typing.
class ProjectEntity {
  final String id;
  final String title;
  final String description;
  final List<String> techStack;
  final IconData icon;
  final ProjectCategory category;
  final String? githubUrl;
  final String? liveUrl;
  final List<String> highlights;

  const ProjectEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.techStack,
    required this.icon,
    required this.category,
    this.githubUrl,
    this.liveUrl,
    this.highlights = const [],
  });
}
