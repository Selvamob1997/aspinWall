// ignore_for_file: deprecated_member_use
import 'dart:developer';
import 'dart:io';
import 'package:aspinwal/app/modules/lead_paged_module/lead_paged_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../IncludeFiles/_appbar.dart';


class LeadPagedPage extends GetView<LeadPagedController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<LeadPagedController>(builder: (myController) {
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
                  child: MyAppBar(screenName: 'Lead Enquiry',),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: TextField(
                      controller: myController.cardname,
                      onChanged: (String value) {

                      },
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "Company Name",
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
                SizedBox(height: height/60,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: SizedBox(
                      height: height/13,
                      child: DropdownSearch<String>(
                        mode: Mode.DIALOG,
                        showSearchBox: true,
                        items: myController.campanygroup,
                        hint: 'Company Group',
                        label: 'Company Group',
                        dropdownSearchDecoration: InputDecoration(
                            enabled: false,
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/60)
                        ),
                        onChanged: (val) {
                          log(val.toString());
                          for (int kk = 0; kk < myController.rawLeadMasters.result!.length; kk++) {
                              if (myController.rawLeadMasters.result![kk].name.toString() == val) {
                                myController.altercampanygroup = myController.rawLeadMasters.result![kk].name.toString();

                              }
                              log(myController.altercampanygroup.toString());
                          }

                        },
                        selectedItem: myController.altercampanygroup,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height/60,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: SizedBox(
                      height: height/13,
                      child: DropdownSearch<String>(
                        mode: Mode.DIALOG,
                        showSearchBox: true,
                        items: myController.typeofbusiness,
                        hint: 'Type Of Business',
                        label: 'Type Of Business',
                        dropdownSearchDecoration: InputDecoration(
                            enabled: false,
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/60)
                        ),
                        onChanged: (val) {
                          log(val.toString());
                          for (int kk = 0; kk < myController.rawLeadMasters.result!.length; kk++) {
                            if (myController.rawLeadMasters.result![kk].name.toString() == val) {
                              myController.altertypeofbusiness = myController.rawLeadMasters.result![kk].name.toString();
                            }
                            log(myController.altertypeofbusiness.toString());
                          }
                        },
                        selectedItem: myController.altertypeofbusiness,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height/60,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: TextField(
                      controller: myController.mobileno,
                      onChanged: (String value) {},
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "MobileNo",
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(height/15)),
                            child: const Icon(
                              Icons.mobile_screen_share_sharp,
                              color: Colors.blue,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                    ),
                  ),
                ),
                SizedBox(height: height/60,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: TextField(
                      controller: myController.contactperson,
                      onChanged: (String value) {},
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "Contact Person",
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(height/15)),
                            child: const Icon(
                              Icons.account_circle_outlined,
                              color: Colors.blue,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                    ),
                  ),
                ),
                SizedBox(height: height/60,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: SizedBox(
                      height: height/13,
                      child: DropdownSearch<String>(
                        mode: Mode.DIALOG,
                        showSearchBox: true,
                        items: myController.contactPersonList,
                        hint: 'Contact Person Position',
                        label: 'Contact Person Position',
                        dropdownSearchDecoration: InputDecoration(
                            enabled: false,
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/60)
                        ),
                        onChanged: (val) {
                          log(val.toString());
                          for (int kk = 0; kk < myController.rawLeadMasters.result!.length; kk++) {
                            if (myController.rawLeadMasters.result![kk].name.toString() == val) {
                              myController.contactpersonposition.text = myController.rawLeadMasters.result![kk].name.toString();
                              myController.altercontactpersonposition = myController.rawLeadMasters.result![kk].name.toString();
                            }
                            log(myController.contactpersonposition.text.toString());

                          }
                        },
                        selectedItem: myController.altercontactpersonposition.toString(),
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: height/30),
                //   child: Material(
                //     elevation: 2.0,
                //     borderRadius: BorderRadius.all(Radius.circular(height/10)),
                //     child: TextField(
                //       controller: myController.contactpersonposition,
                //       onChanged: (String value) {},
                //       cursorColor: Colors.blue,
                //       keyboardType: TextInputType.text,
                //       decoration: InputDecoration(
                //           hintText: "Contact Person's Position",
                //           prefixIcon: Material(
                //             elevation: 0,
                //             borderRadius: BorderRadius.all(Radius.circular(height/15)),
                //             child: const Icon(
                //               Icons.person_outline_sharp,
                //               color: Colors.blue,
                //             ),
                //           ),
                //           border: InputBorder.none,
                //           contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                //     ),
                //   ),
                // ),
                SizedBox(height: height/60,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: TextField(
                      controller: myController.email,
                      onChanged: (String value) {},
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Email",
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
                SizedBox(height: height/60,),
                const Text("Office Address Detalies"),

                Container(
                  height: height/13,
                  width: width/1.1,
                  //color: Colors.green,
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: TextField(
                      controller: myController.addressType,
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
                                    itemCount: myController.secAddressType.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return ListTile(
                                        title: Text(myController.secAddressType[index].toString()),
                                        onTap: () {
                                          myController.addressType.text=myController.secAddressType[index].toString();
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
                          label: Text('Address Type'),
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
                SizedBox(height: height/60,),


                SizedBox(height: height/60,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: TextField(
                      controller: myController.streetname,
                      onChanged: (String value) {},
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Street Name",
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(height/15)),
                            child: const Icon(
                              Icons.streetview_outlined,
                              color: Colors.blue,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                    ),
                  ),
                ),
                SizedBox(height: height/60,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: TextField(
                      controller: myController.landmark,
                      onChanged: (String value) {},
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "LandMark",
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(height/15)),
                            child: const Icon(
                              Icons.location_on_sharp,
                              color: Colors.blue,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                    ),
                  ),
                ),
                SizedBox(height: height/60,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: SizedBox(
                      height: height/13,
                      child: DropdownSearch<String>(
                        mode: Mode.DIALOG,
                        showSearchBox: true,
                        items: myController.stateList,
                        hint: 'State',
                        label: 'State',
                        dropdownSearchDecoration: InputDecoration(
                            enabled: false,
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/60)
                        ),
                        onChanged: (val) {
                          log(val.toString());
                          for (int kk = 0; kk < myController.rawLeadMasters.result!.length; kk++) {
                            if (myController.rawLeadMasters.result![kk].name.toString() == val) {
                              myController.state.text = myController.rawLeadMasters.result![kk].name.toString();
                              myController.alterState = myController.rawLeadMasters.result![kk].name.toString();
                              myController.getalterState = myController.rawLeadMasters.result![kk].type1.toString();
                            }
                          }
                          print(myController.getalterState);
                          myController.getDistmaster();
                          //log(myController.state.text.toString());
                        },
                        selectedItem: myController.alterState.toString(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height/60,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: SizedBox(
                      height: height/13,
                      child: DropdownSearch<String>(
                        mode: Mode.DIALOG,
                        showSearchBox: true,
                        items: myController.secDistrict,
                        hint: 'District',
                        label: 'District',
                        dropdownSearchDecoration: InputDecoration(
                            enabled: false,
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/60)
                        ),
                        onChanged: (val) {
                          log(val.toString());
                          for (int kk = 0; kk < myController.rawDistrictModel.result!.length; kk++) {
                            if (myController.rawDistrictModel.result![kk].name.toString() == val) {
                              myController.district.text = myController.rawDistrictModel.result![kk].name.toString();
                              myController.alterdistrict = myController.rawDistrictModel.result![kk].name.toString();
                              myController.getalterdistrict = myController.rawDistrictModel.result![kk].code.toString();
                            }
                          }
                          print(myController.getalterdistrict);

                        },
                        selectedItem: myController.alterdistrict.toString(),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height/60,),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: height/30),
                //   child: Material(
                //     elevation: 2.0,
                //     borderRadius: BorderRadius.all(Radius.circular(height/10)),
                //     child: TextField(
                //       controller: myController.state,
                //       onChanged: (String value) {},
                //       cursorColor: Colors.blue,
                //       keyboardType: TextInputType.emailAddress,
                //       decoration: InputDecoration(
                //           hintText: "State",
                //           prefixIcon: Material(
                //             elevation: 0,
                //             borderRadius: BorderRadius.all(Radius.circular(height/15)),
                //             child: const Icon(
                //               Icons.location_on_sharp,
                //               color: Colors.blue,
                //             ),
                //           ),
                //           border: InputBorder.none,
                //           contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                //     ),
                //   ),
                // ),
                SizedBox(height: height/60,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: TextField(
                      controller: myController.officeno,
                      onChanged: (String value) {},
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Office No",
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(height/15)),
                            child: const Icon(
                              Icons.local_activity,
                              color: Colors.blue,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                    ),
                  ),
                ),
                SizedBox(height: height/60,),
                const Text("Payment terms"),
                SizedBox(height: height/60,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: SizedBox(
                      height: height/15,
                      child: DropdownSearch<String>(
                        mode: Mode.DIALOG,
                        showSearchBox: true,
                        items: myController.currencytype,
                        hint: 'Currency',
                        label: 'Currency',
                        dropdownSearchDecoration: InputDecoration(
                            enabled: false,
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/60)
                        ),
                        onChanged: (val) {
                          log(val.toString());
                          for (int kk = 0; kk < myController.rawLeadMasters.result!.length; kk++) {
                              if (myController.rawLeadMasters.result![kk].name.toString() == val) {
                                myController.altercurrency = myController.rawLeadMasters.result![kk].name.toString();
                              }
                              log(myController.altercurrency.toString());

                          }
                        },
                        selectedItem: myController.altercurrency,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height/60,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: TextField(
                      controller: myController.pan,
                      onChanged: (String value) {},
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Pan No",
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(height/15)),
                            child: const Icon(
                              Icons.add_card,
                              color: Colors.blue,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                    ),
                  ),
                ),
                SizedBox(height: height/60,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: TextField(
                      controller: myController.gstin,
                      onChanged: (String value) {},
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "GSTIN No",
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(height/15)),
                            child: const Icon(
                              Icons.confirmation_num,
                              color: Colors.blue,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                    ),
                  ),
                ),
                SizedBox(height: height/60,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: SizedBox(
                      height: height/13,
                      child: DropdownSearch<String>(
                        mode: Mode.DIALOG,
                        showSearchBox: true,
                        items: myController.gsttype,
                        hint: 'GSTIN Type',
                        label: 'GSTIN Type ',
                        dropdownSearchDecoration: InputDecoration(
                            enabled: false,
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/60)
                        ),
                        onChanged: (val) {
                          log(val.toString());
                          for (int kk = 0; kk < myController.rawLeadMasters.result!.length; kk++) {
                            if (myController.rawLeadMasters.result![kk].name.toString() == val) {
                                myController.alterGSTIN = myController.rawLeadMasters.result![kk].name.toString();
                            }
                            log(myController.alterGSTIN.toString());

                          }
                        },
                        selectedItem: myController.alterGSTIN,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height/60,),
                const Text("Bank Detalies"),
                SizedBox(height: height/60,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: TextField(
                      controller: myController.bankname,
                      onChanged: (String value) {},
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Bank Name",
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(height/15)),
                            child: const Icon(
                              Icons.account_balance_outlined,
                              color: Colors.blue,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                    ),
                  ),
                ),
                SizedBox(height: height/60,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: TextField(
                      controller: myController.accountno,
                      onChanged: (String value) {},
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "A/C Number",
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(height/15)),
                            child: const Icon(
                              Icons.account_balance_wallet,
                              color: Colors.blue,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                    ),
                  ),
                ),
                SizedBox(height: height/60,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: TextField(
                      controller: myController.branch,
                      onChanged: (String value) {},
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "Branch",
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(height/15)),
                            child: const Icon(
                              Icons.account_balance,
                              color: Colors.blue,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                    ),
                  ),
                ),
                SizedBox(height: height/60,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: TextField(
                      controller: myController.ifsc,
                      onChanged: (String value) {},
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "IFSC Code",
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(height/15)),
                            child: const Icon(
                              Icons.card_membership,
                              color: Colors.blue,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50)),
                    ),
                  ),
                ),
                SizedBox(height: height/60,),
                Container(
                  height: height/13,
                  width: width/1.1,
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
                SizedBox(height: height/60,),
                Visibility(
                  visible: myController.order,
                  child: Container(
                    height: height/12,
                    width: width/1.1,
                    //color: Colors.green,
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.all(Radius.circular(height/10)),
                      child: TextField(
                        controller: myController.orderValues,
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
                  visible: myController.quatation,
                  child: Container(
                    height: height/12,
                    width: width/1.1,
                    //color: Colors.green,
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.all(Radius.circular(height/10)),
                      child: TextField(
                        controller: myController.quatationvalue,
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
                SizedBox(height: height/100,),
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
                            // DataColumn(label: Text('TabName',style: TextStyle(color:Colors.white),),),
                            // DataColumn(label: Text('BranName',style: TextStyle(color:Colors.white),),),
                            // DataColumn(label: Text('ModelNo',style: TextStyle(color:Colors.white),),),
                            // DataColumn(label: Text('Mrt Details',style: TextStyle(color:Colors.white),),),
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
                                  // DataCell(
                                  //   Text("${list.TabType}", textAlign: TextAlign.left,),
                                  // ),
                                  // DataCell(
                                  //   Text("${list.brand}", textAlign: TextAlign.left,),
                                  // ),
                                  // DataCell(
                                  //   Text("${list.ModelNo}", textAlign: TextAlign.left,),
                                  // ),
                                  // DataCell(
                                  //   Text("${list.MatDetail}", textAlign: TextAlign.left,),
                                  // ),
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
                SizedBox(height: height/100,),
                Container(
                  height: height/20,
                  width: width/2,
                  // color: Colors.black12,
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {

                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  ListTile(
                                    title:
                                    const Text("Gallery"),
                                    onTap: () async {

                                      myController.getgalary();
                                      Get.back();
                                    },
                                    leading:
                                    const Icon(Icons.image),
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.camera_alt),
                                    title: const Text("Camera"),
                                    onTap: () {
                                      Get.back();
                                      myController.getImage();
                                    },
                                  )
                                ],
                              ),
                            );
                          }
                      );
                    },
                    icon: Icon(Icons.camera_alt),
                  ),

                ),

                Container(
                  height: height/14,
                  width: width/2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(File(myController.ImagePath)),
                        fit: BoxFit.fill,
                      )
                  ),

                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height/30),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(height/10)),
                    child: TextField(
                      controller: myController.remarks,
                      onChanged: (String value) {},
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.text,
                      maxLines: 3,
                      decoration: InputDecoration(
                          hintText: "Remarks",
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
                SizedBox(height: height/100,),
              ],
            ),
          ),
          persistentFooterButtons: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: (){
                  myController.navigation(2);
                }, icon: Icon(Icons.location_on)),

                Visibility(
                  visible: myController.getDocNo=="0"?false:true,
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.red,
                    icon: const Icon(Icons.save),
                    label: const Text('Post SAP'),
                    onPressed: () {
                      myController.postsave(4);
                      //myController.navigation();

                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                FloatingActionButton.extended(
                  backgroundColor: Colors.pinkAccent,
                  icon: const Icon(Icons.folder),
                  label: const Text('Reports'),
                  onPressed: () {

                    myController.navigation(1);

                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                FloatingActionButton.extended(
                  backgroundColor: Colors.green.shade700,
                  icon: const Icon(Icons.check),
                  label: const Text('Save'),
                  onPressed: () {
                    myController.postsave(1);

                  },
                ),
              ],
            ),
          ],

        ),
      ),
    );
  });
}
