import 'package:fkrni/features/reminder/presentation/bloc/reminder_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/const/app_elevation.dart';
import '../../../../core/const/app_padding.dart';
import '../../../../core/const/app_radius.dart';
import '../../../../core/const/const.dart';
import '../../../../core/utl/request_state.dart';

class RemindersList extends StatelessWidget {
  const RemindersList({
    required this.parentContext,
    Key? key,
  }) : super(key: key);
  final BuildContext parentContext;
  @override
  Widget build(parentContext) {
    return BlocBuilder<ReminderBloc, ReminderState>(
        builder: (parentContext, state) {
      print(state.themedataSwitch);
      switch (state.requestState) {
        case RequestState.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case RequestState.loaded:
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: AppPadding.pa10, right: AppPadding.pa10),
              child: ListView.builder(
                itemCount: state.reminderEntitie.length,
                itemBuilder: (parentContext, index) {
                  return Card(
                    elevation: AppElevation.el4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.ra10)),
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.pa10),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text(
                              '${state.reminderEntitie[index].word} => ',
                              style: themeOfTextTheme(parentContext)
                                  .titleLarge
                                  ?.copyWith(
                                      color: themeOfPrimaryColor(parentContext),
                                      fontWeight: FontWeight.w600),
                            ),
                            Text(
                              state.reminderEntitie[index].translation,
                              style:
                                  themeOfTextTheme(parentContext).titleMedium,
                            ),
                          ],
                        ),
                        subtitle: Text(
                          state.reminderEntitie[index].createdTime.toString(),
                          style: Theme.of(parentContext).textTheme.labelMedium,
                        ),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete_outlined,
                              color: themeOfIconTheme(parentContext).color,
                            )),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        case RequestState.error:
          return Center(
            child: Text(
              'error',
              style: themeOfTextTheme(parentContext).titleLarge,
            ),
          );
      }
    });
  }
}
