import 'package:aspinwal/app/modules/enquery_screen_module/enquery_screen_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../IncludeFiles/_appbar.dart';



class EnqueryScreenPage extends GetView<EnqueryScreenController> {
  const EnqueryScreenPage({super.key});

  @override
  Widget build(BuildContext context)=>GetBuilder<EnqueryScreenController>(builder: (myController) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: ()=>myController.onWillPop(context),
      child: SafeArea(
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
                  child: MyAppBar(screenName: 'Enquery Screen',),
                ),
                Obx(()=>Container(
                  height: height/30,
                  width: width,
                  margin: EdgeInsets.only(left: 5),
                  child: Text(myController.navigationcardCode.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),),
                )),
                SizedBox(height: height/100,),
                Obx(()=>Container(
                  height: height/30,
                  width: width,
                    margin: EdgeInsets.only(left: 5),
                  child: Text(myController.navigationCardName.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.pinkAccent),),
                )),
                SizedBox(height: height/100,),
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
                            controller: myController.contactPercon,
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
                            controller: myController.contactnumber,
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
                      Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.all(Radius.circular(height/10)),
                        child: SizedBox(
                          height: height/13,
                          width: width/2,
                          child: DropdownSearch<String>(
                            mode: Mode.DIALOG,
                            showSearchBox: true,
                            items: myController.contactPersonList,
                            hint: 'Designation',
                            label: 'Designation',
                            dropdownSearchDecoration: InputDecoration(
                                enabled: false,
                                enabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/60)
                            ),
                            onChanged: (val) {
                              //log(val.toString());
                              for (int kk = 0; kk < myController.rawLeadMasters.result!.length; kk++) {
                                if (myController.rawLeadMasters.result![kk].name.toString() == val) {
                                  myController.desigenation.text = myController.rawLeadMasters.result![kk].name.toString();
                                  myController.alterdesigenation = myController.rawLeadMasters.result![kk].name.toString();
                                }
                                //log(myController.contactpersonposition.text.toString());

                              }
                            },
                            selectedItem: myController.alterdesigenation.toString(),
                          ),
                        ),
                      ),
                      // Container(
                      //   height: height/14,
                      //   width: width/2,
                      //   //color: Colors.green,
                      //   child: Material(
                      //     elevation: 2.0,
                      //     borderRadius: BorderRadius.all(Radius.circular(height/10)),
                      //     child: TextField(
                      //       controller: myController.desigenation,
                      //       cursorColor: Colors.blue,
                      //       keyboardType: TextInputType.text,
                      //       decoration: InputDecoration(
                      //         //hintText: "Total Amt",
                      //           label: Text('Designation'),
                      //           prefixIcon: Material(
                      //             elevation: 0,
                      //             borderRadius: BorderRadius.all(Radius.circular(height/15)),
                      //             child: const Icon(
                      //               Icons.verified_user,
                      //               color: Colors.blue,
                      //             ),
                      //           ),
                      //           border: InputBorder.none,
                      //           contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                      //     ),
                      //   ),
                      //
                      // ),
                      Container(
                        height: height/12,
                        width: width/2,
                        //color: Colors.green,
                        child: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(height/10)),
                          child: TextField(
                            controller: myController.email,
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
                          controller: myController.orderType,
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
                                        itemCount: myController.secCustype.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return ListTile(
                                            title: Text(myController.secCustype[index].toString()),
                                            onTap: () {
                                              myController.orderType.text=myController.secCustype[index].toString();

                                              myController.screenLayout(myController.orderType.text);
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
                                  Icons.settings,
                                  color: Colors.blue,
                                ),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                        ),
                      ),

                    ),
                    Container(
                      height: height/12,
                      width: width/2,
                      //color: Colors.green,
                      child: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.all(Radius.circular(height/10)),
                        child: TextField(
                          controller: myController.tabName,
                          cursorColor: Colors.blue,
                          keyboardType: TextInputType.text,
                          readOnly: true,
                          onTap: (){
                            myController.showMyMachine();
                          },
                          decoration: InputDecoration(
                              label: Text('Choose Machine'),
                              prefixIcon: Material(
                                elevation: 0,
                                borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                child: const Icon(
                                  Icons.settings,
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
                SizedBox(height: height/100,),
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: height/12,
                        width: width/2,
                        //color: Colors.green,
                        child: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(height/10)),
                          child: TextField(
                            controller: myController.machineSubName,
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.text,
                            readOnly: true,
                            onTap: (){
                              myController.showMySubMachine();
                            },
                            decoration: InputDecoration(
                              //hintText: "Total Amt",
                                label: Text('Sub Group'),
                                prefixIcon: Material(
                                  elevation: 0,
                                  borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                  child: const Icon(
                                    Icons.settings,
                                    color: Colors.blue,
                                  ),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                          ),
                        ),

                      ),
                      Container(
                        height: height/12,
                        width: width/2,
                        //color: Colors.green,
                        child: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(height/10)),
                          child: TextField(
                            controller: myController.itemName,
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.text,
                            readOnly: true,
                            onTap: (){
                              myController.getAllmachineData();
                            },
                            decoration: InputDecoration(
                                label: Text('Choose Item'),
                                prefixIcon: Material(
                                  elevation: 0,
                                  borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                  child: const Icon(
                                    Icons.settings,
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
                      Visibility(
                        visible: myController.order,
                        child: Container(
                          height: height/12,
                          width: width/2,
                          //color: Colors.green,
                          child: Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(height/10)),
                            child: TextField(
                              controller: myController.Ordervalue,
                              cursorColor: Colors.blue,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                //hintText: "Total Amt",
                                  label: Text('Order Value'),
                                  prefixIcon: Material(
                                    elevation: 0,
                                    borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                    child: const Icon(
                                      Icons.settings,
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
                        visible: myController.quatation,
                        child: Container(
                          height: height/12,
                          width: width/2,
                          //color: Colors.green,
                          child: Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(height/10)),
                            child: TextField(
                              controller: myController.quatationvalue,
                              cursorColor: Colors.blue,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  label: Text('Quation Value'),
                                  prefixIcon: Material(
                                    elevation: 0,
                                    borderRadius: BorderRadius.all(Radius.circular(height/15)),
                                    child: const Icon(
                                      Icons.settings,
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
                ),

                Visibility(
                  visible: myController.datatbl,
                  child: SizedBox(
                    height: height/2.2,
                    width: width,
                    //color: Colors.deepOrange,
                    child: SingleChildScrollView(
                      scrollDirection:
                      Axis.vertical,
                      child: SingleChildScrollView(
                        scrollDirection:
                        Axis.horizontal,
                        child: myController.secScreenMachineData.isEmpty ?
                        const Center(child: Text('No Data Add!'),) :
                        DataTable(
                          sortColumnIndex: 0,
                          sortAscending: true,
                          showCheckboxColumn: false,
                          headingRowHeight: height/20,
                          headingRowColor: MaterialStateProperty.all(Colors.blue),
                          columns: const <DataColumn>[
                            DataColumn(label: Text('TabName',style: TextStyle(color:Colors.white),),),
                            DataColumn(label: Text('BranName',style: TextStyle(color:Colors.white),),),
                            DataColumn(label: Text('ModelNo',style: TextStyle(color:Colors.white),),),
                            DataColumn(label: Text('Mrt Details',style: TextStyle(color:Colors.white),),),
                            DataColumn(label: Text('ItemCode',style: TextStyle(color:Colors.white),),),
                            DataColumn(label: Text('ItemName',style: TextStyle(color:Colors.white),),),
                            DataColumn(label: Text('Stock',style: TextStyle(color:Colors.white),),),
                            DataColumn(label: Text('Qty',style: TextStyle(color:Colors.white),),),
                            DataColumn(label: Text('Status',style: TextStyle(color:Colors.white),),),
                            DataColumn(label: Text('Action',style: TextStyle(color:Colors.white),),),

                          ],
                          rows:myController.secScreenMachineData.map((list) =>
                              DataRow(
                                cells: [
                                  DataCell(
                                    Text("${list.TabType}", textAlign: TextAlign.left,),
                                  ),
                                  DataCell(
                                    Text("${list.brand}", textAlign: TextAlign.left,),
                                  ),
                                  DataCell(
                                    Text("${list.ModelNo}", textAlign: TextAlign.left,),
                                  ),
                                  DataCell(
                                    Text("${list.MatDetail}", textAlign: TextAlign.left,),
                                  ),
                                  DataCell(
                                    Text("${list.ItemCode}", textAlign: TextAlign.left,),
                                  ),
                                  DataCell(
                                    Text("${list.ItemName}", textAlign: TextAlign.left,),
                                  ),
                                  DataCell(
                                    Text("${list.stock}", textAlign: TextAlign.left,),
                                  ),
                                  DataCell(
                                    Text("${list.qty}", textAlign: TextAlign.left,),
                                    showEditIcon: true,
                                    onTap: (){
                                      myController.removeData(myController.secScreenMachineData.indexOf(list),3);
                                    }
                                  ),
                                  DataCell(
                                    IconButton(
                                        onPressed: () {
                                          myController.removeData(myController.secScreenMachineData.indexOf(list),2);
                                        }, icon: list.status=="Y"?Icon(Icons.check_box):Icon(Icons.check_box_outline_blank))
                                    //Text("${list.status}", textAlign: TextAlign.left,),
                                  ),
                                  DataCell(
                                    IconButton(
                                      onPressed: () {
                                        myController.removeData(myController.secScreenMachineData.indexOf(list),1);
                                      },
                                      icon: Icon(Icons.delete,color: Colors.red,),
                                    )
                                  ),
                                ],
                              ),)
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),

                Row(
                  children: [
                    Text("Service By Leitz"),
                    IconButton(onPressed: (){
                      myController.serviceChe();
                    }, icon: Icon(myController.serviceCeck?Icons.check_box:Icons.check_box_outline_blank),
                    ),
                    Visibility(
                      visible: myController.serviceCeck?false:true,
                      child: Container(
                        height: height/12,
                        width: width/1.7,
                        //color: Colors.green,
                        child: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(height/10)),
                          child: TextField(
                            controller: myController.servicePlace,
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

                SizedBox(height: height/50,),
                Container(
                  //height: height/14,
                  width: width,
                  //color: Colors.green,
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: TextField(
                      controller: myController.remarks,
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
          persistentFooterButtons: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    if(myController.getDocNo.toString()=="0"){
                      myController.postSave();
                    }else {

                    }

                  },
                  child: Container(
                    height: height/15,
                    width: width/2,
                    decoration: BoxDecoration(
                        color: myController.getDocNo.toString()=="0"?Colors.blue:Colors.pinkAccent,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(width/7),
                          bottomRight: Radius.circular(width/7),
                        )
                    ),
                    alignment: Alignment.center,
                    child: Text(myController.getDocNo.toString()=="0"? 'Send Request':'Send Sap',style: TextStyle(color: Colors.white,fontSize: height/35,fontWeight: FontWeight.bold),),

                  ),
                ),
                IconButton(onPressed: (){
                  myController.clearDropdown();
                }, icon: Icon(Icons.clear))
              ],
            )
          ],
        ),
      ),
    );
  });
}
