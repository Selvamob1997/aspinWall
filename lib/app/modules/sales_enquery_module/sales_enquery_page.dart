import 'package:aspinwal/app/modules/sales_enquery_module/sales_enquery_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../IncludeFiles/_appbar.dart';


class SalesEnqueryPage extends GetView<SalesEnqueryController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<SalesEnqueryController>(builder: (myController) {
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
                child: MyAppBar(screenName: 'Sales Entry',),
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
                                      controller: myController.opportunityType,
                                      cursorColor: Colors.blue,
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      onTap: (){
                                        myController.showOpptype();
                                      },
                                      decoration: InputDecoration(
                                        label: Text('Opportunity Type',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
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
                                      controller: myController.salesType ,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      onTap: (){
                                        myController.showSalestype();
                                      },
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Type',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
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
                                      controller: myController.cradCode,
                                      cursorColor: Colors.blue,
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      onTap: (){
                                        myController.showCustomer();
                                      },
                                      decoration: InputDecoration(
                                        label: Text('Business Partner Code',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
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
                                      controller: myController.opportunityName ,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      keyboardType: TextInputType.text,

                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Opportunity Name',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
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
                                      controller: myController.cardName,
                                      cursorColor: Colors.blue,
                                      enabled: true,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        label: Text('Business Name',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
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
                                      controller: myController.opportunityNo ,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      keyboardType: TextInputType.visiblePassword,
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Opportunity No',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
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
                                      cursorColor: Colors.blue,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
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
                                      controller: myController.saleStatus ,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      keyboardType: TextInputType.visiblePassword,
                                      enabled: true,
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
                                      controller: myController.empName,
                                      cursorColor: Colors.blue,
                                      keyboardType: TextInputType.text,
                                      readOnly: true,
                                      onTap: (){
                                        myController.showEmpData(1);
                                      },
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        label: Text('Sales Employee',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
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
                                      controller: myController.startDate ,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      keyboardType: TextInputType.visiblePassword,
                                      enabled: true,
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        label: Text('Start Date',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
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
                            Text("Potentials"),
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
                                      controller: myController.manufacturing,
                                      cursorColor: Colors.blue,
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      onTap: (){
                                        myController.showManiype();
                                      },
                                      decoration: InputDecoration(
                                        label: Text('Manufacturing',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
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
                                      controller: myController.postartDate ,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      onTap: (){
                                        myController.selectToDate(1, context);
                                      },
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Start Date',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
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
                                      controller: myController.poClosingDate,
                                      cursorColor: Colors.blue,
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      onTap: (){
                                        myController.selectToDate(2, context);
                                      },
                                      decoration: InputDecoration(
                                        label: Text('Closing Date',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
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
                                      controller: myController.salespesBy ,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      onTap: (){
                                        myController.showEmpData(2);
                                      },
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Sales Employee',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
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
                                      controller: myController.poStage,
                                      cursorColor: Colors.blue,
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: height/60),
                                      onTap: (){
                                        myController.showStage();
                                      },
                                      decoration: InputDecoration(
                                        label: Text('Stage',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
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
                                      controller: myController.poSclosing,
                                      cursorColor: Colors.blue,
                                      //readOnly: true,
                                      keyboardType: TextInputType.visiblePassword,
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        label: Text('Closing %',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
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
                                      controller: myController.poammount ,
                                      onChanged: (String value) {},
                                      cursorColor: Colors.blue,
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        //intText: "DocNum",
                                        label: Text('Potential Amount',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
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
                                      controller: myController.powigAmt,
                                      cursorColor: Colors.blue,
                                      //readOnly: true,
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(fontSize: height/60),
                                      decoration: InputDecoration(
                                        label: Text('Weighted Amount',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800),),
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
                            SizedBox(height: height/80,),

                          ],
                        ),
                      ),


                    ),
                    // Header Single
                    Container(
                      height: height/1.9,
                      width: width,
                      //color: Colors.deepOrange,
                      child: Column(
                        children: [
                          SizedBox(
                            height: height/30,
                            width: width/2.1,
                            child: ElevatedButton(
                              onPressed: () {
                                myController.addNewItem();
                              },
                              child: Text('Add'),),
                          ),
                          SizedBox(height: height/50,),
                          Container(
                            height: height/2,
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: myController.secScreendata.isNotEmpty ?
                                DataTable(columnSpacing: 30.0,
                                  headingRowColor: MaterialStateProperty.all(Colors.blue.shade900),
                                  showCheckboxColumn: true,
                                  sortColumnIndex: 0,
                                  sortAscending: true,
                                  columns: const <DataColumn>[
                                    DataColumn(
                                      label: Text(
                                        'S.No',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Center(
                                        child: Text(
                                          'ItemCode',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Center(
                                        child: Text(
                                          'ItemName',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Center(
                                        child: Text(
                                          'Remarks',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Center(
                                        child: Text(
                                          'Action',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),

                                  ],
                                  rows: myController.secScreendata.map((list) =>
                                      DataRow(cells: [
                                        DataCell(Text(
                                            (myController.secScreendata.indexOf(list)+1).toString(), textAlign: TextAlign.left),),
                                        DataCell(
                                          Text(list.itemcode.toString(), textAlign: TextAlign.left),
                                          showEditIcon: true,
                                          onTap: (){
                                            myController.showItemName(myController.secScreendata.indexOf(list));
                                          }
                                        ),
                                        DataCell(
                                          Text(list.itamname.toString(), textAlign: TextAlign.left),

                                        ),
                                        DataCell(
                                          Text(list.remarks.toString(), textAlign: TextAlign.left),
                                          showEditIcon: true,
                                          onTap: (){
                                            myController.showEnterRemarks(myController.secScreendata.indexOf(list), 1);

                                          }

                                        ),

                                        DataCell(
                                          IconButton(
                                              onPressed: () {
                                                print("fd");
                                                myController.activityRemove(myController.secScreendata.indexOf(list));
                                              },
                                              icon: Icon( Icons.delete,color: Colors.red,

                                              )
                                          ),),

                                      ]),
                                  )
                                      .toList(),
                                )
                                    : const Center(
                                  child: Text('No Data'),
                                )),
                          ),
                        ],
                      ),

                    ),
                    // Multiple
                    Container(
                      height: height/1.9,
                      width: width,
                        color: Colors.redAccent

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
          TextButton(
            onPressed: (){
              myController.pageNavigation(1);
              },
            child: Text('Detalies'),
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
