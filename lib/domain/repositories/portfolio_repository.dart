import '../entities/experience_entity.dart';
import '../entities/project_entity.dart';
import '../entities/service_entity.dart';
import '../entities/skill_entity.dart';

/// Abstract contract the presentation layer depends on. The data layer
/// provides the concrete implementation (currently backed by static
/// local data, but this could be swapped for a remote API/Firestore
/// implementation without touching any UI code).
abstract class PortfolioRepository {
  List<ProjectEntity> getProjects();
  List<SkillEntity> getSkills();
  List<ExperienceEntity> getExperience();
  List<ServiceEntity> getServices();
}
