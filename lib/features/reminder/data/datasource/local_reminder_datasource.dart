import 'dart:ffi';

import 'package:fkrni/core/database/database_setup.dart';
import 'package:fkrni/core/error/error_message_model.dart';
import 'package:fkrni/core/error/exceptions.dart';
import 'package:fkrni/features/reminder/data/models/reminder_model.dart';
import 'package:fkrni/features/reminder/domain/usecases/delete_reminder_by_id.dart';
import 'package:fkrni/features/reminder/domain/usecases/get_all_reminder_usecase.dart';
import 'package:fkrni/features/reminder/domain/usecases/store_reminder_usecase.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseLocalReminderDatasource {
  Future<List<ReminderModel>> getAllReminders(ReminderParams params);
  Future<void> insertReminder(INsertedReminderParams params);
  Future<int> deleteReminderFromDatabaseById(DeleteReinderParams params);
}

class LocalReminderDatasource extends BaseLocalReminderDatasource {
  @override
  Future<List<ReminderModel>> getAllReminders(ReminderParams params) async {
    try {
      final result =
          await DatabaseProvider.getAllDataFromDatabase(params.tableName);

      return List.from(result.map((e) => ReminderModel.fromMap(e)));
    } on DatabaseException catch (exceptions) {
      throw AppDataBaseException(
          ErrorMessageModel.fromException(exceptions.result));
    }
  }

  @override
  Future<void> insertReminder(INsertedReminderParams params) async {
    try {
      final convertedMap = ReminderModel.toMap(
          availbleTimes: params.availbleTimes,
          createdTime: params.createdTime,
          remindState: params.remindState,
          translation: params.translation,
          word: params.word);
      final result = await DatabaseProvider.insertIntoDataBase(
        data: [
          convertedMap['word'],
          convertedMap['translation'],
          convertedMap['createdTime'],
          convertedMap['availbleTimes'],
          convertedMap['remindState']
        ],
        query:
            '''INSERT INTO reminder(word,translation,createdTime,availbleTimes,remindState) VALUES(?, ?, ?, ?, ?)''',
      );

      return result;
    } on DatabaseException catch (exceptions) {
      throw AppDataBaseException(
          ErrorMessageModel.fromException(exceptions.result));
    }
  }

  @override
  Future<int> deleteReminderFromDatabaseById(DeleteReinderParams params) async {
    try {
      final result = await DatabaseProvider.deleteReimnderFromDatabaseById(
          id: params.reminderId, tableName: params.tableName);
      return result;
    } on DatabaseException catch (exceptions) {
      throw AppDataBaseException(
          ErrorMessageModel.fromException(exceptions.result));
    }
  }
}


//  (id INTEGER PRIMARY KEY,
//         word TEXT,
//         translation TEXT,
//         createdTime TEXT,
//         availbleTimes TEXT,
//         remindState INTEGER
//         )''',