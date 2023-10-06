import 'package:flutter/material.dart';
import 'package:islami_app/my_theme.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  SebhaTabState createState() => SebhaTabState();
}

class SebhaTabState extends State<SebhaTab>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _rotationAngle = 0.0;
  int _counter = 0;
  String _displayText = 'سبحان الله';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  void _rotateImage() {
    setState(() {
      _counter++;
      if (_counter >= 99) {
        _counter = 0;
        _displayText = 'سبحان الله';
      } else if (_counter >= 66) {
        _displayText = 'الله أكبر';
      } else if (_counter >= 33) {
        _displayText = 'الحمد لله';
      }
    });
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return GestureDetector(
      onTap: _rotateImage,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 130,
            child: Image.asset('assets/images/head_of_seb7a.png'),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value * 0.05 * 3.141592,
                child: Center(
                  child: Image.asset('assets/images/body_of_seb7a.png'),
                ),
              );
            },
          ),
          Positioned(
            bottom: 40,
            child: Column(
              children: [
                Text(
                  'عدد التسبيحات',
                  style: TextStyle(
                    color: provider.appTheme ==ThemeMode.dark?
                    MyTheme.whitecolor
                        :MyTheme.blackcolor,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xc3b7935f),
                  ),
                  padding: EdgeInsets.all(15),
                  child: Text(
                    '$_counter',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffB7935F),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                  child: Text(
                    _displayText,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
