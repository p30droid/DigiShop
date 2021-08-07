
import 'package:digishop/ui/pages/category/category_page.dart';
import 'package:digishop/ui/pages/home/home_page.dart';
import 'package:digishop/ui/pages/setting/setting_page.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CategoryPage(),
    SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('دیجی شاپ'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black.withOpacity(0.60),
        currentIndex: _currentIndex,
        onTap: onTapMenu,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_to_home_screen), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
      ),

      drawer: Drawer(

        child: ListView(

          children: [

            ListTile(
              title: Text('Login'),
              leading: Icon(Icons.login),
              onTap: () {

               // Navigator.push(context , MaterialPageRoute(builder: (context)=> LoginPage() ) );
              },
            )


          ],


        ),


      ),


    );
  }

  void onTapMenu(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
