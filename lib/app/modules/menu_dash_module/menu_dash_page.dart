import 'package:aspinwal/app/modules/menu_dash_module/menu_dash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MenuDashPage extends GetView<MenuDashController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<MenuDashController>(builder: (controler) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title:  Column(
                  children: [

                    SizedBox(width: width,child: Text(controler.sessionName,style: TextStyle(fontSize: height/50),)),
                    SizedBox(width: width,child: Text(controler.sessionDeptName,style: TextStyle(fontSize: height/90),)),
                  ],
                ),
                elevation: 0,
                backgroundColor: Colors.blue.shade900,

                // bottom: TabBar(
                //   controller: controler.tabController,
                //   onTap: (var index) {
                //     if (index == 0) {
                //       controler.currentindex = index;
                //     } else if (index == 1) {
                //       controler.currentindex = index;
                //     }
                //   },
                //   indicator: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.black12),
                //   tabs: const [
                //     Tab(
                //       text: 'HRMS',
                //     ),
                //     Tab(
                //       text: 'Logistics',
                //     ),
                //   ],
                // ),
              ),
              body:  Scaffold(
                backgroundColor: Colors.white,
                body: Stack(
                  children: [
                    Container(
                      height: height,
                      width: width,
                      alignment: Alignment.center,
                      child: Card(
                        elevation: 10,
                        child: Container(
                          height: height/1.5,
                          width: width/1.1,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                SizedBox(height: height/25,),
                                Card(
                                  elevation: 5,
                                  child: Container(
                                    height: height/17.5,
                                    width: width/1.2,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: height/16.6,
                                          width: width/8,
                                          color: Colors.black12,
                                          child: Icon(Icons.location_on_rounded,size: height/35,color: Colors.pinkAccent,),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            controler.getdashboardNavigation(1);
                                          },
                                          child: Container(
                                            height: height/16.9,
                                            width: width/1.8,
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(left: width/50),
                                            child: Text("Attendance",style: TextStyle(fontSize: height/50),),
                                            //color: Colors.red,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            controler.getdashboardNavigation(15);
                                          },
                                          child: Container(
                                            height: height/16.6,
                                            width: width/7.7,
                                            color: Colors.black26,
                                            child: Icon(Icons.folder,size: height/35,),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // SizedBox(height: height/90,),
                                // Card(
                                //   elevation: 5,
                                //   child: Container(
                                //     height: height/17.5,
                                //     width: width/1.2,
                                //     child: Row(
                                //       children: [
                                //         Container(
                                //           height: height/16.6,
                                //           width: width/8,
                                //           color: Colors.black12,
                                //           child: Icon(Icons.call,size: height/35,color: Colors.pinkAccent,),
                                //         ),
                                //         InkWell(
                                //           onTap: (){
                                //             controler.getdashboardNavigation(23);
                                //           },
                                //           child: Container(
                                //             height: height/16.9,
                                //             width: width/1.8,
                                //             alignment: Alignment.centerLeft,
                                //             margin: EdgeInsets.only(left: width/50),
                                //             child: Text("Telecalling Enquery",style: TextStyle(fontSize: height/50),),
                                //             //color: Colors.red,
                                //           ),
                                //         ),
                                //         InkWell(
                                //           onTap: (){
                                //             controler.getdashboardNavigation(24);
                                //           },
                                //           child: Container(
                                //             height: height/16.6,
                                //             width: width/7.7,
                                //             color: Colors.black26,
                                //             child: Icon(Icons.folder,size: height/35,),
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),

                                SizedBox(height: height/90,),
                                Card(
                                  elevation: 5,
                                  child: Container(
                                    height: height/17.5,
                                    width: width/1.2,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: height/16.6,
                                          width: width/8,
                                          color: Colors.black12,
                                          child: Icon(Icons.location_on_rounded,size: height/35,color: Colors.pinkAccent,),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            controler.getdashboardNavigation(2);
                                          },
                                          child: Container(
                                            height: height/16.9,
                                            width: width/1.8,
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(left: width/50),
                                            child: Text("Client visit",style: TextStyle(fontSize: height/50,),),
                                            //color: Colors.red,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            controler.getdashboardNavigation(16);
                                          },
                                          child: Container(
                                            height: height/16.6,
                                            width: width/7.7,
                                            color: Colors.black26,
                                            child: Icon(Icons.folder,size: height/35,),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: height/90,),
                                Card(
                                  elevation: 5,
                                  child: Container(
                                    height: height/17.5,
                                    width: width/1.2,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: height/16.6,
                                          width: width/8,
                                          color: Colors.black12,
                                          child: Icon(Icons.leave_bags_at_home,size: height/35,color: Colors.pinkAccent,),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            controler.getdashboardNavigation(7);
                                          },
                                          child: Container(
                                            height: height/16.9,
                                            width: controler.sessionType=="Y"?width/2.8:width/1.8,
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(left: width/50),
                                            child: Text("Leave Master",style: TextStyle(fontSize: height/50),),
                                            //color: Colors.red,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            controler.getdashboardNavigation(17);
                                          },
                                          child: Container(
                                            height: height/16.6,
                                            width: width/7.7,
                                            color: Colors.black26,
                                            child: Icon(Icons.folder,size: height/35,),
                                          ),
                                        ),
                                        //SizedBox(width: width/15,),
                                        Visibility(
                                          visible: controler.sessionType=="Y"?true:false,
                                          child: InkWell(
                                            onTap: (){
                                              controler.getdashboardNavigation(20);
                                            },
                                            child: Container(
                                              height: height/16.6,
                                              width: width/7.7,
                                              color: Colors.redAccent,
                                              child: Icon(Icons.approval,size: height/35,color: Colors.white,),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: height/90,),
                                Card(
                                  elevation: 5,
                                  child: Container(
                                    height: height/17.5,
                                    width: width/1.2,
                                    child: Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: height/16.6,
                                          width: width/8,
                                          color: Colors.black12,
                                          child: Icon(Icons.leave_bags_at_home,size: height/35,color: Colors.pinkAccent,),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            controler.getdashboardNavigation(8);
                                          },
                                          child: Container(
                                            height: height/16.9,
                                            width: controler.sessionType=="Y"?width/2.8:width/1.8,
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(left: width/50),
                                            child: Text("Permision Master",style: TextStyle(fontSize: height/50),),
                                            //color: Colors.red,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            controler.getdashboardNavigation(18);
                                          },
                                          child: Container(
                                            height: height/16.6,
                                            width: width/7.7,
                                            color: Colors.black26,
                                            child: Icon(Icons.folder,size: height/35,),
                                          ),
                                        ),
                                        //SizedBox(width: width/100,),
                                        Visibility(
                                          visible: controler.sessionType=="Y"?true:false,
                                          child: InkWell(
                                            onTap: (){
                                              controler.getdashboardNavigation(21);
                                            },
                                            child: Container(
                                              height: height/16.6,
                                              width: width/7.7,
                                              color: Colors.redAccent,
                                              child: Icon(Icons.approval,size: height/35,color: Colors.white,),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: height/90,),
                                Card(
                                  elevation: 5,
                                  child: InkWell(
                                    onTap: (){
                                      controler.getdashboardNavigation(9);
                                    },
                                    child: Container(
                                      height: height/17.5,
                                      width: width/1.2,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/16.6,
                                            width: width/8,
                                            color: Colors.black12,
                                            child: Icon(Icons.leave_bags_at_home,size: height/35,color: Colors.pinkAccent,),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              controler.getdashboardNavigation(9);
                                            },
                                            child: Container(
                                              height: height/16.9,
                                              width: controler.sessionType=="Y"?width/2.8:width/1.8,
                                              alignment: Alignment.centerLeft,
                                              margin: EdgeInsets.only(left: width/50),
                                              child: Text("On Duty Master",style: TextStyle(fontSize: height/50),),
                                              //color: Colors.red,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              controler.getdashboardNavigation(19);
                                            },
                                            child: Container(
                                              height: height/16.6,
                                              width: width/7.7,
                                              color: Colors.black26,
                                              child: Icon(Icons.folder,size: height/35,),
                                            ),
                                          ),
                                          //SizedBox(width: width/15,),
                                          Visibility(
                                            visible: controler.sessionType=="Y"?true:false,
                                            child: InkWell(
                                              onTap: (){
                                                controler.getdashboardNavigation(22);
                                              },
                                              child: Container(
                                                height: height/16.6,
                                                width: width/7.7,
                                                color: Colors.redAccent,
                                                child: Icon(Icons.approval,size: height/35,color: Colors.white,),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // SizedBox(height: height/90,),
                                // Card(
                                //   elevation: 5,
                                //   child: InkWell(
                                //     onTap: (){
                                //       controler.getdashboardNavigation(10);
                                //     },
                                //     child: Container(
                                //       height: height/17.5,
                                //       width: width/1.2,
                                //       child: Row(
                                //         children: [
                                //           Container(
                                //             height: height/16.6,
                                //             width: width/8,
                                //             color: Colors.black12,
                                //             child: Icon(Icons.currency_rupee_rounded,size: height/35,color: Colors.pinkAccent,),
                                //           ),
                                //           Container(
                                //             height: height/16.9,
                                //             width: width/1.8,
                                //             alignment: Alignment.centerLeft,
                                //             margin: EdgeInsets.only(left: width/50),
                                //             child: Text("Reimbursement",style: TextStyle(fontSize: height/50),),
                                //             //color: Colors.red,
                                //           ),
                                //           Container(
                                //             height: height/16.6,
                                //             width: width/7.7,
                                //             color: Colors.black26,
                                //             child: Icon(Icons.folder,size: height/35,),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                SizedBox(height: height/90,),
                                Card(
                                  elevation: 5,
                                  child: InkWell(
                                    onTap: (){
                                      controler.getdashboardNavigation(12);
                                    },
                                    child: Container(
                                      height: height/17.5,
                                      width: width/1.2,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/16.6,
                                            width: width/8,
                                            color: Colors.black12,
                                            child: Icon(Icons.holiday_village_rounded,size: height/35,color: Colors.pinkAccent,),
                                          ),
                                          Container(
                                            height: height/16.9,
                                            width: width/1.8,
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(left: width/50),
                                            child: Text("Holiday",style: TextStyle(fontSize: height/50),),
                                            //color: Colors.red,
                                          ),
                                          Container(
                                            height: height/16.6,
                                            width: width/7.7,
                                            color: Colors.black26,
                                            child: Icon(Icons.folder,size: height/35,),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: height/90,),
                                Card(
                                  elevation: 5,
                                  child: InkWell(
                                    onTap: (){
                                      controler.getdashboardNavigation(14);
                                    },
                                    child: Container(
                                      height: height/17.5,
                                      width: width/1.2,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/16.6,
                                            width: width/8,
                                            color: Colors.black12,
                                            child: Icon(Icons.holiday_village_rounded,size: height/35,color: Colors.pinkAccent,),
                                          ),
                                          Container(
                                            height: height/16.9,
                                            width: width/1.8,
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(left: width/50),
                                            child: Text("Client Reports",style: TextStyle(fontSize: height/50),),
                                            //color: Colors.red,
                                          ),
                                          Container(
                                            height: height/16.6,
                                            width: width/7.7,
                                            color: Colors.black26,
                                            child: Icon(Icons.folder,size: height/35,),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // SizedBox(height: height/90,),
                                // Card(
                                //   elevation: 5,
                                //   child: InkWell(
                                //     onTap: (){
                                //       controler.getdashboardNavigation(26);
                                //     },
                                //     child: Container(
                                //       height: height/17.5,
                                //       width: width/1.2,
                                //       child: Row(
                                //         children: [
                                //           Container(
                                //             height: height/16.6,
                                //             width: width/8,
                                //             color: Colors.black12,
                                //             child: Icon(Icons.account_circle,size: height/35,color: Colors.pinkAccent,),
                                //           ),
                                //           Container(
                                //             height: height/16.9,
                                //             width: width/1.8,
                                //             alignment: Alignment.centerLeft,
                                //             margin: EdgeInsets.only(left: width/50),
                                //             child: Text("To Activity",style: TextStyle(fontSize: height/50),),
                                //             //color: Colors.red,
                                //           ),
                                //           Container(
                                //             height: height/16.6,
                                //             width: width/7.7,
                                //             color: Colors.black26,
                                //             child: Icon(Icons.folder,size: height/35,),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],

                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: height/9,
                          width: width/4.5,
                         margin: EdgeInsets.only(top: height/50),
                          child: Image.asset('assets/hrms.gif'),
                          decoration: BoxDecoration(
                              //color: Colors.indigo,
                              borderRadius:  BorderRadius.all(Radius.circular(height/5))
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          ),
        ),
      ),
    );
  });
}
