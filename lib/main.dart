

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:islami_app/hadeth/hadeth_details_screen.dart';
import 'package:islami_app/home_screen.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/quran/sura_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
void main(){
runApp(ChangeNotifierProvider(
  create: (context)=> AppConfigProvider(),
    child: MyApp()));

}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: HomeScreen.routeName,

      routes:{
        HomeScreen.routeName : (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      theme: MyTheme.lightMode,
      darkTheme: MyTheme.darkMode,
      themeMode: provider.appTheme,
    );
  }



}