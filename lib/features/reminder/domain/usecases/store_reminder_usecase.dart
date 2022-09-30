import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fkrni/core/base_usecase/base_usecase.dart';
import 'package:fkrni/core/error/failures.dart';
import 'package:fkrni/features/reminder/domain/repositories/reminder_repositories.dart';

class StoreReminderDataUsecase
    extends BaseUsecase<void, INsertedReminderParams> {
  final BaseReminderRepositories baseReminderRepositories;

  StoreReminderDataUsecase(this.baseReminderRepositories);
  @override
  Future<Either<Failure, void>> call(INsertedReminderParams params) async {
    return await baseReminderRepositories.insertReminder(params);
  }
}

class INsertedReminderParams extends Equatable {
  final String word;
  final String translation;
  final DateTime createdTime;
  final List<DateTime> availbleTimes;
  final int remindState;

  const INsertedReminderParams(
      {required this.word,
      required this.translation,
      required this.createdTime,
      required this.availbleTimes,
      required this.remindState});

  @override
  List<Object?> get props => [
        word,
        translation,
        createdTime,
        availbleTimes,
        remindState,
      ];
}
