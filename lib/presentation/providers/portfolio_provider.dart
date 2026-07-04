import 'package:flutter/foundation.dart';
import '../../domain/entities/experience_entity.dart';
import '../../domain/entities/project_entity.dart';
import '../../domain/entities/service_entity.dart';
import '../../domain/entities/skill_entity.dart';
import '../../domain/repositories/portfolio_repository.dart';

/// Exposes portfolio content to the UI. Reads through the
/// [PortfolioRepository] abstraction (Clean Architecture: presentation
/// depends only on the domain contract, never on the data layer).
class PortfolioProvider extends ChangeNotifier {
  final PortfolioRepository _repository;

  PortfolioProvider(this._repository) {
    _projects = _repository.getProjects();
    _skills = _repository.getSkills();
    _experience = _repository.getExperience();
    _services = _repository.getServices();
  }

  late final List<ProjectEntity> _projects;
  late final List<SkillEntity> _skills;
  late final List<ExperienceEntity> _experience;
  late final List<ServiceEntity> _services;

  List<ProjectEntity> get projects => _projects;
  List<SkillEntity> get skills => _skills;
  List<ExperienceEntity> get experience => _experience;
  List<ServiceEntity> get services => _services;

  ProjectEntity? projectById(String id) {
    for (final p in _projects) {
      if (p.id == id) return p;
    }
    return null;
  }
}
