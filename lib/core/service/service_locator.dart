import 'package:dev_zone/features/home/data/repos/home_repo_implementation.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorSetup() {
  getIt.registerSingleton<HomeRepoImplementation>(HomeRepoImplementation());
}
