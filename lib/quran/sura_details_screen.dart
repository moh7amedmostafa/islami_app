import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/quran/item_sura_details.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura-details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty){
      loadfile(args.index);
    }

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
            title: Text('${args.name}',
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
            child: ListView.separated(
              separatorBuilder: (context, index) {

              return Divider(
                color: provider.appTheme == ThemeMode.dark?
                    MyTheme.whitecolor
                    :
                Theme.of(context).primaryColor,
                thickness: 3,
              );
            },
              itemBuilder: (context, index) {
              return ItemSuraDetails(content: verses[index],index: index,);
            },
              itemCount: verses.length ,
            ),
          ),

        )
      ],
    );
  }

  void loadfile(int index) async {
    String content = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {

    });
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
