import 'package:flutter/material.dart';
import 'package:islami_app/hadeth/hadeth_details_screen.dart';
import 'package:islami_app/hadeth/hadeth_tab.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/quran/sura_details_screen.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class ItemHadethName extends StatelessWidget {

  Hadeth hadeth;


  ItemHadethName({required this.hadeth});


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(HadethDetailsScreen.routeName,
        arguments: hadeth
        );
      },
      child: Text(
        hadeth.title,
        style: provider.appTheme == ThemeMode.dark
            ?Theme.of(context).textTheme.titleSmall!.copyWith(
            color: MyTheme.whitecolor
        )
            :
        Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
