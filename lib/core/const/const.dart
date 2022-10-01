import 'package:flutter/material.dart';

TextTheme themeOfTextTheme(BuildContext context) => Theme.of(context).textTheme;
Color themeOfPrimaryColor(BuildContext context) =>
    Theme.of(context).primaryColor;

IconThemeData themeOfIconTheme(BuildContext context) =>
    Theme.of(context).iconTheme;

double getScreenHeight(BuildContext context) =>
    MediaQuery.of(context).size.height;

double getScreenWidth(BuildContext context) =>
    MediaQuery.of(context).size.width;
