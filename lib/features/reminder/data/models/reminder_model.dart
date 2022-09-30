import 'dart:convert';

import 'package:fkrni/features/reminder/domain/entities/reminder_entitie.dart';

class ReminderModel extends ReminderEntitie {
  const ReminderModel({
    required super.word,
    required super.translation,
    required super.createdTime,
    required super.availbleTimes,
    required super.reminderState,
  });

  factory ReminderModel.fromMap(Map<String, dynamic> map) {
    return ReminderModel(
        word: map['word'],
        translation: map['translation'],
        createdTime: DateTime.parse(
          map['createdTime'],
        ),
        availbleTimes: List<DateTime>.from(
            (json.decode(map['availbleTimes']) as List)
                .map((e) => DateTime.parse(e))),
        reminderState: map['remindState'] ?? 0);
  }

  static Map<String, dynamic> toMap({
    required String word,
    required String translation,
    required DateTime createdTime,
    required List<DateTime> availbleTimes,
    required int remindState,
  }) {
    return {
      'word': word,
      'translation': translation,
      'createdTime': createdTime.toString(),
      'availbleTimes': json
          .encode((List.from(availbleTimes).map((e) => e.toString())).toList()),
      'remindState': remindState,
    };
  }
}
