import 'package:flutter/material.dart';

import '../../../../core/const/app_height.dart';
import '../../../../core/const/app_padding.dart';
import '../../../../core/const/const.dart';
import '../../../../core/widgets/common_widgets.dart';
import '../../text_field_controllers/text_field_controllers.dart';

class AddReminderBottomSheet extends StatelessWidget {
  const AddReminderBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getScreenHeight(context) * 0.6,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.pa10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Insert new word',
                style: themeOfTextTheme(context)
                    .titleLarge
                    ?.copyWith(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: AppHeight.h10,
            ),
            DefaultTextFiled(
              controller: wordController,
              labelText: 'word',
              prefixIcon: const Icon(Icons.text_fields),
              labelStyle: themeOfTextTheme(context).labelMedium!,
            ),
            Text(
              '⇓',
              style: themeOfTextTheme(context)
                  .titleLarge
                  ?.copyWith(fontSize: 24, color: themeOfPrimaryColor(context)),
            ),
            DefaultTextFiled(
              controller: translationController,
              labelText: 'translation',
              prefixIcon: const Icon(Icons.g_translate),
              labelStyle: themeOfTextTheme(context).labelMedium!,
            ),
            Text(
              'Availble times',
              style: themeOfTextTheme(context).labelMedium,
            ),
            Expanded(
              child: GridView.builder(
                itemBuilder: (context, index) {
                  return TextButton(onPressed: () {}, child: Text('times'));
                },
                itemCount: 3,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
              ),
            )
          ],
        ),
      ),
    );
  }
}
