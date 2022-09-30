import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fkrni/core/base_usecase/base_usecase.dart';
import 'package:fkrni/core/error/failures.dart';
import 'package:fkrni/features/reminder/domain/entities/reminder_entitie.dart';
import 'package:fkrni/features/reminder/domain/repositories/reminder_repositories.dart';

class ReminderUseCases
    extends BaseUsecase<List<ReminderEntitie>, ReminderParams> {
  final BaseReminderRepositories baseReminderRepositories;

  ReminderUseCases(this.baseReminderRepositories);
  @override
  Future<Either<Failure, List<ReminderEntitie>>> call(
      ReminderParams params) async {
    return await baseReminderRepositories.getAllReminders(params);
  }
}

class ReminderParams extends Equatable {
  final String tableName;

  const ReminderParams(this.tableName);

  @override
  List<Object?> get props => [tableName];
}
