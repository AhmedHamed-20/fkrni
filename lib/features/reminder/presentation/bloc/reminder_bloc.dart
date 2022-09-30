import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fkrni/core/utl/request_state.dart';
import 'package:fkrni/features/reminder/domain/entities/reminder_entitie.dart';
import 'package:fkrni/features/reminder/domain/usecases/get_all_reminder_usecase.dart';

import '../../domain/usecases/store_reminder_usecase.dart';
part 'reminder_event.dart';
part 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  ReminderBloc(this.reminderUseCases, this.storeReminderDataUsecase)
      : super(const ReminderState()) {
    on<GetAllRemindersEvent>(_getAllReminders);
    on<InsertReminderIntoDatabaseEvent>(_insertIntoDatabaseReminder);
  }

  ReminderUseCases reminderUseCases;
  StoreReminderDataUsecase storeReminderDataUsecase;

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
}
