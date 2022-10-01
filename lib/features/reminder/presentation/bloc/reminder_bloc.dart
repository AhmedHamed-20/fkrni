import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fkrni/core/theme/theme_data.dart';
import 'package:fkrni/core/utl/request_state.dart';
import 'package:fkrni/features/reminder/domain/entities/reminder_entitie.dart';
import 'package:fkrni/features/reminder/domain/usecases/delete_reminder_by_id.dart';
import 'package:fkrni/features/reminder/domain/usecases/get_all_reminder_usecase.dart';
import 'package:flutter/material.dart';

import '../../domain/usecases/store_reminder_usecase.dart';
part 'reminder_event.dart';
part 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  ReminderBloc(this.reminderUseCases, this.storeReminderDataUsecase,
      this.reminderDeleteUsecase)
      : super(const ReminderState()) {
    on<GetAllRemindersEvent>(_getAllReminders);
    on<InsertReminderIntoDatabaseEvent>(_insertIntoDatabaseReminder);
    on<ChangeThemeModeEvent>(_changeThemeMode);
    on<DeleteReminderByIdEvent>(_deleteReminderById);
  }

  ReminderUseCases reminderUseCases;
  StoreReminderDataUsecase storeReminderDataUsecase;
  ReminderDeleteUsecase reminderDeleteUsecase;
  FutureOr<void> _getAllReminders(
      GetAllRemindersEvent event, Emitter<ReminderState> emit) async {
    final result = await reminderUseCases(ReminderParams(event.tableName));
    result.fold(
      (l) => emit(state.copyWith(
          errorMessage: l.message, requestState: RequestState.error)),
      (r) => emit(
        state.copyWith(reminderEntitie: r, requestState: RequestState.loaded),
      ),
    );
  }

  FutureOr<void> _insertIntoDatabaseReminder(
      InsertReminderIntoDatabaseEvent event,
      Emitter<ReminderState> emit) async {
    final result = await storeReminderDataUsecase(
      INsertedReminderParams(
          availbleTimes: event.availbleTimes,
          createdTime: event.createdTime,
          remindState: event.remindState,
          translation: event.translation,
          word: event.word),
    );
    emit(state.copyWith(requestState: RequestState.loading));
    result.fold(
        (l) => emit(state.copyWith(
            errorMessage: l.message, requestState: RequestState.error)),
        (r) => emit(state.copyWith(requestState: RequestState.loaded)));
  }

  FutureOr<void> _changeThemeMode(
      ChangeThemeModeEvent event, Emitter<ReminderState> emit) {
    event.currentTheme == ThemeDataValues.lightMode
        ? emit(state.copyWith(themedataSwitch: ThemedataSwitch.light))
        : emit(state.copyWith(themedataSwitch: ThemedataSwitch.dark));
  }

  FutureOr<void> _deleteReminderById(
      DeleteReminderByIdEvent event, Emitter<ReminderState> emit) async {
    final result =
        await reminderDeleteUsecase(DeleteReinderParams(event.reminderId));
    emit(state.copyWith(requestState: RequestState.loading));
    result.fold(
        (l) => emit(state.copyWith(
            errorMessage: l.message, requestState: RequestState.error)),
        (r) => emit(state.copyWith(
            reminderDeleteInt: r, requestState: RequestState.loaded)));
  }
}
