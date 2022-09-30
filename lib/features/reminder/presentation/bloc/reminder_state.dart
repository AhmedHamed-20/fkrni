part of 'reminder_bloc.dart';

class ReminderState extends Equatable {
  final RequestState requestState;
  final List<ReminderEntitie> reminderEntitie;
  final String errorMessage;
  final void rawId;

  const ReminderState({
    this.reminderEntitie = const [],
    this.errorMessage = '',
    this.requestState = RequestState.loading,
    this.rawId,
  });

  ReminderState copyWith({
    List<ReminderEntitie>? reminderEntitie,
    RequestState? requestState,
    String? errorMessage,
    rawId,
  }) {
    return ReminderState(
      reminderEntitie: reminderEntitie ?? this.reminderEntitie,
      requestState: requestState ?? this.requestState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        reminderEntitie,
        requestState,
        errorMessage,
      ];
}
