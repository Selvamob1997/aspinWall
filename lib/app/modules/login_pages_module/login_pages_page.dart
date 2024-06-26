import 'package:aspinwal/app/modules/login_pages_module/login_pages_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../IncludeFiles/FadeAnimation.dart';



class LoginPagesPage extends GetView<LoginPagesController> {
  const LoginPagesPage({super.key});

  @override
  Widget build(BuildContext context)=>GetBuilder<LoginPagesController>(builder: (myController) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: width,
              height: height,
              //child: Image.asset('assets/loginBg.jpg',fit: BoxFit.cover,),
              //child: Image.asset('assets/Demologo.jpg',fit: BoxFit.cover,),
            ),
            Container(
              width: width,
              height: height,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(height: height/5.3,),
                    FadeAnimation(
                        1.8,
                        Container(
                          height: height/5.3,
                          width: width,
                          alignment: Alignment.center,
                          //child: Image.asset('assets/logo.jfif'),
                          child: Image.asset('assets/Demologo.jpeg'),
                        )
                    ),
                    SizedBox(height: height/50,),
                    FadeAnimation(
                      2.3,
                      SizedBox(
                        height: height/15,
                        width: width/1.2,
                        child: Material(
                          elevation: 7.0,
                          color: Colors.white,
                          shadowColor: Colors.redAccent,
                          borderRadius: BorderRadius.all(Radius.circular(height/10)),
                          child:
                          TextField(
                            controller: myController.userName,
                            onChanged: (String value) {

                            },
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "UserName",
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.verified_user_rounded,color: Colors.blueAccent,),
                                contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height/50,),
                    FadeAnimation(
                      2.8,
                      SizedBox(
                        height: height/15,
                        width: width/1.2,
                        child: Material(
                          elevation: 7.0,
                          color: Colors.white,
                          shadowColor: Colors.redAccent,
                          borderRadius: BorderRadius.all(Radius.circular(height/10)),
                          child:
                          TextField(
                            controller: myController.password,
                            onChanged: (String value) {},
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "Password",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: height/50),
                                prefixIcon: Icon(Icons.password,color: Colors.blueAccent,)
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height/20,),
                    FadeAnimation(
                      3.5,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: height/30),
                        child: InkWell(
                          onTap: (){
                            myController.logincheck();
                          },
                          child: Container(
                            height: height/15,
                            width: width/2,
                            decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.all(  Radius.circular(height/50)),
                              boxShadow: const [
                                BoxShadow(color: Colors.greenAccent,blurRadius: 100),
                              ]
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: width/20,),
                                Icon(Icons.login,size: height/30,color: Colors.white,),
                                SizedBox(width: width/20,),
                                Text("Login",style: TextStyle(fontSize: height/40,color: Colors.white,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],

        ),

      ),
    );
  });
}
