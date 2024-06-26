// ignore_for_file: non_constant_identifier_names

import 'package:aspinwal/app/IncludeFiles/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/dash_board_module/dash_board_controller.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context)=>GetBuilder<DashBoardController>(builder: (controler)  {
    var SH = MediaQuery.of(context).size.height;
    var SW = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
          height: SH/1.2,
          width: SW/1.2,
          margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            gradient: const LinearGradient(
              colors: [Colors.transparent, Colors.transparent],
              begin: Alignment. topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(Constants.padding),
            // boxShadow: [
            //   BoxShadow(
            //       color: Colors.black45, offset: Offset(0, 5), blurRadius: 5),
            // ]
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FadeAnimation(
                      1,
                      InkWell(
                        onTap: (){
                          controler.getdashboardNavigation(1);
                        },
                        child: Container(
                          width: SW/2.5,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child:  Text("Attendance",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:SH/60,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      1.2,
                      InkWell(
                        onTap: (){
                          controler.getdashboardNavigation(2);
                        },
                        child: Container(
                          width: SW/2.5,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child:  Text("Client visit",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:SH/60,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: SH/50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FadeAnimation(
                      1,
                      InkWell(
                        onTap: (){
                          controler.getdashboardNavigation(3);
                        },
                        child: Container(
                          width: SW/2.5,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child:  Text("Lead Creation",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:SH/60,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      1.2,
                      InkWell(
                        onTap: (){
                          controler.getdashboardNavigation(4);
                        },
                        child: Container(
                          width: SW/2.5,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child:  Text("Production Entry",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:SH/60,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: SH/50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FadeAnimation(
                      1,
                      InkWell(
                        onTap: (){
                          controler.getdashboardNavigation(7);
                        },
                        child: Container(
                          width: SW/2.5,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child:  Text("Leave Master",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:SH/60,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      1.2,
                      InkWell(
                        onTap: (){
                          controler.getdashboardNavigation(8);
                        },
                        child: Container(
                          width: SW/2.5,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child:  Text("Permision Master",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:SH/60,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: SH/50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FadeAnimation(
                      1,
                      InkWell(
                        onTap: (){
                          controler.getdashboardNavigation(9);
                        },
                        child: Container(
                          width: SW/2.5,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child:  Text("On Duty Master",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:SH/60,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      1.2,
                      InkWell(
                        onTap: (){
                          controler.getdashboardNavigation(10);
                        },
                        child: Container(
                          width: SW/2.5,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child:  Text("Reimbursement",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:SH/60,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: SH/50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FadeAnimation(
                      1,
                      InkWell(
                        onTap: (){
                          controler.getdashboardNavigation(4);
                        },
                        child: Container(
                          width: SW/2.5,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child:  Text("Production Entery",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:SH/60,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      1.2,
                      InkWell(
                        onTap: (){
                          //controler.getdashboardNavigation(3);
                        },
                        child: Container(
                          width: SW/2.5,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child:  Text("Invoices",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:SH/60,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: SH/50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FadeAnimation(
                      1,
                      InkWell(
                        onTap: (){
                          //controler.getdashboardNavigation(3);
                        },
                        child: Container(
                          width: SW/2.5,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child:  Text("Returned Goods",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:SH/60,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      1.2,
                      InkWell(
                        onTap: (){
                          //controler.getdashboardNavigation(3);
                        },
                        child: Container(
                          width: SW/2.5,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child:  Text("Complaints",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:SH/60,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: SH/50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FadeAnimation(
                      1,
                      InkWell(
                        onTap: (){
                          //controler.getdashboardNavigation(3);
                        },
                        child: Container(
                          width: SW/2.5,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child:  Text("Lost Customers",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:SH/60,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      1.2,
                      InkWell(
                        onTap: (){
                          //controler.getdashboardNavigation(3);
                        },
                        child: Container(
                          width: SW/2.5,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child:  Text("Non Leitz Sales / Service Customer",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:SH/60,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: SH/50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FadeAnimation(
                      1,
                      InkWell(
                        onTap: (){
                          //controler.getdashboardNavigation(3);
                        },
                        child: Container(
                          width: SW/2.5,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child:  Text("Expense Update",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:SH/60,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      1.2,
                      InkWell(
                        onTap: (){
                          controler.getdashboardNavigation(6);
                        },
                        child: Container(
                          width: SW/2.5,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child:  Text("Reports",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:SH/60,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: SH/50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FadeAnimation(
                      1,
                      InkWell(
                        onTap: (){
                          //controler.getdashboardNavigation(3);
                        },
                        child: Container(
                          width: SW/2.5,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child:  Text("Present Offers",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:SH/60,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      1.2,
                      InkWell(
                        onTap: (){
                          //controler.getdashboardNavigation(3);
                        },
                        child: Container(
                          width: SW/2.5,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(20),


                        ),
                      ),
                    ),

                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  });
}

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}
