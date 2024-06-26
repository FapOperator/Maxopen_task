import 'package:flutter/material.dart';

String convertLocaleString(BuildContext context) {
  String locale = Localizations.localeOf(context).toString();
  String newlocale = locale.split("_").join('-');
  return newlocale;
}
