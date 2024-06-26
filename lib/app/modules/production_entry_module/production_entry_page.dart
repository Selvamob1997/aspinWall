import 'package:aspinwal/app/modules/production_entry_module/production_entry_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductionEntryPage extends GetView<ProductionEntryController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<ProductionEntryController>(builder: (myController) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          //initialIndex:2,
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: const Text('Production Enquiry'),
                elevation: 0,
                bottom: TabBar(
                  controller: myController.tabController,
                  onTap: (var index) {
                    if (index == 0) {
                      myController.currentindex = index;
                    } else if (index == 1) {
                      myController.currentindex = index;
                    } else if (index == 2) {
                      myController.currentindex = index;
                    }else if (index == 3) {
                      myController.currentindex = index;
                    }
                  },
                  indicator: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.black12),
                  tabs: const [
                    Tab(
                      text: 'Machine Detalies',
                    ),
                    Tab(
                      text: 'Add Info',
                    ),
                    Tab(
                      text: 'Attachment',
                    ),

                  ],
                ),
              ),
              body:  TabBarView(
                controller: myController.tabController,
                children: [
                  Scaffold(
                    backgroundColor: Colors.white,
                    body: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(height: height/60,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Material(
                                elevation: 2.0,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child: SizedBox(
                                  width: width/2.1,
                                  child: TextField(
                                    controller: myController.EnqNo,
                                    onTap: () {
                                      myController.showEnqNo();

                                    },
                                    cursorColor: Colors.blue,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        hintText: "Enq No",
                                        prefixIcon: Material(
                                          elevation: 0,
                                          borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                          child: const Icon(
                                            Icons.edit,
                                            color: Colors.red,
                                          ),
                                        ),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                                  ),
                                ),
                              ),
                              Material(
                                elevation: 2.0,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child: SizedBox(
                                  width: width/2.1,
                                  child: TextField(
                                    controller: myController.cardCode,
                                    cursorColor: Colors.blue,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        hintText: "Cus Code",
                                        prefixIcon: Material(
                                          elevation: 0,
                                          borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                          child: const Icon(
                                            Icons.edit,
                                            color: Colors.red,
                                          ),
                                        ),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height/60,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Material(
                                elevation: 2.0,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child: SizedBox(
                                  width: width/2.1,
                                  child: TextField(
                                    controller: myController.EnqDate,
                                    cursorColor: Colors.blue,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        hintText: "Enq Date",
                                        prefixIcon: Material(
                                          elevation: 0,
                                          borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                          child: const Icon(
                                            Icons.edit,
                                            color: Colors.red,
                                          ),
                                        ),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                                  ),
                                ),
                              ),
                              Material(
                                elevation: 2.0,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child: SizedBox(
                                  width: width/2.1,
                                  child: TextField(
                                    controller: myController.CardName,
                                    cursorColor: Colors.blue,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        hintText: "Cus Name",
                                        prefixIcon: Material(
                                          elevation: 0,
                                          borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                          child: const Icon(
                                            Icons.edit,
                                            color: Colors.red,
                                          ),

                                        ),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height/60,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Material(
                                elevation: 2.0,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child: SizedBox(
                                  width: width/2.1,
                                  child: TextField(
                                    controller: myController.ContactPerson,
                                    cursorColor: Colors.blue,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        hintText: "Condact Person",
                                        prefixIcon: Material(
                                          elevation: 0,
                                          borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                          child: const Icon(
                                            Icons.edit,
                                            color: Colors.red,
                                          ),
                                        ),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                                  ),
                                ),
                              ),
                              Material(
                                elevation: 2.0,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child: SizedBox(
                                  width: width/2.1,
                                  child: TextField(
                                    controller: myController.MobileNo,
                                    cursorColor: Colors.blue,
                                    keyboardType: TextInputType.number,
                                    maxLength: 10,
                                    decoration: InputDecoration(
                                        hintText: "Mob Number",
                                        prefixIcon: Material(
                                          elevation: 0,
                                          borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                          child: const Icon(
                                            Icons.edit,
                                            color: Colors.red,
                                          ),
                                        ),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height/60,),
                          Row(
                            children: [
                              Container(
                                height: height/1.4,
                                width: width/2,
                                child: Column(
                                  children: [
                                    Container(
                                      height: height/50,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Text("Spindle Molder M/C",style: TextStyle(fontSize: height/65,fontWeight: FontWeight.bold,color: Colors.pink),),
                                    ),
                                    SizedBox(height: 5  ,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                              child: Text("Single Spindle",style: TextStyle(fontSize: height/65),
                                              ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                              alignment: Alignment.center,
                                              child: Checkbox(
                                                value: myController.singlespindle,
                                                onChanged: (bool? value) {
                                                  myController.statusChage(value,1);


                                                },
                                              ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1  ,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("Multi Spindle",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.multiSingle,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,2);


                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1  ,),
                                    Container(
                                      height: height/50,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Text("Router",style: TextStyle(fontSize: height/65,fontWeight: FontWeight.bold,color: Colors.pink),),
                                    ),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("Protable",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.portable,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,3);


                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1  ,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("Pin Type",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.pinType,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,4);


                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1  ,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("CNC",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.cnc,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,5);


                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1  ,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("Win Bore",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.withBore,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,6);


                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height/50,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Text("Material",style: TextStyle(fontSize: height/65,fontWeight: FontWeight.bold,color: Colors.pink),),
                                    ),
                                    SizedBox(height: height/80,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: TextField(
                                        keyboardType: TextInputType.visiblePassword,
                                        //controller: companycontroller,
                                        showCursor: true,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.cyan)),
                                          labelText: 'Max Dia(Cutter)',
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                              fontSize: height/80
                                          ),
                                        ),
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                    SizedBox(height: height/80,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: TextField(
                                        keyboardType: TextInputType.visiblePassword,
                                        //controller: companycontroller,
                                        showCursor: true,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.cyan)),
                                          labelText: 'Min Dia(Cutter)',
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: height/80
                                          ),
                                        ),
                                        style: TextStyle(fontSize: 13),


                                      ),
                                    ),
                                    SizedBox(height: height/80,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: TextField(
                                        keyboardType: TextInputType.visiblePassword,
                                        //controller: companycontroller,
                                        showCursor: true,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.cyan)),
                                          labelText: 'HP (Horse Power)',
                                          labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: height/80
                                          ),
                                        ),
                                        style: TextStyle(fontSize: 13),


                                      ),
                                    ),
                                    SizedBox(height: 1  ,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("Solid Wood",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.solidWood,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,7);


                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1  ,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("Plain Wood",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.plainWood,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,8);
                                                },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1  ,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("uPvc",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.uPvc,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,9);


                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1  ,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("Aluminium",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.aluminium,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,10);

                                                },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1  ,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("ACP",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.acp,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,11);


                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height/50,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Text("Type Of Feed",style: TextStyle(fontSize: height/65,fontWeight: FontWeight.bold,color: Colors.pink),),
                                    ),
                                    SizedBox(height: 1  ,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("Manual",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.manual,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,12);


                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1  ,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("TCP",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.tCP,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,13);


                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              Container(
                                height: height/1.4,
                                width: width/2,
                                child: Column(
                                  children: [
                                    Container(
                                      height: height/50,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Text("Drilling",style: TextStyle(fontSize: height/65,fontWeight: FontWeight.bold,color: Colors.pink),),
                                    ),
                                    SizedBox(height: 5  ,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("Single Boring M/C",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.singleBoringMC,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,14);


                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1  ,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("Multi Boring M/C",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.multiBoringMC,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,15);


                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1  ,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("Multi Drilling M/C",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.multiDrillingMC,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,16);


                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1  ,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("Mortizing M/C",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.mortizingMC,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,17);


                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1  ,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("Copy Shaper",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.copyshaper,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,18);


                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1  ,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("Corner Cleaning M/C",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.cornercleaningMC,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,19);


                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: height/80,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: TextField(
                                        keyboardType: TextInputType.visiblePassword,
                                        controller: myController.BoreDia,
                                        showCursor: true,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.cyan)),
                                          labelText: 'Bore Dia',
                                          labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: height/80
                                          ),
                                        ),
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                    SizedBox(height: height/80,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: TextField(
                                        keyboardType: TextInputType.visiblePassword,
                                        controller: myController.RPMSpeed,
                                        showCursor: true,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.cyan)),
                                          labelText: 'RPM (Speed)',
                                          labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: height/80
                                          ),
                                        ),
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                    SizedBox(height: height/80,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("Prelam Board",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.prelamBoard,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,20);
                                                },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: height/100,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("Post Lam Plywood",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.postLamPlywood,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,21);
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: height/100,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("MDF",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.mdf,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,22);
                                                },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: height/100,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("Partical Board",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.particalBoard,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,23);
                                                },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: height/100,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("Compact Laminate",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.compactLaminate,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,24);
                                                },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1  ,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("Mechanical",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.mechanical,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,25);


                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1  ,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("Both",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.both,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,26);


                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1  ,),
                                    Container(
                                      height: height/30,
                                      width: width/2.1,
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height/35,
                                            width: width/2.9,
                                            alignment: Alignment.centerLeft,
                                            child: Text("PCD",style: TextStyle(fontSize: height/65),
                                            ),
                                          ),
                                          Container(
                                            height: height/35,
                                            width: width/10,
                                            alignment: Alignment.center,
                                            child: Checkbox(
                                              value: myController.pcd,
                                              onChanged: (bool? value) {
                                                myController.statusChage(value,27);


                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Material(
                                elevation: 2.0,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child: SizedBox(
                                  width: width/2.1,
                                  child: TextField(
                                    controller: myController.CreateBy,
                                    onTap: () {
                                      myController.showEmpData();
                                      },
                                    cursorColor: Colors.blue,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        hintText: "Prepared By",
                                        prefixIcon: Material(
                                          elevation: 0,
                                          borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                          child: const Icon(
                                            Icons.edit,
                                            color: Colors.red,
                                          ),
                                        ),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                                  ),
                                ),
                              ),
                              Material(
                                elevation: 2.0,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child: SizedBox(
                                  width: width/2.1,
                                  child: TextField(
                                    controller: myController.Email,
                                    cursorColor: Colors.blue,
                                    //readOnly: true,
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        prefixIcon: Material(
                                          elevation: 0,
                                          borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                          child: const Icon(
                                            Icons.edit,
                                            color: Colors.red,
                                          ),
                                        ),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    persistentFooterButtons: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: height/18,
                            child: FloatingActionButton.extended(
                              backgroundColor: Colors.red,
                              icon: Icon(Icons.clear,size: height/35,),
                              label: const Text('Cancel'),
                              heroTag: 'Cancel',
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          SizedBox(
                            width: width/ 20,
                          ),
                          SizedBox(
                            height: height/18,
                            child: FloatingActionButton.extended(
                              backgroundColor: Colors.blue.shade700,
                              icon: Icon(Icons.check,size: height/35,),
                              label: const Text('Save'),
                              heroTag: 'Save',
                              onPressed: () {
                                myController.postSave();

                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Scaffold(
                    backgroundColor: Colors.white,
                    body: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(height: height/60,),
                          Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(height/10)),
                            child: SizedBox(
                              width: width/1.1,
                              child: TextField(
                                controller: myController.Tool1,
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                    hintText: "Tool 1",
                                    label: Text("Tool 1"),
                                    prefixIcon: Material(
                                      elevation: 0,
                                      borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.red,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                              ),
                            ),
                          ),
                          SizedBox(height: height/60,),
                          Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(height/10)),
                            child: SizedBox(
                              width: width/1.1,
                              child: TextField(
                                controller: myController.Machine,
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                    hintText: "Machine",
                                    label: Text("Machine"),
                                    prefixIcon: Material(
                                      elevation: 0,
                                      borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.red,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                              ),
                            ),
                          ),
                          SizedBox(height: height/60,),
                          Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(height/10)),
                            child: SizedBox(
                              width: width/1.1,
                              child: TextField(
                                controller: myController.DirRotation,
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                    hintText: "Dir Rotation Spindle",
                                    label: Text("Dir Rotation Spindle"),
                                    prefixIcon: Material(
                                      elevation: 0,
                                      borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.red,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                              ),
                            ),
                          ),
                          SizedBox(height: height/60,),
                          Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(height/10)),
                            child: SizedBox(
                              width: width/1.1,
                              child: TextField(
                                controller: myController.MaxDiaCutter,
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                    hintText: "Max Dia Of Cutter",
                                    label: Text("Max Dia Of Cutter"),
                                    prefixIcon: Material(
                                      elevation: 0,
                                      borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.red,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                              ),
                            ),
                          ),
                          SizedBox(height: height/60,),
                          Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(height/10)),
                            child: SizedBox(
                              width: width/1.1,
                              child: TextField(
                               controller: myController.Material,
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                    hintText: "Material",
                                    label: Text("Material"),
                                    prefixIcon: Material(
                                      elevation: 0,
                                      borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.red,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                              ),
                            ),
                          ),
                          SizedBox(height: height/60,),
                          Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(height/10)),
                            child: SizedBox(
                              width: width/1.1,
                              child: TextField(
                                controller: myController.PowerOfMotor,
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                    hintText: "Power Of Motor",
                                    label: Text("Power Of Motor"),
                                    prefixIcon: Material(
                                      elevation: 0,
                                      borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.red,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                              ),
                            ),
                          ),
                          SizedBox(height: height/60,),
                          Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(height/10)),
                            child: SizedBox(
                              width: width/1.1,
                              child: TextField(
                                controller: myController.RPM,
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                    hintText: "RPM",
                                    label: Text("RPM"),
                                    prefixIcon: Material(
                                      elevation: 0,
                                      borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.red,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                              ),
                            ),
                          ),
                          SizedBox(height: height/60,),
                          Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(height/10)),
                            child: SizedBox(
                              width: width/1.1,
                              child: TextField(
                                controller: myController.MinDiaofCutter,
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                    hintText: "Min Dia.of Cutter",
                                    label: Text("Min Dia.of Cutter"),
                                    prefixIcon: Material(
                                      elevation: 0,
                                      borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.red,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                  ),
                  Scaffold(
                    body: Text("dcs"),

                  ),

                ],
              )
          ),
        ),


      ),
    );
  });
}
