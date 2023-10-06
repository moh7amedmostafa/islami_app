import 'package:flutter/material.dart';
import 'package:islami_app/my_theme.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class RadioTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/radio_image.png'),
            SizedBox(height: 18),
            Text(
              'إذاعة القرآن الكريم',
              style:
              TextStyle(fontSize: 25,color: provider.appTheme ==ThemeMode.dark?
              MyTheme.whitecolor
                  : Color(0xffB7935F)),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.skip_previous,color: provider.appTheme ==ThemeMode.dark?
                  MyTheme.yellowcolor
                      : Color(0xffB7935F),size: 40),
                  onPressed: () {

                  },
                ),
                IconButton(
                  icon: Icon(Icons.play_arrow,color:provider.appTheme ==ThemeMode.dark?
                  MyTheme.yellowcolor
                      : Color(0xffB7935F),size: 45),
                  onPressed: () {

                  },
                ),
                IconButton(
                  icon: Icon(Icons.skip_next_rounded,color:provider.appTheme ==ThemeMode.dark?
                  MyTheme.yellowcolor
                      : Color(0xffB7935F),size: 40),
                  onPressed: () {

                  },
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}