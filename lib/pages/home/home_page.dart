import 'package:app_nubank/pages/home/widgets/my_app_bar.dart';
import 'package:app_nubank/pages/home/widgets/my_dots_app.dart';
import 'package:app_nubank/pages/home/widgets/page_view_app.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _showMenu;
  int _currentIndex;

  @override
  void initState(){
    super.initState();
    _showMenu = false;
  }
  
  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          MyAppBar(
            showMenu: _showMenu,
            onTap: (){
              setState(() {
                _showMenu = !_showMenu;
              });
            }
          ),
          PageViewApp(
            top: _screenHeight * .24,
            onChanged: (index){
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          Positioned(
            top: _screenHeight * .70,
            child: MyDotsApp(currentIndex: _currentIndex,),
          )
      ],
      ),
    );
  }
}