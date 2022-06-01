

import 'package:flutter/material.dart';

import '../Sekmeler/homepage.dart';
Widget navigators  () {
  int _currentindex = 0 ;

return
  Align(

    alignment: Alignment.bottomCenter,
          child:
          BottomNavigationBar(
            currentIndex: _currentindex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white70,
            items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home ),
              label: 'home',
              // backgroundColor: Colors.blue,

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search ),
              label: 'search',
              // backgroundColor: Colors.blue,

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop ),
              label: 'shop',
              // backgroundColor: Colors.blue,

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people ),
              label: 'login',
              // backgroundColor: Colors.blue,

            ),
          ],
            onTap: (index){
              _currentindex = index ;
              if (index == 1 ) {

              };

            },
          ),

  );
}
