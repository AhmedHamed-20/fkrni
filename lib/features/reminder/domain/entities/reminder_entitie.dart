import 'package:equatable/equatable.dart';
import 'package:fkrni/features/reminder/presentation/bloc/reminder_bloc.dart';

class ReminderEntitie extends Equatable {
  final String word;
  final String translation;
  final DateTime createdTime;
  final List<DateTime> availbleTimes;
  final int reminderState;
  final int id;

  const ReminderEntitie(
      {required this.word,
      required this.translation,
      required this.createdTime,
      required this.availbleTimes,
      required this.reminderState,
      required this.id});

  @override
  List<Object?> get props => [
        word,
        translation,
        createdTime,
        availbleTimes,
        reminderState,
        id,
      ];
}
