import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:uts_azkimaulanaassariy_flutter_sem5/pages/date_picker.dart';
import 'package:uts_azkimaulanaassariy_flutter_sem5/pages/grid_screen.dart';
import 'package:uts_azkimaulanaassariy_flutter_sem5/pages/list_screen.dart';
import 'package:uts_azkimaulanaassariy_flutter_sem5/pages/profile.dart';
import 'package:uts_azkimaulanaassariy_flutter_sem5/pages/time_picker.dart';

enum _SelectedTab { tab1, tab2, tab3, tab4, tab5 }

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final List<Widget> _tabWidgets = [
    const TimePicker(),
    const DatePicker(),
    const GridScreen(),
    const ListScreen(),
    const Profile(),
  ];

  int _selectedIndex = 0;
  String _appBarTitle = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(_appBarTitle)),
      ),
      body: _tabWidgets[_selectedIndex],
      extendBody: true,
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _handleIndexChanged,
        dotIndicatorColor: Colors.black,
        items: [
          DotNavigationBarItem(
            icon: Icon(Icons.alarm_rounded),
            selectedColor: Colors.green,
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.date_range_rounded),
            selectedColor: Colors.red,
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.grid_3x3_rounded),
            selectedColor: Colors.amberAccent,
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.view_list),
            selectedColor: Colors.deepPurple,
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            selectedColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  void _handleIndexChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (_SelectedTab.values[index]) {
      case _SelectedTab.tab1:
        updateAppBarTitle("Time Picker");
        break;
      case _SelectedTab.tab2:
        updateAppBarTitle("Date Picker");
        break;
      case _SelectedTab.tab3:
        updateAppBarTitle("Grid View");
        break;
      case _SelectedTab.tab4:
        updateAppBarTitle("List View");
        break;
      case _SelectedTab.tab5:
        updateAppBarTitle("Profile");
        break;
    }
  }

  void updateAppBarTitle(String title) {
    setState(() {
      _appBarTitle = title;
    });
  }
}
