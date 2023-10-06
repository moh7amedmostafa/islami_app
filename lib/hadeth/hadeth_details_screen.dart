import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/hadeth/hadeth_tab.dart';
import 'package:islami_app/hadeth/item_hadeth_details.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/quran/item_sura_details.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth-details';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
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
            title: Text('${args.title}',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          body:Container(
            margin: EdgeInsets.symmetric(
              horizontal:MediaQuery.of(context).size.height *0.06,
              vertical: MediaQuery.of(context).size.width* 0.05,
            ),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: provider.appTheme == ThemeMode.dark?
                  Theme.of(context).primaryColor
                  :
              MyTheme.whitecolor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
              return ItemHadethDetails(content: args.content[index]);
            },
              itemCount:args.content.length,
            ),
          ),

        )
      ],
    );
  }


}

