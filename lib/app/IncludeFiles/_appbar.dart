
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAppBar extends StatefulWidget {
   MyAppBar( {Key? key,required this.screenName}) : super(key: key);
   var screenName='';

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(2),
        child: Container(
          height: height/15,
          width: width,
          margin: EdgeInsets.only(top: height/50),
          decoration: BoxDecoration(
            color: Colors.blue.shade700,
              borderRadius: BorderRadius.all(Radius.circular(height/45)),
          ),

          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: height/35),
                width: width/10,
                child: Image.asset(
                    //'assets/icon.png'
                    'assets/icon.png'
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: height/35),
                child: Text(widget.screenName,style: TextStyle(color: Colors.white,fontSize: height/40,fontWeight: FontWeight.w700),),
              ),
              SizedBox(width: width/4,),
              // IconButton(
              //   onPressed: () async {
              //     //Navigator.pop(context);
              //     SharedPreferences prefs = await SharedPreferences.getInstance();
              //     prefs.setString('UserID', "");
              //     prefs.setString('FirstName', "");
              //     prefs.setString('DeptCode', "");
              //     prefs.setString('DeptName', "");
              //     prefs.setString("Status", "LoginOut");
              //     //RouteManageMent.goToLogin();
              //   },
              //   icon:  Icon(Icons.exit_to_app,color: Colors.white,size: height/30,),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

