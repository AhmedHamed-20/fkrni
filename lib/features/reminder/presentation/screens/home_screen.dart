import 'dart:convert';

import 'package:fkrni/core/const/app_elevation.dart';
import 'package:fkrni/core/const/app_padding.dart';
import 'package:fkrni/core/const/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/const/const.dart';
import '../../../../core/utl/request_state.dart';
import '../bloc/reminder_bloc.dart';
import '../widgets/reminder_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('fkrni')),
      body: Column(
        children: [
          const RemindersList(),
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
