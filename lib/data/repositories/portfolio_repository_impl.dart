import '../../domain/entities/experience_entity.dart';
import '../../domain/entities/project_entity.dart';
import '../../domain/entities/service_entity.dart';
import '../../domain/entities/skill_entity.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../datasources/portfolio_local_datasource.dart';

/// Concrete implementation of [PortfolioRepository]. Currently delegates
/// to a local static data source; swap the constructor's data source
/// for a remote one (e.g. Firestore) without changing any call sites,
/// since presentation code only ever depends on [PortfolioRepository].
class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioLocalDataSource localDataSource;

  const PortfolioRepositoryImpl({
    this.localDataSource = const PortfolioLocalDataSource(),
  });

  @override
  List<ProjectEntity> getProjects() => localDataSource.fetchProjects();

  @override
  List<SkillEntity> getSkills() => localDataSource.fetchSkills();

  @override
  List<ExperienceEntity> getExperience() => localDataSource.fetchExperience();

  @override
  List<ServiceEntity> getServices() => localDataSource.fetchServices();
}
