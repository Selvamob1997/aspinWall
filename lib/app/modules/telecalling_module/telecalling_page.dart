import 'package:aspinwal/app/modules/telecalling_module/telecalling_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../IncludeFiles/_appbar.dart';


class TelecallingPage extends GetView<TelecallingController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<TelecallingController>(builder: (controlermain) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: WillPopScope(
        onWillPop: ()=>controlermain.onWillPop(context),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  height: height/10,
                  width: width,
                  alignment: Alignment.center,
                  child: MyAppBar(screenName: "Telecalling Booking",),
                ),
                SizedBox(height: height/50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: height/15,
                      width: width/1.5,
                      child: InkWell(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(builder: (context, StateSetter setState) {
                                return AlertDialog(
                                  title: Text('Choose the Type..'),
                                  content: SizedBox(
                                    width: double.minPositive,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controlermain.secCustype.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return ListTile(
                                          title: Text(controlermain.secCustype[index].toString()),
                                          onTap: () {
                                            controlermain.checkType(controlermain.secCustype[index].toString());

                                            Navigator.pop(context,);

                                          },
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                              );

                            },
                          );
                        },
                        child: Container(
                            width: width/1.1,
                            height: 50,
                            margin: EdgeInsets.only(left: width/50),
                            child: Column(
                              children: [
                                SizedBox(height: height/100,),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(left: width/50),
                                  child: Text("Select Type",
                                    style: TextStyle(color: Colors.grey,fontWeight:
                                    FontWeight.bold,fontSize: height/75),),
                                ),
                                SizedBox(height: height/100,),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(left: width/50),
                                  child: Text(controlermain.custypeName.toString(),
                                    style: TextStyle(color: Colors.black,fontWeight:
                                    FontWeight.bold,fontSize: height/75),),
                                ),

                                SizedBox(height: height/100,),
                              ],
                            )

                        ),
                      ),
                    ),
                    IconButton(onPressed: (){
                      controller.navgatorCont();
                    }, icon: Icon(Icons.location_on))
                  ],
                ),
                SizedBox(height: height/50,),
                Visibility(
                  visible: controlermain.exitingCustome,
                  child: Card(
                    elevation: 5,
                    color: Colors.lightBlueAccent.withOpacity(0.8),
                    child: InkWell(
                      onTap: (){
                        controlermain.secRXCardCode.clear();
                        for(int i=0;i<controlermain.rawCardCodeMaster.result!.length;i++){
                          controlermain.secRXCardCode.add(RXCardCode(controlermain.rawCardCodeMaster.result![i].cardCode, controlermain.rawCardCodeMaster.result![i].cardName));
                        }
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(builder: (context, StateSetter setState) {
                              return AlertDialog(
                                title: TextField(
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      labelText: "Search here...",
                                      hintText: "Search here...",
                                      prefixIcon: Material(
                                        elevation: 0,
                                        borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                        child: const Icon(
                                          Icons.search,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/70)),
                                  onChanged: (vv){
                                    controlermain.searchvarible=vv.toString();
                                    controlermain.secRXCardCode.clear();
                                    for(int i=0;i<controlermain.rawCardCodeMaster.result!.length;i++){
                                      if(controlermain.rawCardCodeMaster.result![i].cardName.toString().contains(controlermain.searchvarible.toString())){
                                        controlermain.secRXCardCode.add(
                                            RXCardCode(
                                                controlermain.rawCardCodeMaster.result![i].cardCode,
                                                controlermain.rawCardCodeMaster.result![i].cardName)
                                        );
                                      }
                                    }
                                  },
                                ),
                                content: SizedBox(
                                    width: double.minPositive,
                                    child: Obx(()=> ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controlermain.secRXCardCode.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return ListTile(
                                          title: Text(controlermain.secRXCardCode[index].cardName.toString()),
                                          onTap: () {
                                            controlermain.cusTomerChange(index,1);

                                            Navigator.pop(context,);
                                            controlermain.searchvarible='';

                                          },
                                        );
                                      },
                                    ),)
                                ),
                              );
                            },
                            );

                          },
                        );
                      },
                      child: Container(
                          width: width/1.1,
                          height: 50,
                          margin: EdgeInsets.only(left: width/50),
                          child: Column(
                            children: [
                              SizedBox(height: height/100,),
                              Obx(()=> Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(left: width/50),
                                  child: Text(controlermain.cardname.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: height/75),)),
                              ),
                              SizedBox(height: height/100,),
                              Obx(()=> Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(left: width/50),
                                  child: Text(controlermain.cardcode.toString(),style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)),
                              ),
                            ],
                          )

                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: controlermain.newCustomer,
                  child: Card(
                    elevation: 5,
                    color: Colors.red,
                    child: InkWell(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(builder: (context, StateSetter setState) {
                              return AlertDialog(
                                title: TextField(
                                  cursorColor: Colors.red,
                                  keyboardType: TextInputType.text,
                                  controller: controlermain.newCardcode,
                                  decoration: InputDecoration(
                                      labelText: "Search here...",
                                      hintText: "Search here...",
                                      prefixIcon: Material(
                                        elevation: 0,
                                        borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                        child: const Icon(
                                          Icons.search,
                                          color: Colors.red,
                                        ),
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/70)),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: (){
                                      controlermain.cardname=controlermain.newCardcode.text.toString().obs;
                                      controlermain.cardcode=controlermain.newCardcode.text.toString().obs;
                                      Get.back();
                                    },
                                    child: Text("Ok"),
                                  ),
                                  TextButton(
                                    onPressed: (){
                                      Get.back();
                                    },
                                    child: Text("Cancel"),
                                  )
                                ],
                              );
                            },
                            );

                          },
                        );
                      },
                      child: Container(
                          width: width/1.1,
                          height: 50,
                          margin: EdgeInsets.only(left: width/50),
                          child: Column(
                            children: [
                              SizedBox(height: height/100,),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(left: width/50),
                                  child: Text(controlermain.cardname.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: height/75),)),

                              SizedBox(height: height/100,),
                              Obx(()=> Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(left: width/50),
                                  child: Text(controlermain.cardcode.toString(),style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)),
                              ),
                            ],
                          )

                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: controlermain.officeLocation,
                  child: Card(
                    elevation: 5,
                    color: Colors.green,
                    child: InkWell(
                      onTap: (){
                        controlermain.secRXCardCode.clear();
                        for(int i=0;i<controlermain.rawCardCodeMaster.result!.length;i++){
                          controlermain.secRXCardCode.add(RXCardCode(controlermain.rawCardCodeMaster.result![i].cardCode, controlermain.rawCardCodeMaster.result![i].cardName));
                        }
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(builder: (context, StateSetter setState) {
                              return AlertDialog(
                                title: TextField(
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      labelText: "Search here...",
                                      hintText: "Search here...",
                                      prefixIcon: Material(
                                        elevation: 0,
                                        borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                        child: const Icon(
                                          Icons.search,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/70)),
                                  onChanged: (vv){
                                    controlermain.searchvarible=vv.toString();
                                    controlermain.secRXCardCode.clear();
                                    for(int i=0;i<controlermain.rawCardCodeMaster.result!.length;i++){
                                      if(controlermain.rawCardCodeMaster.result![i].cardName.toString().contains(controlermain.searchvarible.toString())){
                                        controlermain.secRXCardCode.add(
                                            RXCardCode(
                                                controlermain.rawCardCodeMaster.result![i].cardCode,
                                                controlermain.rawCardCodeMaster.result![i].cardName)
                                        );
                                      }
                                    }
                                  },
                                ),
                                content: SizedBox(
                                    width: double.minPositive,
                                    child: Obx(()=> ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controlermain.secRXCardCode.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return ListTile(
                                          title: Text(controlermain.secRXCardCode[index].cardName.toString()),
                                          onTap: () {
                                            controlermain.cusTomerChange(index,1);

                                            Navigator.pop(context,);
                                            controlermain.searchvarible='';

                                          },
                                        );
                                      },
                                    ),)
                                ),
                              );
                            },
                            );

                          },
                        );
                      },
                      child: Container(
                          width: width/1.1,
                          height: 50,
                          margin: EdgeInsets.only(left: width/50),
                          child: Column(
                            children: [
                              SizedBox(height: height/100,),
                              Obx(()=> Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(left: width/50),
                                  child: Text(controlermain.cardname.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: height/75),)),
                              ),
                              SizedBox(height: height/100,),
                              Obx(()=> Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(left: width/50),
                                  child: Text(controlermain.cardcode.toString(),style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)),
                              ),
                            ],
                          )

                      ),
                    ),
                  ),
                ),
                SizedBox(height: height/50,),
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: height/14,
                        width: width/2,
                        child: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(height/10)),
                          child: TextField(
                            controller: controlermain.contactPercon,
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              //hintText: "Total Amt",
                                label: Text('Contact Person'),
                                prefixIcon: Material(
                                  elevation: 0,
                                  borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                  child: const Icon(
                                    Icons.account_circle,
                                    color: Colors.blue,
                                  ),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                          ),
                        ),

                      ),
                      Container(
                        height: height/14,
                        width: width/2,
                        //color: Colors.green,
                        child: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(height/10)),
                          child: TextField(
                            controller: controlermain.contactnumber,
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              //hintText: "Total Amt",
                                label: Text('Contact No'),
                                prefixIcon: Material(
                                  elevation: 0,
                                  borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                  child: const Icon(
                                    Icons.phone,
                                    color: Colors.blue,
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
                SizedBox(height: height/100,),
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: height/14,
                        width: width/2,
                        //color: Colors.green,
                        // child: Material(
                        //   elevation: 2.0,
                        //   borderRadius: BorderRadius.all(Radius.circular(height/10)),
                        //   child: TextField(
                        //     controller: controlermain.desigenation,
                        //     cursorColor: Colors.blue,
                        //     keyboardType: TextInputType.text,
                        //     decoration: InputDecoration(
                        //       //hintText: "Total Amt",
                        //         label: Text('Designation'),
                        //         prefixIcon: Material(
                        //           elevation: 0,
                        //           borderRadius: BorderRadius.all(Radius.circular(height/15)),
                        //           child: const Icon(
                        //             Icons.verified_user,
                        //             color: Colors.blue,
                        //           ),
                        //         ),
                        //         border: InputBorder.none,
                        //         contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                        //   ),
                        // ),
                        child:Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(height/10)),
                          child: SizedBox(
                            height: height/13,
                            width: width/2,
                            child: DropdownSearch<String>(
                              mode: Mode.DIALOG,
                              showSearchBox: true,
                              items: controlermain.contactPersonList,
                              hint: 'Designation',
                              label: 'Designation',
                              dropdownSearchDecoration: InputDecoration(
                                  enabled: false,
                                  enabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/60)
                              ),
                              onChanged: (val) {
                                //log(val.toString());
                                for (int kk = 0; kk < controlermain.rawLeadMasters.result!.length; kk++) {
                                  if (controlermain.rawLeadMasters.result![kk].name.toString() == val) {
                                    controlermain.desigenation.text = controlermain.rawLeadMasters.result![kk].name.toString();
                                    controlermain.alterdesigenation = controlermain.rawLeadMasters.result![kk].name.toString();
                                  }
                                  //log(myController.contactpersonposition.text.toString());

                                }
                              },
                              selectedItem: controlermain.alterdesigenation.toString(),
                            ),
                          ),
                        ),

                      ),
                      Container(
                        height: height/12,
                        width: width/2,
                        child: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(height/10)),
                          child: TextField(
                            controller: controlermain.email,
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              //hintText: "Total Amt",
                                label: Text('Email'),
                                prefixIcon: Material(
                                  elevation: 0,
                                  borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                  child: const Icon(
                                    Icons.mail,
                                    color: Colors.blue,
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
                SizedBox(height: height/100,),
                Row(
                  children: [
                    Container(
                      height: height/12,
                      width: width/2,
                      //color: Colors.green,
                      child: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.all(Radius.circular(height/10)),
                        child: TextField(
                          controller: controlermain.orderType,
                          cursorColor: Colors.blue,
                          keyboardType: TextInputType.text,
                          readOnly: true,
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(builder: (context, StateSetter setState) {
                                  return AlertDialog(
                                    title: Text('Choose the Type..'),
                                    content: SizedBox(
                                      width: double.minPositive,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: controlermain.secCustype1.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return ListTile(
                                            title: Text(controlermain.secCustype1[index].toString()),
                                            onTap: () {
                                              controlermain.orderType.text=controlermain.secCustype1[index].toString();

                                              controlermain.screenLayout(controlermain.orderType.text);
                                              Navigator.pop(context,);

                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                                );

                              },
                            );
                          },
                          decoration: InputDecoration(
                              label: Text('Visit Type'),
                              prefixIcon: Material(
                                elevation: 0,
                                borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                child: const Icon(
                                  Icons.location_on,
                                  color: Colors.blue,
                                ),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                        ),
                      ),

                    ),
                    Visibility(
                      visible: controlermain.order,
                      child: Container(
                        height: height/12,
                        width: width/2,
                        //color: Colors.green,
                        child: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(height/10)),
                          child: TextField(
                            controller: controlermain.orderValues,
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                label: Text('Order Value'),
                                prefixIcon: Material(
                                  elevation: 0,
                                  borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                  child: const Icon(
                                    Icons.currency_exchange,
                                    color: Colors.blue,
                                  ),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                          ),
                        ),

                      ),
                    ),
                    Visibility(
                      visible: controlermain.quatation,
                      child: Container(
                        height: height/12,
                        width: width/2,
                        //color: Colors.green,
                        child: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(height/10)),
                          child: TextField(
                            controller: controlermain.quatationvalue,
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                label: Text('Quatation Value'),
                                prefixIcon: Material(
                                  elevation: 0,
                                  borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                  child: const Icon(
                                    Icons.currency_exchange,
                                    color: Colors.blue,
                                  ),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                          ),
                        ),

                      ),
                    ),

                  ],
                ),
                SizedBox(height: height/100,),
                Row(
                  children: [
                    Text("Service By Leitz"),
                    IconButton(onPressed: (){
                      controlermain.serviceChe();
                    }, icon: Icon(controlermain.serviceCeck?Icons.check_box:Icons.check_box_outline_blank),
                    ),
                    Visibility(
                      visible: controlermain.serviceCeck,
                      child: Container(
                        height: height/12,
                        width: width/1.7,
                        //color: Colors.green,
                        child: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(height/10)),
                          child: TextField(
                            controller: controlermain.servicePlace,
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                label: Text('Service Place'),
                                prefixIcon: Material(
                                  elevation: 0,
                                  borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
                SizedBox(height: height/100,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    color: Colors.white,
                    shadowColor: Colors.black,
                    child: TextField(
                      controller: controlermain.remarks,
                      //readOnly:true ,
                      cursorColor: Colors.black12,
                      keyboardType: TextInputType.text,
                      maxLines: 5,
                      decoration: InputDecoration(
                          labelText: 'Remarks',
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(height/15)),
                            child: const Icon(
                              Icons.message,
                              color: Colors.orange,
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
          persistentFooterButtons: [
            InkWell(
              onTap: (){
                controlermain.postCheckingIn(2,'D');
              },
              child: Container(
                height: height/15,
                width: width,
                decoration: BoxDecoration(
                    color: controlermain.getDocNo=="0"?Colors.pinkAccent:Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(width/7),
                      bottomRight: Radius.circular(width/7),
                    )
                ),
                alignment: Alignment.center,
                child: Text( controlermain.getDocNo=="0"?'Save':'SAP Posting',style: TextStyle(color: Colors.white,fontSize: height/35,fontWeight: FontWeight.bold),),

              ),
            )
          ],
        ),
      ),
    );
  });
}
