
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class ItemSuraDetails extends StatelessWidget {
  String content;
  int index;

  ItemSuraDetails({required this.content,required this.index});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Text(
      '$content{${index+1}}',
      style:
      Theme.of(context).textTheme.titleSmall,
      textAlign: TextAlign.center,
      textDirection:TextDirection.rtl,
    );
  }
}
