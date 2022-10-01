import 'package:fkrni/features/reminder/data/datasource/local_reminder_datasource.dart';
import 'package:fkrni/features/reminder/data/repositories/reminder_repositories.dart';
import 'package:fkrni/features/reminder/domain/repositories/reminder_repositories.dart';
import 'package:fkrni/features/reminder/domain/usecases/delete_reminder_by_id.dart';
import 'package:fkrni/features/reminder/domain/usecases/get_all_reminder_usecase.dart';
import 'package:fkrni/features/reminder/domain/usecases/store_reminder_usecase.dart';
import 'package:fkrni/features/reminder/presentation/bloc/reminder_bloc.dart';
import 'package:get_it/get_it.dart';

final servicelocator = GetIt.instance;

class ServiceLocator {
  void init() {
    //Bloc
    servicelocator.registerFactory<ReminderBloc>(() =>
        ReminderBloc(servicelocator(), servicelocator(), servicelocator()));

    //useCases
    servicelocator
        .registerLazySingleton(() => ReminderUseCases(servicelocator()));
    servicelocator.registerLazySingleton(
        () => StoreReminderDataUsecase(servicelocator()));
    servicelocator
        .registerLazySingleton(() => ReminderDeleteUsecase(servicelocator()));
    //Repositories
    servicelocator.registerLazySingleton<BaseReminderRepositories>(
        () => ReminderRepositoriesImpl(servicelocator()));

    //DataSource
    servicelocator.registerLazySingleton<BaseLocalReminderDatasource>(
        () => LocalReminderDatasource());
  }
}
