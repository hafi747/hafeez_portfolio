import 'package:flutter/material.dart';

/// A single top-level navigation destination, shared by the desktop
/// nav bar, tablet nav rail, and mobile drawer so they never drift
/// out of sync with the router.
class NavItem {
  final String label;
  final String path;
  final IconData icon;

  const NavItem({required this.label, required this.path, required this.icon});
}

class RoutePaths {
  RoutePaths._();

  static const home = '/';
  static const about = '/about';
  static const skills = '/skills';
  static const projects = '/projects';
  static const projectDetail = '/projects/:id';
  static const experience = '/experience';
  static const services = '/services';
  static const contact = '/contact';
  static const resume = '/resume';

  static String projectDetailPath(String id) => '/projects/$id';

  static const List<NavItem> navItems = [
    NavItem(label: 'Home', path: home, icon: Icons.home_outlined),
    NavItem(label: 'About', path: about, icon: Icons.person_outline),
    NavItem(label: 'Skills', path: skills, icon: Icons.bolt_outlined),
    NavItem(label: 'Projects', path: projects, icon: Icons.grid_view_outlined),
    NavItem(label: 'Experience', path: experience, icon: Icons.work_outline),
    NavItem(label: 'Services', path: services, icon: Icons.handyman_outlined),
    NavItem(label: 'Contact', path: contact, icon: Icons.mail_outline),
    NavItem(label: 'Resume', path: resume, icon: Icons.description_outlined),
  ];
}
