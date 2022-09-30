import 'dart:convert';

import 'package:fkrni/core/const/app_elevation.dart';
import 'package:fkrni/core/const/app_padding.dart';
import 'package:fkrni/core/const/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/const/const.dart';
import '../../../../core/theme/theme_data.dart';
import '../../../../core/utl/request_state.dart';
import '../bloc/reminder_bloc.dart';
import '../widgets/reminder_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('fkrni'),
        actions: [
          BlocBuilder<ReminderBloc, ReminderState>(builder: (context, state) {
            return IconButton(
                onPressed: () {
                  context.read<ReminderBloc>().add(ChangeThemeModeEvent(
                      state.themedataSwitch.index == 0
                          ? ThemeDataValues.darkMode
                          : ThemeDataValues.lightMode));
                },
                icon: Icon(
                  state.themedataSwitch.index == 0
                      ? Icons.light_mode
                      : Icons.dark_mode,
                  color: themeOfIconTheme(context).color,
                ));
          })
        ],
      ),
      body: Column(
        children: [
          RemindersList(parentContext: context),
          MaterialButton(
            onPressed: () {},
            child: Icon(
              Icons.add,
              color: themeOfPrimaryColor(context),
              size: 28,
            ),
          )
        ],
      ),
    );
  }
}
