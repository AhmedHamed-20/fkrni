import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fkrni/core/base_usecase/base_usecase.dart';
import 'package:fkrni/core/error/failures.dart';
import 'package:fkrni/features/reminder/domain/repositories/reminder_repositories.dart';

class ReminderDeleteUsecase extends BaseUsecase<int, DeleteReinderParams> {
  final BaseReminderRepositories baseReminderRepositories;

  ReminderDeleteUsecase(this.baseReminderRepositories);
  @override
  Future<Either<Failure, int>> call(DeleteReinderParams params) async {
    return await baseReminderRepositories.deleteReminderById(params);
  }
}

class DeleteReinderParams extends Equatable {
  final int reminderId;
  final String tableName;

  const DeleteReinderParams(this.reminderId, this.tableName);
  @override
  List<Object?> get props => [reminderId, tableName];
}
