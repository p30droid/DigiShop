import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {


  String? brandName="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Text('welcome'),
        TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term'),
          onChanged: (value) async {
            //   ip = value;
          },
        ),
        ElevatedButton(
            onPressed: () {

              _saveData();

            },
            child: Text('Save Setting')),

        Text(' value is :  $brandName'),

        TextButton(onPressed: () {


          exitDialog(context, 'exit');


        }, child: Text('Exit Message')),

         createLabel(),


        ],


      ),
    ),);
  }

  void exitDialog(BuildContext context , String title) {

    showDialog(context: context, builder: (BuildContext buildContext) {


      return AlertDialog(

        title: Text('$title'),
        content: Text('Are you sure to exit ?'),
        actions: [

          TextButton(onPressed: (){}, child: Text('Yes'), ),
          TextButton(onPressed: (){}, child: Text('No'), )

        ],

      );


    });

  }


  _saveData() async {

    SharedPreferences pref =  await SharedPreferences.getInstance();

    await  pref.setString('name',"Flutter");


    setState(() {

      brandName = pref.getString("name");


    });


  }


  _getData() async {
    SharedPreferences pref =  await SharedPreferences.getInstance();

   String? name =  pref.getString("name");


    setState(() {


      brandName = name!;

    });
  }


  Widget createLabel() {


    return Container(

      child: Text('Welcome to Flutter'),

    );

  }




}
