import 'package:dartz/dartz.dart';
import 'package:fkrni/core/error/failures.dart';
import 'package:fkrni/features/reminder/domain/entities/reminder_entitie.dart';
import 'package:fkrni/features/reminder/domain/usecases/get_all_reminder_usecase.dart';
import 'package:fkrni/features/reminder/domain/usecases/store_reminder_usecase.dart';

abstract class BaseReminderRepositories {
  Future<Either<Failure, List<ReminderEntitie>>> getAllReminders(
      ReminderParams params);

  Future<Either<Failure, void>> insertReminder(INsertedReminderParams params);
}
