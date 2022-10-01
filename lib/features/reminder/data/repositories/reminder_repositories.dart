import 'package:fkrni/features/reminder/data/datasource/local_reminder_datasource.dart';
import 'package:fkrni/features/reminder/domain/entities/reminder_entitie.dart';
import 'package:fkrni/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fkrni/features/reminder/domain/repositories/reminder_repositories.dart';
import 'package:fkrni/features/reminder/domain/usecases/delete_reminder_by_id.dart';
import 'package:fkrni/features/reminder/domain/usecases/get_all_reminder_usecase.dart';
import 'package:fkrni/features/reminder/domain/usecases/store_reminder_usecase.dart';

import '../../../../core/error/exceptions.dart';

class ReminderRepositoriesImpl extends BaseReminderRepositories {
  final BaseLocalReminderDatasource baseLocalReminderDatasource;

  ReminderRepositoriesImpl(this.baseLocalReminderDatasource);
  @override
  Future<Either<Failure, List<ReminderEntitie>>> getAllReminders(
      ReminderParams params) async {
    try {
      final result = await baseLocalReminderDatasource.getAllReminders(params);
      return Right(result);
    } on AppDataBaseException catch (failure) {
      return Left(DatabaseFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, void>> insertReminder(
      INsertedReminderParams params) async {
    try {
      final resutl = await baseLocalReminderDatasource.insertReminder(params);
      return Right(resutl);
    } on AppDataBaseException catch (failure) {
      return Left(DatabaseFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, int>> deleteReminderById(
      DeleteReinderParams deleteReinderParams) async {
    try {
      final result = await baseLocalReminderDatasource
          .deleteReminderFromDatabaseById(deleteReinderParams);
      return Right(result);
    } on AppDataBaseException catch (failure) {
      return Left(DatabaseFailure(failure.errorMessageModel.message));
    }
  }
}
