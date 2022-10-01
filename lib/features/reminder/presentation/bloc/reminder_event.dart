part of 'reminder_bloc.dart';

abstract class ReminderEvent extends Equatable {
  const ReminderEvent();
}

class GetAllRemindersEvent extends ReminderEvent {
  final String tableName;

  const GetAllRemindersEvent(this.tableName);

  @override
  List<Object?> get props => [tableName];
}

class InsertReminderIntoDatabaseEvent extends ReminderEvent {
  final String word;
  final String translation;
  final DateTime createdTime;
  final List<DateTime> availbleTimes;
  final int remindState;

  const InsertReminderIntoDatabaseEvent(
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

class ChangeThemeModeEvent extends ReminderEvent {
  final ThemeData currentTheme;
  const ChangeThemeModeEvent(this.currentTheme);

  @override
  List<Object?> get props => [currentTheme];
}

class DeleteReminderByIdEvent extends ReminderEvent {
  final int reminderId;
  const DeleteReminderByIdEvent(this.reminderId);

  @override
  List<Object?> get props => [reminderId];
}
