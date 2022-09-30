import 'package:flutter/material.dart';

TextTheme themeOfTextTheme(BuildContext context) => Theme.of(context).textTheme;
Color themeOfPrimaryColor(BuildContext context) =>
    Theme.of(context).primaryColor;

IconThemeData themeOfIconTheme(BuildContext context) =>
    Theme.of(context).iconTheme;
