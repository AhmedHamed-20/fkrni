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
    required this.context,
    Key? key,
  }) : super(key: key);
  final BuildContext context;
  @override
  Widget build(context) {
    return BlocBuilder<ReminderBloc, ReminderState>(builder: (context, state) {
      switch (state.requestState) {
        case RequestState.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case RequestState.loaded:
          if (state.reminderDeleteInt == 1) {
            context
                .read<ReminderBloc>()
                .add(const GetAllRemindersEvent('reminder'));
          }
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
                              style: themeOfTextTheme(context)
                                  .titleLarge
                                  ?.copyWith(
                                      color: themeOfPrimaryColor(context),
                                      fontWeight: FontWeight.w600),
                            ),
                            Text(
                              state.reminderEntitie[index].translation,
                              style: themeOfTextTheme(context).titleMedium,
                            ),
                          ],
                        ),
                        subtitle: Text(
                          state.reminderEntitie[index].createdTime.toString(),
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              context.read<ReminderBloc>().add(
                                  DeleteReminderByIdEvent(
                                      state.reminderEntitie[index].id,
                                      'reminder'));
                            },
                            icon: Icon(
                              Icons.delete_outlined,
                              color: themeOfIconTheme(context).color,
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
              style: themeOfTextTheme(context).titleLarge,
            ),
          );
        case RequestState.insertedOrDeletedDataSuccess:
          context
              .read<ReminderBloc>()
              .add(const GetAllRemindersEvent('reminder'));
          return const SizedBox.shrink();
      }
    });
  }
}
