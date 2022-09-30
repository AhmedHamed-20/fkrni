import 'package:flutter/material.dart';

import '../../../../core/const/app_elevation.dart';
import '../../../../core/const/app_padding.dart';
import '../../../../core/const/app_radius.dart';
import '../../../../core/const/const.dart';

class RemindersList extends StatelessWidget {
  const RemindersList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
            left: AppPadding.pa10, right: AppPadding.pa10),
        child: ListView.builder(
          itemBuilder: (context, index) {
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
                        'Word=> ',
                        style: themeOfTextTheme(context).titleLarge?.copyWith(
                            color: themeOfPrimaryColor(context),
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'translation',
                        style: themeOfTextTheme(context).titleLarge,
                      ),
                    ],
                  ),
                  subtitle: Text(
                    DateTime.now().toString(),
                    style: themeOfTextTheme(context).labelMedium,
                  ),
                  trailing: IconButton(
                      onPressed: () {},
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
  }
}
