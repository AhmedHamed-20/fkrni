part of 'reminder_bloc.dart';

class ReminderState extends Equatable {
  final RequestState requestState;
  final List<ReminderEntitie> reminderEntitie;
  final String errorMessage;
  final void rawId;
  final ThemedataSwitch themedataSwitch;

  const ReminderState({
    this.reminderEntitie = const [],
    this.errorMessage = '',
    this.requestState = RequestState.loading,
    this.themedataSwitch = ThemedataSwitch.light,
    this.rawId,
  });

  ReminderState copyWith({
    List<ReminderEntitie>? reminderEntitie,
    RequestState? requestState,
    String? errorMessage,
    ThemedataSwitch? themedataSwitch,
    rawId,
  }) {
    return ReminderState(
      reminderEntitie: reminderEntitie ?? this.reminderEntitie,
      requestState: requestState ?? this.requestState,
      themedataSwitch: themedataSwitch ?? this.themedataSwitch,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        reminderEntitie,
        requestState,
        errorMessage,
        themedataSwitch,
      ];
}
