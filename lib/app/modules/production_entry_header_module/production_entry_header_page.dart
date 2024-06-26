import 'package:aspinwal/app/modules/production_entry_header_module/production_entry_header_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../IncludeFiles/_appbar.dart';


class ProductionEntryHeaderPage extends GetView<ProductionEntryHeaderController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<ProductionEntryHeaderController>(builder: (myController) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
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
                child: MyAppBar(screenName: 'Production Entry',),
              ),
              Container(
                height: height/1.3,
                width: width,
                child: PageView(
                  controller: myController.pagecontroller,
                  pageSnapping: true,
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    //Header
                    SizedBox(
                      height: height/1.9,
                      width: width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: height/14,
                                  width: width/2.1,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.docNo,
                                      cursorColor: Colors.blue,
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                          //intText: "DocNum",
                                          label: Text('DocNum',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                          //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height/14,
                                  width: width/2.1,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.docDate,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('DocDate',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height/80,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: height/14,
                                  width: width/2.1,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.enqNo,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      onTap: (){
                                        myController.showEnqNo();
                                      },
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Enquiry Number',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height/14,
                                  width: width/2.1,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.cardcode,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Customer Code',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height/80,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: height/14,
                                  width: width/2.1,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.enqDate,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Enquiry Date',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height/14,
                                  width: width/2.1,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.cardName,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Customer Name',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height/80,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: height/14,
                                  width: width/2.1,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.contactPerson,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Contact Person',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height/14,
                                  width: width/2.1,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.mobileNo,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Mobile Number',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height/80,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: height/14,
                                  width: width/2.1,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.preparedBy,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      onTap: (){
                                        myController.showEmpData();
                                      },
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Prepared By',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height/14,
                                  width: width/2.1,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.emailId,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Email ID',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height/80,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: height/14,
                                  width: width/2.1,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.status,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      onTap: (){
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Choose Status'),
                                              content: SizedBox(
                                                width: double.minPositive,
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: myController.secscreenStatus.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return ListTile(
                                                      title: Text(myController.secscreenStatus[index].desc.toString()),
                                                      onTap: () {
                                                        myController.status.text = myController.secscreenStatus[index].desc.toString();
                                                        myController.statusCode = myController.secscreenStatus[index].code.toString();
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
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Status',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height/14,
                                  width: width/2.1,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.tool,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      onTap: (){
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Choose Tool'),
                                              content: SizedBox(
                                                width: double.minPositive,
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: myController.secscreenTool.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return ListTile(
                                                      title: Text(myController.secscreenTool[index].desc.toString()),
                                                      onTap: () {
                                                        myController.tool.text = myController.secscreenTool[index].desc.toString();
                                                        myController.toolCode = myController.secscreenTool[index].code.toString();
                                                        myController.showMechineType(myController.toolCode.toString());
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
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Tool',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height/80,),
                            SizedBox(
                              height: height/14,
                              width: width,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.machinetype,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  readOnly: true,
                                  keyboardType: TextInputType.text,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Choose Machine Type'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.secScreenMachineType.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.secScreenMachineType[index].desc.toString()),
                                                  onTap: () {
                                                    myController.machinetype.text = myController.secScreenMachineType[index].desc.toString();
                                                    myController.machinetypeCode = myController.secScreenMachineType[index].code.toString();
                                                    myController. showSpindleMoulder(myController.machinetypeCode);


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
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Machine Type',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/80,),
                            Visibility(
                              visible: myController.spindleMoulderlayout,
                              child: SizedBox(
                                height: height/14,
                                width: width,
                                child: Material(
                                  elevation: 5.0,
                                  color: Colors.white,
                                  shadowColor: Colors.blue,
                                  borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                  child:
                                  TextField(
                                    controller: myController.spindleMouldertype,
                                    onChanged: (String value) {},
                                    cursorColor: Colors.blue,
                                    readOnly: true,
                                    keyboardType: TextInputType.text,
                                    onTap: (){
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Choose Machine Type'),
                                            content: SizedBox(
                                              width: double.minPositive,
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: myController.secScreenSpindleMoulderType.length,
                                                itemBuilder: (BuildContext context, int index) {
                                                  return ListTile(
                                                    title: Text(myController.secScreenSpindleMoulderType[index].desc.toString()),
                                                    onTap: () {
                                                      myController.spindleMouldertype.text = myController.secScreenSpindleMoulderType[index].desc.toString();
                                                      myController.spindleMoulderCode = myController.secScreenSpindleMoulderType[index].code.toString();
                                                      myController.pageNavigation(myController.secScreenSpindleMoulderType[index].pageCont);
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
                                    style: TextStyle(fontSize: height/60),
                                    decoration: InputDecoration(
                                      //intText: "DocNum",
                                      label: Text('Spindle Moulder',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                      //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Header Single
                    Container(
                      height: height/1.9,
                      width: width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.MachineManufacturerctr,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  readOnly: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Choose Leave Type'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.MachineManufacturer.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.MachineManufacturer[index].toString()),
                                                  onTap: () {
                                                    myController.MachineManufacturerctr.text = myController.MachineManufacturer[index].toString();

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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Machine Manufacturer',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.MachineModelCtr,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Machine Model No',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.spindleCtr,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  readOnly: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Is the spindle Vertical (or) Horizontal '),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.spindleType.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.spindleType[index].toString()),
                                                  onTap: () {
                                                    myController.spindleCtr.text = myController.spindleType[index].toString();
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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Is the spindle Vertical (or) Horizontal r',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.RotationspindleCtr,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  readOnly: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Direction of Rotation spindle'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.Rotationspindle.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.Rotationspindle[index].toString()),
                                                  onTap: () {
                                                    myController.RotationspindleCtr.text = myController.Rotationspindle[index].toString();
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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Direction of Rotation spindle',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.verticalisfeedCtr,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('If vertical is feed from Right to Left or the opposite?',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            Row(
                              children: [
                                SizedBox(
                                  height: height/14,
                                  width: width/2.1,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.AutofeedfacilityCtr,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      readOnly: true,
                                      onTap: (){
                                        var subContro = TextEditingController();
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Direction of Rotation spindle'),
                                              content: SizedBox(
                                                width: double.minPositive,
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: myController.YesNo.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return ListTile(
                                                      title: Text(myController.YesNo[index].toString()),
                                                      onTap: () {

                                                        if(myController.YesNo[index].toString()=="Yes"){

                                                          showDialog(
                                                            context:context,
                                                            builder: (BuildContext contex1) => AlertDialog(
                                                                  content: TextFormField(
                                                                    controller: subContro,
                                                                    keyboardType:TextInputType.visiblePassword,

                                                                  ),
                                                                  title: Text("Enter Feed Rate"),
                                                                  actions: <Widget>[
                                                                    Column(
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            Container(
                                                                              child: TextButton(
                                                                                onPressed: () {
                                                                                  if(subContro.text.isEmpty){

                                                                                  }else{

                                                                                  myController.AutofeedfacilityCtr.text = myController.YesNo[index].toString();
                                                                                  myController.feedRate.text = subContro.text;
                                                                                  Navigator.pop(contex1);
                                                                                  Navigator.pop(contex1);
                                                                                  }

                                                                                },
                                                                                child: const Text("Ok"),),),
                                                                            Container(
                                                                              child: TextButton(
                                                                                onPressed: () => Navigator.pop(contex1, 'Cancel'),
                                                                                child: const Text('Cancel'),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                          );

                                                        }else{
                                                          myController.AutofeedfacilityCtr.text = myController.YesNo[index].toString();
                                                          Navigator.pop(context,);
                                                        }




                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Auto feed facility available',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height/14,
                                  width: width/2.1,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.feedRate,
                                      cursorColor: Colors.blue,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),

                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Feed Rate',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                              ],

                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.BoreDiameterCtr,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Diameter of the spindle (Bore Diameter)',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.MotorpowerCtr,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Motor Power',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.RPMRangeCtr,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('RPM Range',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child: TextField(
                                  controller: myController.FeedCtr,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),

                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Feed'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.Feed.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.Feed[index].toString()),
                                                  onTap: () {
                                                    myController.FeedCtr.text = myController.Feed[index].toString();
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



                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Feed',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.HeightspindleCtr,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Useful Height of the spindle ',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/12,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.MaximumDiameterCtr,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Maximum Diameter of the cutter',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/12,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.MinimumDiameterCtr,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),

                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Minimum Diameter of the cutter',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child: TextField(
                                  controller: myController.materialbeingmachinedCtr,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Material being machined'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.Materialbeingmachined.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.Materialbeingmachined[index].toString()),
                                                  onTap: () {
                                                    myController.materialbeingmachinedCtr.text = myController.Materialbeingmachined[index].toString();
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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Material being machined',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.MaterialThicknessCtr,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Material Thickness',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.ProductsmanufaturedCtr,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Products manufatured on the spindle moulder',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.dustextractoCtr,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Is dust extractor available',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.Brandoftools,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Brand of tools presently used',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            Row(
                              children: [
                                SizedBox(
                                  height: height/14,
                                  width: width/2.1,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child: TextField(
                                      controller: myController.toolsserviced,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      readOnly: true,
                                      onTap: (){
                                        var subContro = TextEditingController();
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Are the tools serviced'),
                                              content: SizedBox(
                                                width: double.minPositive,
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: myController.YesNo.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return ListTile(
                                                      title: Text(myController.YesNo[index].toString()),
                                                      onTap: () {
                                                        if(myController.YesNo[index].toString()=="Yes"){
                                                          showDialog(
                                                            context:context,
                                                            builder: (BuildContext contex1) => AlertDialog(
                                                              content: TextFormField(
                                                                controller: subContro,
                                                                keyboardType:TextInputType.visiblePassword,

                                                              ),
                                                              title: Text("Enter Place"),
                                                              actions: <Widget>[
                                                                Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          child: TextButton(
                                                                            onPressed: () {
                                                                              if(subContro.text.isEmpty){

                                                                              }else{

                                                                                myController.toolsserviced.text = myController.YesNo[index].toString();
                                                                                myController.service.text=subContro.text;
                                                                                Navigator.pop(contex1);
                                                                                Navigator.pop(contex1);
                                                                              }

                                                                            },
                                                                            child: const Text("Ok"),),),
                                                                        Container(
                                                                          child: TextButton(
                                                                            onPressed: () => Navigator.pop(contex1, 'Cancel'),
                                                                            child: const Text('Cancel'),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          );

                                                        }else{
                                                          myController.toolsserviced.text = myController.YesNo[index].toString();
                                                          Navigator.pop(context,);
                                                        }

                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Are the tools serviced',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height/14,
                                  width: width/2.1,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.service,
                                      cursorColor: Colors.blue,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),

                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Where?',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.ToolsRequired,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),

                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Tools Required',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.tipRequiredCtr,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Tip Required'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.TipRequired.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.TipRequired[index].toString()),
                                                  onTap: () {
                                                    myController.tipRequiredCtr.text = myController.TipRequired[index].toString();
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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Tip Required',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                          ],
                        ),
                      ),

                    ),
                    // Multiple
                    Container(
                      height: height/1.9,
                      width: width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page2MachineManufacturerctr,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  readOnly: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Choose Leave Type'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.MachineManufacturer.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.MachineManufacturer[index].toString()),
                                                  onTap: () {
                                                    myController.page2MachineManufacturerctr.text = myController.MachineManufacturer[index].toString();

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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Machine Manufacturer',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page2MachineModelCtr,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Machine Model No',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page2Spindleavailable,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Number of Spindle available'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.secNumberofSpindleavailable.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.secNumberofSpindleavailable[index].toString()),
                                                  onTap: () {
                                                    myController.page2Spindleavailable.text =
                                                    myController.secNumberofSpindleavailable[index].toString();

                                                    myController.addListPage2(
                                                      int.parse(myController.page2Spindleavailable.text.toString())
                                                    );



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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Number of Spindle available Nos',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page2spindlemachine,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Spindle machine, confirm if it is a moulder'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.YesNo.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.YesNo[index].toString()),
                                                  onTap: () {
                                                    myController.page2spindlemachine.text = myController.YesNo[index].toString();
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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Spindle machine',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            Container(
                              width: width,
                              child: DataTable(
                                sortColumnIndex: 0,
                                sortAscending: true,
                                columnSpacing: 25,
                                dataRowHeight: height/20,
                                headingRowHeight:height/30,
                                headingRowColor:MaterialStateProperty.all(Colors.blue),
                                showCheckboxColumn:false,
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text('Name',style: TextStyle(color: Colors.white),),
                                  ),
                                  DataColumn(
                                    label: Text('Position',style: TextStyle(color: Colors.white),),
                                  ),
                                  DataColumn(
                                    label: Text('Orientation',style: TextStyle(color: Colors.white),),
                                  ),

                                ],
                                rows: myController.secThelayoutofthespindles.map(
                                      (list) =>
                                      DataRow(
                                        cells: [
                                          DataCell(
                                            Text(
                                              list.Name,
                                              textAlign:TextAlign.left,
                                              style:TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              list.position,
                                              textAlign:TextAlign.left,
                                              style:TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              list.orientation,
                                              textAlign:TextAlign.left,
                                              style:TextStyle(fontSize: 12),
                                            ),
                                          ),

                                        ],
                                      ),
                                )
                                    .toList(),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            Container(
                              width: width,
                              child: DataTable(
                                sortColumnIndex: 0,
                                sortAscending: true,
                                columnSpacing: 25,
                                dataRowHeight: height/20,
                                headingRowHeight:height/30,
                                headingRowColor:MaterialStateProperty.all(Colors.blue),
                                showCheckboxColumn:false,
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text('Name',style: TextStyle(color: Colors.white),),
                                  ),
                                  DataColumn(
                                    label: Text('KW',style: TextStyle(color: Colors.white),),
                                  ),
                                  DataColumn(
                                    label: Text('HP',style: TextStyle(color: Colors.white),),
                                  ),

                                ],
                                rows: myController.secPowerofthemotors.map(
                                      (list) =>
                                      DataRow(
                                        cells: [
                                          DataCell(
                                            Text(
                                              list.name,
                                              textAlign:TextAlign.left,
                                              style:TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              list.km,
                                              textAlign:TextAlign.left,
                                              style:TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              list.hp,
                                              textAlign:TextAlign.left,
                                              style:TextStyle(fontSize: 12),
                                            ),
                                          ),

                                        ],
                                      ),
                                )
                                    .toList(),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page2BoreDiameter,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Diameter of the Spindle (Bore Diameter)  MM',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            Container(
                              width: width,
                              child: DataTable(
                                sortColumnIndex: 0,
                                sortAscending: true,
                                columnSpacing: 25,
                                dataRowHeight: height/20,
                                headingRowHeight:height/30,
                                headingRowColor:MaterialStateProperty.all(Colors.blue),
                                showCheckboxColumn:false,
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text('Name',style: TextStyle(color: Colors.white),),
                                  ),
                                  DataColumn(
                                    label: Text('Min',style: TextStyle(color: Colors.white),),
                                  ),


                                ],
                                rows: myController.secRPMoftheSpindles.map(
                                      (list) =>
                                      DataRow(
                                        cells: [
                                          DataCell(
                                            Text(
                                              list.Name,
                                              textAlign:TextAlign.left,
                                              style:TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              list.min,
                                              textAlign:TextAlign.left,
                                              style:TextStyle(fontSize: 12),
                                            ),
                                          ),


                                        ],
                                      ),
                                )
                                    .toList(),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            Container(
                              width: width,
                              child: DataTable(
                                sortColumnIndex: 0,
                                sortAscending: true,
                                columnSpacing: 25,
                                dataRowHeight: height/20,
                                headingRowHeight:height/30,
                                headingRowColor:MaterialStateProperty.all(Colors.blue),
                                showCheckboxColumn:false,
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text('To',style: TextStyle(color: Colors.white),),
                                  ),
                                  DataColumn(
                                    label: Text('MM',style: TextStyle(color: Colors.white),),
                                  ),


                                ],
                                rows: myController.secDiameterofthecutter.map(
                                      (list) =>
                                      DataRow(
                                        cells: [
                                          DataCell(
                                            Text(
                                              list.to,
                                              textAlign:TextAlign.left,
                                              style:TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              list.mm,
                                              textAlign:TextAlign.left,
                                              style:TextStyle(fontSize: 12),
                                            ),
                                          ),


                                        ],
                                      ),
                                )
                                    .toList(),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page2MaterialsBeingmachined,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  readOnly: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Materials Being machined'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.Materialbeingmachined.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.Materialbeingmachined[index].toString()),
                                                  onTap: () {
                                                    myController.page2MaterialsBeingmachined.text = myController.Materialbeingmachined[index].toString();

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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Machine Manufacturer',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            Text("Raw Material Size (l x b x thickness)"),
                            SizedBox(height: height/90,),
                            Row(
                                children: [
                                  SizedBox(
                                    height: height/14,
                                    width: width/3,
                                    child: Material(
                                      elevation: 5.0,
                                      color: Colors.white,
                                      shadowColor: Colors.blue,
                                      borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                      child:
                                      TextField(
                                        controller: myController.page2RawMaterialSizeL,
                                        onChanged: (String value) {},
                                        cursorColor: Colors.blue,
                                        //readOnly: true,
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(fontSize: height/60),
                                        decoration: InputDecoration(
                                          //intText: "DocNum",
                                          label: Text('L size',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                          //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height/14,
                                    width: width/3,
                                    child: Material(
                                      elevation: 5.0,
                                      color: Colors.white,
                                      shadowColor: Colors.blue,
                                      borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                      child:
                                      TextField(
                                        controller: myController.page2RawMaterialSizeB,
                                        onChanged: (String value) {},
                                        cursorColor: Colors.blue,
                                        //readOnly: true,
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(fontSize: height/60),
                                        decoration: InputDecoration(
                                          //intText: "DocNum",
                                          label: Text('B size',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                          //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height/14,
                                    width: width/3,
                                    child: Material(
                                      elevation: 5.0,
                                      color: Colors.white,
                                      shadowColor: Colors.blue,
                                      borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                      child:
                                      TextField(
                                        controller: myController.page2RawMaterialSizeThickness,
                                        onChanged: (String value) {},
                                        cursorColor: Colors.blue,
                                        //readOnly: true,
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(fontSize: height/60),
                                        decoration: InputDecoration(
                                          //intText: "DocNum",
                                          label: Text('Thickness',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                          //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                            ),
                            SizedBox(height: height/90,),
                            Text("Finished Material Size (l x b x thickness)"),
                            SizedBox(height: height/90,),
                            Row(
                              children: [
                                SizedBox(
                                  height: height/14,
                                  width: width/3,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.page2FinishedMaterialSizeL,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      //readOnly: true,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('L size',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height/14,
                                  width: width/3,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.page2FinishedMaterialSizeB,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      //readOnly: true,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('B size',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height/14,
                                  width: width/3,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.page2FinishedMaterialSizeThickness,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      //readOnly: true,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Thickness',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page2Productsmanufactured,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Products manufactured on the spindle moulder',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page2Brandoftoolspresentlyused,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Brand of tools presently used',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            Row(
                              children: [
                                SizedBox(
                                  height: height/14,
                                  width: width/2.1,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.page2Toolsserviced,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      readOnly: true,
                                      onTap: (){

                                        var subContro = TextEditingController();
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Tools serviced'),
                                              content: SizedBox(
                                                width: double.minPositive,
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: myController.YesNo.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return ListTile(
                                                      title: Text(myController.YesNo[index].toString()),
                                                      onTap: () {

                                                        if(myController.YesNo[index].toString()=="Yes"){

                                                          showDialog(
                                                            context:context,
                                                            builder: (BuildContext contex1) => AlertDialog(
                                                              content: TextFormField(
                                                                controller: subContro,//myController.rotationRate,
                                                                keyboardType:TextInputType.visiblePassword,

                                                              ),
                                                              title: Text("Where"),
                                                              actions: <Widget>[
                                                                Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          child: TextButton(
                                                                            onPressed: () {
                                                                              if(subContro.text.isEmpty){

                                                                              }else{

                                                                                myController.page2Toolsserviced.text = myController.YesNo[index].toString();
                                                                                 myController.rotationRate.text= subContro.text;
                                                                                Navigator.pop(contex1);
                                                                                Navigator.pop(contex1);
                                                                              }

                                                                            },
                                                                            child: const Text("Ok"),),),
                                                                        Container(
                                                                          child: TextButton(
                                                                            onPressed: () => Navigator.pop(contex1, 'Cancel'),
                                                                            child: const Text('Cancel'),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          );

                                                        }else{
                                                          myController.page2Toolsserviced.text = myController.YesNo[index].toString();
                                                          Navigator.pop(context,);
                                                        }

                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('The Tools serviced ',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height/14,
                                  width: width/2.1,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.rotationRate,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('where?',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height/90,),

                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page2DirectionofRotationoftool,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Direction of Rotation of Tool'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.Rotationspindle.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.Rotationspindle[index].toString()),
                                                  onTap: () {
                                                    myController.page2DirectionofRotationoftool.text = myController.Rotationspindle[index].toString();
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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Direction of Rotation of Tool',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),

                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page2TipGrade,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Tip Grade'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.TipRequired.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.TipRequired[index].toString()),
                                                  onTap: () {
                                                    myController.page2TipGrade.text = myController.TipRequired[index].toString();
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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Tip Grade',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),

                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page2Directionoffeedofconveyor,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Direction of feed of conveyor'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.Feed.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.Feed[index].toString()),
                                                  onTap: () {
                                                    myController.page2Directionoffeedofconveyor.text = myController.Feed[index].toString();
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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Direction of feed of conveyor',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),


                          ],
                        ),
                      ),
                    ),
                    //Ending Mill
                    SizedBox(
                      height: height/1.9,
                      width: width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page3MachineManufacturer,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  readOnly: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Choose Leave Type'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.MachineManufacturer.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.MachineManufacturer[index].toString()),
                                                  onTap: () {
                                                    myController.page3MachineManufacturer.text = myController.MachineManufacturer[index].toString();

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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Machine Manufacturer',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page3MachineModelNo,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Machine Model No',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page3spindle,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  readOnly: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Spindle Vertical / Horizontal '),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.spindleType.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.spindleType[index].toString()),
                                                  onTap: () {
                                                    myController.page3spindle.text = myController.spindleType[index].toString();

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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Spindle',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page3Rotationspindle,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  readOnly: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Direction of Rotation spindle'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.Rotationspindle.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.Rotationspindle[index].toString()),
                                                  onTap: () {
                                                    myController.page3Rotationspindle.text = myController.Rotationspindle[index].toString();

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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Spindle',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page3MaximumDiaAbo,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Maximum Dia of the Tool possible above the worktable',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page3MaximumDiaBel,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Maximum Dia of the Tool possible below the worktable',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page3MinimumDia,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Minimum Dia of the Tool possible above the worktable',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page3BoreDiameter,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Diameter of the spindle (Bore Diameter)',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page3MotorPower,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Motor Power Kw/HP',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page3RPMRanges,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('RPM Ranges',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page3usefulheightofthespindle,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Useful height of the spindle',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page3Tablemovement,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  readOnly: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Table movement'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.Movement.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.Movement[index].toString()),
                                                  onTap: () {
                                                    myController.page3Tablemovement.text = myController.Movement[index].toString();

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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Table movement',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page3Cuttermovement,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  readOnly: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Cutter movement'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.Movement.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.Movement[index].toString()),
                                                  onTap: () {
                                                    myController.page3Cuttermovement.text = myController.Movement[index].toString();

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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Cutter movement',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page3MaterialsbeingMachined,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  readOnly: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Materials being Machined'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.Feed.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.Feed[index].toString()),
                                                  onTap: () {
                                                    myController.page3MaterialsbeingMachined.text = myController.Feed[index].toString();

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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Materials being Machined',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page3MaterialwallThickness,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),

                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Material (wall Thickness)',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page3Prodmanmachine,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Products manufactured on the machine',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page3Dexavailable,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Is dust extractor available',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page3BrandTools,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Brand of Tools presently used',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page3Tooser,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Tools serviced'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.YesNo.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.YesNo[index].toString()),
                                                  onTap: () {
                                                    myController.page3Tooser.text = myController.YesNo[index].toString();
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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('The Tools serviced ',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            Row(
                              children: [
                                SizedBox(
                                  height: height/14,
                                  width: width/2.1,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.page3Cooavai,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      readOnly: true,
                                      onTap: (){
                                        var subContro = TextEditingController();
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Coolant available'),
                                              content: SizedBox(
                                                width: double.minPositive,
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: myController.YesNo.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return ListTile(
                                                      title: Text(myController.YesNo[index].toString()),
                                                      onTap: () {


                                                        if(myController.YesNo[index].toString()=="Yes"){
                                                          showDialog(
                                                            context:context,
                                                            builder: (BuildContext contex1) => AlertDialog(
                                                              content: TextFormField(
                                                                controller: subContro,
                                                                keyboardType:TextInputType.visiblePassword,
                                                              ),
                                                              title: Text("where Place"),
                                                              actions: <Widget>[
                                                                Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          child: TextButton(
                                                                            onPressed: () {
                                                                              if(subContro.text.isEmpty){

                                                                              }else{

                                                                                myController.page3Cooavai.text = myController.YesNo[index].toString();
                                                                                myController.toolsservicedWhere.text=subContro.text;
                                                                                Navigator.pop(contex1);
                                                                                Navigator.pop(contex1);
                                                                              }

                                                                            },
                                                                            child: const Text("Ok"),),),
                                                                        Container(
                                                                          child: TextButton(
                                                                            onPressed: () => Navigator.pop(contex1, 'Cancel'),
                                                                            child: const Text('Cancel'),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          );

                                                        }else{
                                                          myController.page3Cooavai.text = myController.YesNo[index].toString();
                                                          Navigator.pop(context,);
                                                        }


                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('The Tools serviced ',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height/14,
                                  width: width/2.1,
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                    child:
                                    TextField(
                                      controller: myController.toolsservicedWhere,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Where?',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                        //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page3TipGrade,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Tip Grade'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.TipRequired.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.TipRequired[index].toString()),
                                                  onTap: () {
                                                    myController.page3TipGrade.text = myController.TipRequired[index].toString();
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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Tip Grade',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),

                          ],
                        ),
                      ),
                    ),
                    // Others
                    SizedBox(
                      height: height/1.9,
                      width: width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page4MachineManufacturer,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  readOnly: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Choose Leave Type'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.MachineManufacturer.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.MachineManufacturer[index].toString()),
                                                  onTap: () {
                                                    myController.page4MachineManufacturer.text = myController.MachineManufacturer[index].toString();

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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Machine Manufacturer',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page4MachineMake,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Machine Make',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page4MachineModelNo,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Model No',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page4spindle,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  readOnly: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Spindle Vertical / Horizontal '),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.spindleType.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.spindleType[index].toString()),
                                                  onTap: () {
                                                    myController.page4spindle.text = myController.spindleType[index].toString();

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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Spindle',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page4Rotationspindle,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  readOnly: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Spindle Vertical / Horizontal '),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.Rotationspindle.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.Rotationspindle[index].toString()),
                                                  onTap: () {
                                                    myController.page4Rotationspindle.text = myController.Rotationspindle[index].toString();

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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Spindle',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page4RighttoLeft,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('If vertical is feed from Right to Left or the opposite?',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page4ffaavai,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  readOnly: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Auto feed facility available '),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.YesNo.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.YesNo[index].toString()),
                                                  onTap: () {
                                                    myController.page4ffaavai.text = myController.YesNo[index].toString();

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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Auto feed facility available ',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page4BoreDiameter,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    label: Text('Diameter of spindle (Bore Diameter) MM',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page4MotorPower,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    label: Text('Motor Power KW/HP',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page4RPMRanges,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    label: Text('RPM Ranges /MIN',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page4Feed,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  readOnly: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Choose Feed'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.Feed.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.Feed[index].toString()),
                                                  onTap: () {
                                                    myController.page4Feed.text = myController.Feed[index].toString();

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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Feed',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page4usefulheightofthespindle,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Useful height of the spindle MM',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page4MaximumDiaAbo,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Maximum Dia of the Tool possible above the worktable',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page4MinimumAbo,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Minimum Dia of the Tool possible above the worktable',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page4MaterialsbeingMachined,
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Materials being Machined'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.Materialbeingmachined.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.Materialbeingmachined[index].toString()),
                                                  onTap: () {
                                                    myController.page4MaterialsbeingMachined.text = myController.Materialbeingmachined[index].toString();

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

                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Materials being Machined',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child: TextField(
                                  controller: myController.page4MaterialwallThickness,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Material Thickness MM',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child: TextField(
                                  controller: myController.page4Prodmanmachine,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Products manufactured on the spindle moulder',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child: TextField(
                                  controller: myController.page4Dexavailable,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Is Dust extractor available',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child: TextField(
                                  controller: myController.page4BrandTools,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Brand of Tools presently used',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            Row(
                                children: [
                                  SizedBox(
                                    height: height/14,
                                    width: width/2.1,
                                    child: Material(
                                      elevation: 5.0,
                                      color: Colors.white,
                                      shadowColor: Colors.blue,
                                      borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                      child: TextField(
                                        controller: myController.page4Tooser,
                                        onChanged: (String value) {},
                                        cursorColor: Colors.blue,
                                        keyboardType: TextInputType.text,
                                        readOnly: true,
                                        style: TextStyle(fontSize: height/60),
                                        onTap: (){
                                          var subContro = TextEditingController();
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text('Coolant available'),
                                                content: SizedBox(
                                                  width: double.minPositive,
                                                  child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: myController.YesNo.length,
                                                    itemBuilder: (BuildContext context, int index) {
                                                      return ListTile(
                                                        title: Text(myController.YesNo[index].toString()),
                                                        onTap: () {


                                                          if(myController.YesNo[index].toString()=="Yes"){
                                                            showDialog(
                                                              context:context,
                                                              builder: (BuildContext contex1) => AlertDialog(
                                                                content: TextFormField(
                                                                  controller: subContro,
                                                                  keyboardType:TextInputType.visiblePassword,
                                                                ),
                                                                title: Text("where Place"),
                                                                actions: <Widget>[
                                                                  Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Container(
                                                                            child: TextButton(
                                                                              onPressed: () {
                                                                                if(subContro.text.isEmpty){

                                                                                }else{

                                                                                  myController.page4Tooser.text = myController.YesNo[index].toString();
                                                                                  myController.page4toolsservicedwhere.text=subContro.text;
                                                                                  Navigator.pop(contex1);
                                                                                  Navigator.pop(contex1);
                                                                                }

                                                                              },
                                                                              child: const Text("Ok"),),),
                                                                          Container(
                                                                            child: TextButton(
                                                                              onPressed: () => Navigator.pop(contex1, 'Cancel'),
                                                                              child: const Text('Cancel'),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            );

                                                          }else{
                                                            myController.page4Tooser.text = myController.YesNo[index].toString();
                                                            Navigator.pop(context,);
                                                          }


                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        decoration: InputDecoration(
                                          //intText: "DocNum",
                                          label: Text('Tools serviced',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                          //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height/14,
                                    width: width/2.1,
                                    child: Material(
                                      elevation: 5.0,
                                      color: Colors.white,
                                      shadowColor: Colors.blue,
                                      borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                      child: TextField(
                                        controller: myController.page4toolsservicedwhere,
                                        onChanged: (String value) {},
                                        cursorColor: Colors.blue,
                                        keyboardType: TextInputType.text,
                                        readOnly: true,
                                        style: TextStyle(fontSize: height/60),
                                        decoration: InputDecoration(
                                          label: Text('Where??',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                          //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                            ),

                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page4TipGrade,
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Tip Grade'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.TipRequired.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.TipRequired[index].toString()),
                                                  onTap: () {
                                                    myController.page4TipGrade.text = myController.TipRequired[index].toString();

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

                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Tip Grade',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                          ],
                        ),
                      ),
                    ),
                    // Router Bit
                    Container(
                      height: height/1.9,
                      width: width,
                      //color: Colors.orange,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page5MachineManufacturer,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Machine Manufacturer'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.MachineManufacturer.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.MachineManufacturer[index].toString()),
                                                  onTap: () {
                                                    myController.page5MachineManufacturer.text = myController.MachineManufacturer[index].toString();

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
                                  decoration: InputDecoration(
                                    label: Text('Machine Manufacturer',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page5MachineModelNo,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  //readOnly: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Machine Model Number',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page5toolpositions,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  //readOnly: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Tool positions Nos',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page5Typeofchuckused,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Type of chuck used'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.spindleType.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.spindleType[index].toString()),
                                                  onTap: () {
                                                    myController.page5Typeofchuckused.text = myController.spindleType[index].toString();

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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Type of chuck used',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page5Typeofcolletused,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Type of collet used'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.Rotationspindle.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.Rotationspindle[index].toString()),
                                                  onTap: () {
                                                    myController.page5Typeofcolletused.text = myController.Rotationspindle[index].toString();

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
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Type of collet used',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page5ToDiareq,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    label: Text('Tool Diameter required (D)',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page5ToshaSiReq,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    label: Text('Tool shank size required (S) MM',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page5MaxDia,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    label: Text('Maximum Diameter of Tool possible on Tool post',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page5ToCulengNL,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    label: Text('Tool Cutting length (NL)',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page5ToToLengGL,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    label: Text('Tool Total Length (GL)',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page5DirRotTool,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Machine Manufacturer'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.Movement.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.Movement[index].toString()),
                                                  onTap: () {
                                                    myController.page5DirRotTool.text = myController.Movement[index].toString();

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
                                  decoration: InputDecoration(
                                    label: Text('Direction of Rotation of Tool',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page5NoFluTip,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  //readOnly: true,
                                  decoration: InputDecoration(
                                    label: Text('Number of Flutes / Tips',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page5Fltwides,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Flute twist design'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.Feed.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.Feed[index].toString()),
                                                  onTap: () {
                                                    myController.page5Fltwides.text = myController.Feed[index].toString();

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
                                  decoration: InputDecoration(
                                    label: Text('Flute twist design',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page5Material,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Material'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.Materialbeingmachined.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.Materialbeingmachined[index].toString()),
                                                  onTap: () {
                                                    myController.page5Material.text = myController.Materialbeingmachined[index].toString();

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
                                  decoration: InputDecoration(
                                    label: Text('Material',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page5MateThick,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    label: Text('Material Thickness',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page5SpiRPM,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    label: Text('Spindle RPM',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page5MotorPower,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    label: Text('Motor Power KW/HP',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page5Radius,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    label: Text('Radius MM',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page5Chamangle,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    label: Text('Chamfer angle',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child: TextField(
                                  controller: myController.page5Tipgrade,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Material'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.TipRequired.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.TipRequired[index].toString()),
                                                  onTap: () {
                                                    myController.page5Tipgrade.text = myController.TipRequired[index].toString();
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
                                  decoration: InputDecoration(
                                    label: Text('Tip grade',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child: TextField(
                                  controller: myController.page5PortableRouter,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Material'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.secNumberofSpindleavailable.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.secNumberofSpindleavailable[index].toString()),
                                                  onTap: () {
                                                    myController.page5PortableRouter.text = myController.secNumberofSpindleavailable[index].toString();

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
                                  decoration: InputDecoration(
                                    label: Text('Portable Router',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),

                          ],
                        ),
                      ),
                    ),
                    // Dril Bit
                    Container(
                      height: height/1.9,
                      width: width,
                      //color: Colors.green,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page6MachineManufacturer,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Machine Manufacturer'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.MachineManufacturer.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.MachineManufacturer[index].toString()),
                                                  onTap: () {
                                                    myController.page6MachineManufacturer.text = myController.MachineManufacturer[index].toString();

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
                                  decoration: InputDecoration(
                                    label: Text('Machine Manufacturer',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page6MachineModelNo,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  //readOnly: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Machine Model Number',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page6CNCControlle,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Machine Manufacturer'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.YesNo.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.YesNo[index].toString()),
                                                  onTap: () {
                                                    myController.page6CNCControlle.text = myController.YesNo[index].toString();

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
                                  decoration: InputDecoration(
                                    label: Text('Is the Machine CNC Controller?',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page6NuofHe,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  //readOnly: true,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Number of Heads',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page6TonuVer,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  //readOnly: true,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Total number of Vertical adaptors per Head',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page6TonuHar,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  //readOnly: true,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Total number of Horizontal adaptors per Head',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page6Drillbit,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Type of Drill-bit'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.Rotationspindle.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.Rotationspindle[index].toString()),
                                                  onTap: () {
                                                    myController.page6Drillbit.text = myController.Rotationspindle[index].toString();

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
                                  decoration: InputDecoration(
                                    label: Text('Type of Drill-bit',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),

                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page6DbitDiameter,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  //readOnly: true,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Drill-bit Diameter (D)',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page6DbitCutdepNL,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  //readOnly: true,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Drill-bit cutting depth (NL)',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page6DbitLenGL,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  //readOnly: true,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Total length of Drill-bit (GL) possible',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page6DrillbitSD,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  //readOnly: true,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Drill-bit (Shank Dia)',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),

                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page6TipGrade,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Tip Grade'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.TipRequired.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.TipRequired[index].toString()),
                                                  onTap: () {
                                                    myController.page6TipGrade.text = myController.TipRequired[index].toString();

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
                                  decoration: InputDecoration(
                                    label: Text('Tip Grade',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),

                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page6DrillbitRota,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Drill-bit direction of Rotation'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.Movement.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.Movement[index].toString()),
                                                  onTap: () {
                                                    myController.page6DrillbitRota.text = myController.Movement[index].toString();

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
                                  decoration: InputDecoration(
                                    label: Text('Drill-bit direction of Rotation',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page6Materialsbeingbored,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Materials being bored'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.Materialbeingmachined.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.Materialbeingmachined[index].toString()),
                                                  onTap: () {
                                                    myController.page6Materialsbeingbored.text = myController.Materialbeingmachined[index].toString();

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
                                  decoration: InputDecoration(
                                    label: Text('Materials being bored',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),

                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page6MaterialThickness,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  //readOnly: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Material Thickness',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            
                            Text("Grooving Sawblade Specification"),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page6Diameter,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Diameter',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page6TipThickness,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  //readOnly: true,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Tip Thickness',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page6Bore,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  //readOnly: true,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Bore',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),
                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page6NLA,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  //readOnly: true,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: height/60),
                                  decoration: InputDecoration(
                                    //intText: "DocNum",
                                    label: Text('Pin hole dimensions (NLA)',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),

                            SizedBox(
                              height: height/14,
                              width: width/1.1,
                              child: Material(
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(height/10)),
                                child:
                                TextField(
                                  controller: myController.page6bitserviced,
                                  onChanged: (String value) {},
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: height/60),
                                  readOnly: true,
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Are the bit serviced? If so where?'),
                                          content: SizedBox(
                                            width: double.minPositive,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.YesNo.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                  title: Text(myController.YesNo[index].toString()),
                                                  onTap: () {
                                                    myController.page6bitserviced.text = myController.YesNo[index].toString();

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
                                  decoration: InputDecoration(
                                    label: Text('Is the Machine CNC Controller?',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                    //prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height/90,),



                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),

        persistentFooterButtons: [
          TextButton(
              onPressed: (){
                myController.pageNavigation(0);
                },
              child: Text('Home'),
          ),
          SizedBox(
            width: width/4,
            child: FloatingActionButton.extended(
              backgroundColor: Colors.green,
              icon: Icon(Icons.check, color: Colors.white),
              label: Text('Save', style: TextStyle(color: Colors.white),),
              heroTag: 'Save',
              onPressed: () {
                myController.postSave();
              },
            ),
          ),

        ],

      ),
    );
  });
}
