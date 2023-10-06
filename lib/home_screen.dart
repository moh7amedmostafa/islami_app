import 'package:flutter/material.dart';
import 'package:islami_app/hadeth/hadeth_tab.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/quran/quran_tab.dart';
import 'package:islami_app/radio/radio_tab.dart';
import 'package:islami_app/sebha/sebha_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/settings/setting_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home-screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.appTheme == ThemeMode.dark
            ? Image(
                image: AssetImage("assets/images/darkback.png"),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              )
            : Image(
                image: AssetImage("assets/images/background.png"),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title,
                style: Theme.of(context).textTheme.titleLarge),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedindex,
              onTap: (index) {
                selectedindex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/quran.png")),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(
                        "assets/images/quran-quran-svgrepo-com.png")),
                    label: AppLocalizations.of(context)!.hadeth),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                    label: AppLocalizations.of(context)!.sebha),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/radio.png")),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings),
              ],
            ),
          ),
          body: tabs[selectedindex],
        )
      ],
    );
  }
}

List<Widget> tabs = [
  QuranTab(),
  HadethTab(),
  SebhaTab(),
  RadioTab(),
  SettingsTab()
];
