import 'package:aspinwal/app/modules/dash_board_module/dash_board_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

//0import 'package:syncfusion_flutter_charts/charts.dart';


class DashBoardPage extends GetView<DashBoardController> {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context)=>GetBuilder<DashBoardController>(builder: (myController) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: height/8.5,
              width: width/0.1,
              color: Colors.blue.shade900,
              child: SizedBox(
                height: height/10,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: height/11,
                      width: width/2.1,
                      child: Column(
                        children: [
                          SizedBox(
                            height: height/22,
                            width: width/2.1,
                            child: Text("Welcome..",style: TextStyle(fontSize: height/40,color: Colors.white,fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(
                            height: height/22,
                            width: width/2.1,
                            child: Text("Mr . "+myController.sessionName,style: TextStyle(color: Colors.amber),),
                          ),
                        ],
                      ),

                    ),
                    SizedBox(
                      height: height/20,
                      width: width/5.1,
                      child: Image.asset('assets/logo.jfif',),
                    ),
                    SizedBox(
                      height: height/20,
                      width: width/5.1,
                      child: IconButton(
                        onPressed: () {

                          myController.getSubNavigation(2, "reportType", "cardCodemanin", "mn");

                        },
                        icon: Icon(Icons.notifications_active,color: Colors.white,),),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: height/4.5,
              width: width/0.1,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: height/10),
              child: Container(
                height: height/3.5,
                width: width/1,
                child: Card(
                  elevation: 5,
                  child: CarouselSlider(
                      items: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage('assets/slider1.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage('assets/slider2.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage('assets/slider3.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage('assets/img.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage('assets/img_1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage('assets/img_2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage('assets/img_3.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                       // height: 400,
                        aspectRatio: 16/9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        //onPageChanged: callbackFunction,
                        scrollDirection: Axis.horizontal,
                      )
                  ),
                ),


              ),
            ),
            Container(
              height: height/1.5,
              width: width/0.1,
              margin: EdgeInsets.only(top: height/3),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: (){

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
                                      ),
                                      content: SizedBox(
                                          width: double.minPositive,
                                          child:  ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: myController.secYear.length,
                                            itemBuilder: (BuildContext context, int index) {
                                              return ListTile(
                                                title: Text(myController.secYear[index].toString()),
                                                onTap: () {
                                                  myController.valueSetstate(1,index,1);

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
                            child: Card(
                              elevation: 5,
                              color: Colors.red,
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                  width: width/2.5,
                                  height: 50,
                                  margin: EdgeInsets.only(left: width/50),
                                  alignment: Alignment.center,
                                  child: Text(myController.alterYear.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                              ),
                            ),
                          ),
                        ],
                      ),


                      Row(
                        children: [
                          Container(
                            height: height/20,
                              width: width/6,
                              alignment: Alignment.center,
                              child: Text("O/S -",style:TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          InkWell(
                            onTap: (){
                              myController.secRXCardCode.clear();
                              myController.secRXCardCode.add(RXCardCode("All","All"));
                              for(int i=0;i<myController.rawCardCodeMaster.result!.length;i++){
                                myController.secRXCardCode.add(RXCardCode(myController.rawCardCodeMaster.result![i].cardCode, myController.rawCardCodeMaster.result![i].cardName));
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
                                          myController.searchvarible=vv.toString();
                                          myController.secRXCardCode.clear();
                                          for(int i=0;i<myController.rawCardCodeMaster.result!.length;i++){
                                            if(myController.rawCardCodeMaster.result![i].cardName.toString().contains(myController.searchvarible.toString())){
                                              myController.secRXCardCode.add(
                                                  RXCardCode(
                                                      myController.rawCardCodeMaster.result![i].cardCode,
                                                      myController.rawCardCodeMaster.result![i].cardName)
                                              );
                                            }
                                          }
                                        },
                                      ),
                                      content: SizedBox(
                                          width: double.minPositive,
                                          child: Obx(()=> ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: myController.secRXCardCode.length,
                                            itemBuilder: (BuildContext context, int ind) {
                                              return ListTile(
                                                title: Text(myController.secRXCardCode[ind].cardName.toString()),
                                                onTap: () {
                                                  myController.valueSetstate(3,ind,1);

                                                  //Navigator.pop(context,);
                                                  myController.searchvarible='';

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
                            child: Obx(()=>Container(
                              height: height/20,
                                alignment: Alignment.center,
                                child: Text(myController.cardName.toString()),
                            ),
                          )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Card(
                            elevation: 5,
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              height: height/10,
                              width: width/4.2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.green,
                                    Colors.green,
                                    //Colors.white,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: height/20,
                                    width: width/4.2,
                                    alignment: Alignment.center,
                                    child: Text('Pending',style: TextStyle(fontSize: height/50,fontWeight: FontWeight.bold,color: Colors.white54),),

                                  ),
                                  Container(
                                    height: height/20,
                                    width: width/4.2,
                                    alignment: Alignment.center,
                                    child: Text(myController.totalPending,style: TextStyle(fontSize: height/55,fontWeight: FontWeight.bold,color: Colors.white),),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
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
                                      ),
                                      content: SizedBox(
                                          width: double.minPositive,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: myController.secSalesType.length,
                                            itemBuilder: (BuildContext context, int inde) {
                                              return ListTile(
                                                title: Text(myController.secSalesType[inde].toString()),
                                                onTap: () {
                                                  myController.valueSetstate(4,inde,1);

                                                  //Navigator.pop(context,);
                                                  myController.searchvarible='';

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
                            child: Card(
                              elevation: 5,
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                height: height/10,
                                width: width/4.2,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue,
                                      Colors.blueAccent,

                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topLeft,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: height/20,
                                      width: width/4.2,
                                      alignment: Alignment.center,
                                      child: Text('Due Amt',style: TextStyle(fontSize: height/50,fontWeight: FontWeight.bold,color: Colors.white54),),

                                    ),
                                    Container(
                                      height: height/20,
                                      width: width/4.2,
                                      alignment: Alignment.center,
                                      child: Text(myController.totaloverDue,style: TextStyle(fontSize: height/55,fontWeight: FontWeight.bold,color: Colors.white),),

                                    )



                                  ],
                                ),

                              ),
                            ),
                          ),
                          Card(
                            elevation: 5,
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              height: height/10,
                              width: width/4.2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.pinkAccent,
                                    Colors.pink,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomLeft,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: height/20,
                                    width: width/4.2,
                                    alignment: Alignment.center,
                                    child: Text('Above 60',style: TextStyle(fontSize: height/50,fontWeight: FontWeight.bold,color: Colors.white54),),

                                  ),
                                  Container(
                                    height: height/20,
                                    width: width/4.2,
                                    alignment: Alignment.center,
                                    child: Text(myController.overDueAbove60Days,style: TextStyle(fontSize: height/55,fontWeight: FontWeight.bold,color: Colors.white),),

                                  )



                                ],
                              ),

                            ),
                          ),
                          Container(
                            height: height/20,
                            width: width/10.2,
                            child: IconButton(
                              onPressed: () {
                                myController.getSubNavigation(
                                    1, 1,
                                    myController.cardCode,
                                    myController.alterMonthTypeCode);
                              },
                              icon: Icon(Icons.remove_red_eye),),

                          )
                        ],
                      ),

                      Row(
                        children: [
                          Container(
                            height: height/20,
                            width: width/6,
                            alignment: Alignment.center,
                            child: Text("Target -",style:TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          InkWell(
                              onTap: (){
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
                                        ),
                                        content: SizedBox(
                                          width: double.minPositive,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: myController.secMonthType.length,
                                            itemBuilder: (BuildContext context, int index) {
                                              return ListTile(
                                                title: Text(myController.secMonthType[index].code.toString()),
                                                onTap: () {
                                                  myController.valueSetstate(2,index,2);

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
                                height: height/20,
                                alignment: Alignment.center,
                                child: Text(myController.alterMonthType.toString()),
                              ),
                              ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Card(
                            elevation: 5,
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              height: height/10,
                              width: width/4.2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.green,
                                    Colors.green,
                                    //Colors.white,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: height/20,
                                    width: width/4.2,
                                    alignment: Alignment.center,
                                    child: Text('Target',style: TextStyle(fontSize: height/50,fontWeight: FontWeight.bold,color: Colors.white54),),

                                  ),
                                  Container(
                                    height: height/20,
                                    width: width/4.2,
                                    alignment: Alignment.center,
                                    child: Text(myController.totalTarget,style: TextStyle(fontSize: height/55,fontWeight: FontWeight.bold,color: Colors.white),),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
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
                                      ),
                                      content: SizedBox(
                                        width: double.minPositive,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: myController.secSalesType.length,
                                          itemBuilder: (BuildContext context, int inde) {
                                            return ListTile(
                                              title: Text(myController.secSalesType[inde].toString()),
                                              onTap: () {
                                                myController.valueSetstate(4,inde,2);

                                                //Navigator.pop(context,);
                                                myController.searchvarible='';

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
                            child: Card(
                              elevation: 5,
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                height: height/10,
                                width: width/4.2,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue,
                                      Colors.blueAccent,

                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topLeft,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: height/20,
                                      width: width/4.2,
                                      alignment: Alignment.center,
                                      child: Text('Achived',style: TextStyle(fontSize: height/50,fontWeight: FontWeight.bold,color: Colors.white54),),

                                    ),
                                    Container(
                                      height: height/20,
                                      width: width/4.2,
                                      alignment: Alignment.center,
                                      child: Text(myController.totalAchived,style: TextStyle(fontSize: height/55,fontWeight: FontWeight.bold,color: Colors.white),),

                                    )



                                  ],
                                ),

                              ),
                            ),
                          ),
                          Card(
                            elevation: 5,
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              height: height/10,
                              width: width/4.2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.pinkAccent,
                                    Colors.pink,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomLeft,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: height/20,
                                    width: width/4.2,
                                    alignment: Alignment.center,
                                    child: Text('ShortFall',style: TextStyle(fontSize: height/50,fontWeight: FontWeight.bold,color: Colors.white54),),

                                  ),
                                  Container(
                                    height: height/20,
                                    width: width/4.2,
                                    alignment: Alignment.center,
                                    child: Text(myController.totalShartFall,style: TextStyle(fontSize: height/55,fontWeight: FontWeight.bold,color: Colors.white),),

                                  )



                                ],
                              ),

                            ),
                          ),
                          Container(
                            height: height/20,
                            width: width/10.2,
                            //child: IconButton(onPressed: () {  }, icon: Icon(Icons.remove_red_eye),),

                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: height/20,
                            width: width/6,
                            alignment: Alignment.center,
                            child: Text("Qtn -",style:TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          InkWell(
                              onTap: (){
                                myController.secRXCardCode.clear();
                                myController.secRXCardCode.add(RXCardCode("All","All"));
                                for(int i=0;i<myController.rawCardCodeMaster.result!.length;i++){
                                  myController.secRXCardCode.add(RXCardCode(myController.rawCardCodeMaster.result![i].cardCode, myController.rawCardCodeMaster.result![i].cardName));
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
                                            myController.searchvarible=vv.toString();
                                            myController.secRXCardCode.clear();
                                            for(int i=0;i<myController.rawCardCodeMaster.result!.length;i++){
                                              if(myController.rawCardCodeMaster.result![i].cardName.toString().contains(myController.searchvarible.toString())){
                                                myController.secRXCardCode.add(
                                                    RXCardCode(
                                                        myController.rawCardCodeMaster.result![i].cardCode,
                                                        myController.rawCardCodeMaster.result![i].cardName)
                                                );
                                              }
                                            }
                                          },
                                        ),
                                        content: SizedBox(
                                            width: double.minPositive,
                                            child: Obx(()=> ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: myController.secRXCardCode.length,
                                              itemBuilder: (BuildContext context, int indd) {
                                                return ListTile(
                                                  title: Text(myController.secRXCardCode[indd].cardName.toString()),
                                                  onTap: () {
                                                    myController.valueSetstate(5,indd,4);

                                                    //Navigator.pop(context,);
                                                    myController.searchvarible='';

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
                              child: Obx(()=>Container(
                                height: height/20,
                                alignment: Alignment.center,
                                child: Text(myController.cardName1.toString()),
                              ),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: (){
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
                                      ),
                                      content: SizedBox(
                                        width: double.minPositive,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: myController.secMonthType.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            return ListTile(
                                              title: Text(myController.secMonthType[index].code.toString()),
                                              onTap: () {
                                                myController.valueSetstate(6,index,4);

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
                            child: Card(
                              elevation: 5,
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                height: height/10,
                                width: width/4.2,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.green,
                                      Colors.green,
                                      //Colors.white,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: height/20,
                                      width: width/4.2,
                                      alignment: Alignment.center,
                                      child: Text('Total-'+myController.alterMonthType1.toString(),style: TextStyle(fontSize: height/50,fontWeight: FontWeight.bold,color: Colors.white54),),

                                    ),
                                    Container(
                                      height: height/20,
                                      width: width/4.2,
                                      alignment: Alignment.center,
                                      child: Text(myController.Quattotal,style: TextStyle(fontSize: height/55,fontWeight: FontWeight.bold,color: Colors.white),),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 5,
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              height: height/10,
                              width: width/4.2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.blue,
                                    Colors.blueAccent,

                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topLeft,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: height/20,
                                    width: width/4.2,
                                    alignment: Alignment.center,
                                    child: Text('Completed',style: TextStyle(fontSize: height/50,fontWeight: FontWeight.bold,color: Colors.white54),),

                                  ),
                                  Container(
                                    height: height/20,
                                    width: width/4.2,
                                    alignment: Alignment.center,
                                    child: Text(myController.Quatcompleted,style: TextStyle(fontSize: height/55,fontWeight: FontWeight.bold,color: Colors.white),),

                                  )



                                ],
                              ),

                            ),
                          ),
                          Card(
                            elevation: 5,
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              height: height/10,
                              width: width/4.2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.pinkAccent,
                                    Colors.pink,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomLeft,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: height/20,
                                    width: width/4.2,
                                    alignment: Alignment.center,
                                    child: Text('Pending',style: TextStyle(fontSize: height/50,fontWeight: FontWeight.bold,color: Colors.white54),),

                                  ),
                                  Container(
                                    height: height/20,
                                    width: width/4.2,
                                    alignment: Alignment.center,
                                    child: Text(myController.Quatpending,style: TextStyle(fontSize: height/55,fontWeight: FontWeight.bold,color: Colors.white),),

                                  ),




                                ],
                              ),

                            ),
                          ),
                          Container(
                            height: height/20,
                            width: width/10.2,
                            child: IconButton(
                              onPressed: () {
                                myController.getSubNavigation(
                                    1, 3,
                                    myController.cardCode1,
                                    myController.alterMonthTypeCode);
                              },
                              icon: Icon(Icons.remove_red_eye),),

                          )
                        ],
                      ),


                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        persistentFooterButtons: [
          Container(
            height: height/25,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    myController.getdashboardNavigation(12);
                    //myController.getSideMenu(context);
                  },
                  icon:  Icon(Icons.account_circle,color: Colors.blue.shade900,),
                ),
                IconButton(
                  onPressed: () {
                    myController.getdashboardNavigation(11);
                    //myController.getSideMenu(context);
                  },
                  icon: const Icon(Icons.menu),
                ),
                IconButton(
                  onPressed: () {
                    myController.getdashboardNavigation(5);
                  },
                  icon: const Icon(Icons.dashboard),
                ),
                IconButton(
                  onPressed: () {
                    //myController.getSalesData("2905A047", "All", 2023, "All");
                    myController.getdashboardNavigation(13);
                  },
                  icon: const Icon(Icons.exit_to_app),
                ),
              ],
            ),
          )
        ],
      ),
    );
  });
}
