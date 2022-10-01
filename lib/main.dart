import 'package:fkrni/core/database/database_setup.dart';
import 'package:fkrni/features/reminder/presentation/bloc/reminder_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/services/service_locator.dart';
import 'core/theme/theme_data.dart';
import 'features/reminder/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  await DatabaseProvider.init(
    databasesName: 'reminder.db',
    version: 1,
    query:
        '''CREATE TABLE reminder (id INTEGER PRIMARY KEY,word TEXT,translation TEXT,createdTime TEXT,availbleTimes TEXT,remindState INTEGER)''',
  );

  // print(await DatabaseProvider.getAllDataFromDatabase('reminder'));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => servicelocator<ReminderBloc>()
            ..add(const GetAllRemindersEvent('reminder')),
        ),
      ],
      child:
          BlocBuilder<ReminderBloc, ReminderState>(builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fkrni',
          themeMode: state.themedataSwitch.index == 0
              ? ThemeMode.light:ThemeMode.dark,
          darkTheme: ThemeDataValues.darkMode,
          theme: ThemeDataValues.lightMode
             ,
          home: const HomeScreen(),
        );
      }),
    );
  }
}
