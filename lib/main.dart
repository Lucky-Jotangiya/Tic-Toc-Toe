import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    home: Tictoc(),
  ));
}

class Tictoc extends StatefulWidget {
  const Tictoc({Key? key}) : super(key: key);

  @override
  State<Tictoc> createState() => _TictocState();
}

class _TictocState extends State<Tictoc> {

  static List num = ['','','','','','','','',''];
  int cnt=0;
  bool one = false;
  bool two = false;
  bool three = false;
  bool four = false;
  bool five = false;
  bool six = false;
  bool seven = false;
  bool eight = false;
  bool nine = false;
  int wonx = 0;
  int wony = 0;
  int turn =0;
  String display="X Turn";

  win(){
    if(num[0]=="x"  && num[1]=="x" && num[2]=="x" ||
        num[3]=="x"  && num[4]=="x" && num[5]=="x" ||
        num[6]=="x"  && num[7]=="x" && num[8]=="x" ||
        num[0]=="x"  && num[3]=="x" && num[6]=="x" ||
        num[1]=="x"  && num[4]=="x" && num[7]=="x" ||
        num[2]=="x"  && num[5]=="x" && num[8]=="x" ||
        num[0]=="x"  && num[4]=="x" && num[8]=="x" ||
        num[2]=="x"  && num[4]=="x" && num[6]=="x"){

      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return Container(
              child: AlertDialog(
                title: const Center(
                  child: Text(
                    "player X win",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black,),
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("ok")),
                ],
              ),
            );
          });
      display="";
      one=true;
      two=true;
      three=true;
      four=true;
      five=true;
      six=true;
      seven=true;
      eight=true;
      nine=true;
      wonx=1;

    }

    else if(num[0]=="o"   && num[1]=="o" && num[2]=="o" ||
        num[3]=="o"  && num[4]=="o" && num[5]=="o" ||
        num[6]=="o"  && num[7]=="o" && num[8]=="o" ||
        num[0]=="o"  && num[3]=="o" && num[6]=="o" ||
        num[1]=="o"  && num[4]=="o" && num[7]=="o" ||
        num[2]=="o"  && num[5]=="o" && num[8]=="o" ||
        num[0]=="o"  && num[4]=="o" && num[8]=="o" ||
        num[2]=="o"  && num[4]=="o" && num[6]=="o"){

      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return Container(
              child: AlertDialog(
                title: const Center(
                  child: Text(
                    "player 0 win",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black,),
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("ok")),
                ],
              ),
            );
          });
      display="";
      one=true;
      two=true;
      three=true;
      four=true;
      five=true;
      six=true;
      seven=true;
      eight=true;
      nine=true;
      wony=1;
    }
    else if((num[0]!='' && num[1]!='' && num[2]!='' && num[3]!='' && num[4]!='' && num[5]!='' && num[6]!='' && num[7]!='' && num[8]!='') && wonx!=1 && wony!=1){
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return Container(
              child: AlertDialog(
                title: const Center(
                  child: Text(
                    "Game Draw",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black,),
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("ok")),
                ],
              ),
            );
          });
      display="";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 500,
                margin: const EdgeInsets.all(30),
                child: Center(child: Text(display,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red),)),
              ),
              Container(
                height: 500,
                width: 500,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: AbsorbPointer(
                              absorbing: one,
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    if(num[0]==""){
                                      num[0]="x";
                                      display="O  Turn";
                                      win();
                                      one=true;
                                      two=true;
                                      three=true;
                                      four=true;
                                      five=true;
                                      six=true;
                                      seven=true;
                                      eight=true;
                                      nine=true;
                                      if(wonx!=1){
                                        Timer(const Duration(seconds: 3),(){
                                          setState(() {});
                                          if(turn<4){
                                            while(true){
                                              int random = Random().nextInt(9);
                                              if(num[random]==""){
                                                num[random]="o";
                                                display="X  Turn";
                                                one=false;
                                                two=false;
                                                three=false;
                                                four=false;
                                                five=false;
                                                six=false;
                                                seven=false;
                                                eight=false;
                                                nine=false;
                                                win();
                                                turn++;
                                                break;
                                              }
                                            }
                                          }
                                        });
                                      }
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(left: BorderSide(color: Colors.white),
                                      top: BorderSide(color: Colors.white),
                                      right: BorderSide(color: Colors.black,width: 1),
                                      bottom: BorderSide(color: Colors.black,width: 1),
                                    ),
                                  ),
                                  child: Center(child: Text(num[0],style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: AbsorbPointer(
                              absorbing: two,
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    if(num[1]==""){
                                      num[1]="x";
                                      display="O  Turn";
                                      win();
                                      one=true;
                                      two=true;
                                      three=true;
                                      four=true;
                                      five=true;
                                      six=true;
                                      seven=true;
                                      eight=true;
                                      nine=true;
                                      if(wonx!=1){
                                        Timer(const Duration(seconds: 3),(){
                                          setState(() {});
                                          if(turn<4){
                                            while(true){
                                              int random = Random().nextInt(9);
                                              if(num[random]==""){
                                                num[random]="o";
                                                display="X  Turn";
                                                one=false;
                                                two=false;
                                                three=false;
                                                four=false;
                                                five=false;
                                                six=false;
                                                seven=false;
                                                eight=false;
                                                nine=false;
                                                win();
                                                turn++;
                                                break;
                                              }
                                            }
                                          }
                                        });
                                      }
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(left: BorderSide(color: Colors.black,width: 1),
                                      top: BorderSide(color: Colors.white),
                                      right: BorderSide(color: Colors.black,width: 1),
                                      bottom: BorderSide(color: Colors.black,width: 1),
                                    ),
                                  ),
                                  child: Center(child: Text(num[1],style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: AbsorbPointer(
                              absorbing: three,
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    if(num[2]==""){
                                      num[2]="x";
                                      display="O  Turn";
                                      win();
                                      one=true;
                                      two=true;
                                      three=true;
                                      four=true;
                                      five=true;
                                      six=true;
                                      seven=true;
                                      eight=true;
                                      nine=true;
                                      if(wonx!=1){
                                        Timer(const Duration(seconds: 3),(){
                                          setState(() {});
                                          if(turn<4){
                                            while(true){
                                              int random = Random().nextInt(9);
                                              if(num[random]==""){
                                                num[random]="o";
                                                display="X  Turn";
                                                one=false;
                                                two=false;
                                                three=false;
                                                four=false;
                                                five=false;
                                                six=false;
                                                seven=false;
                                                eight=false;
                                                nine=false;
                                                win();
                                                turn++;
                                                break;
                                              }
                                            }
                                          }
                                        });
                                      }
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(left: BorderSide(color: Colors.black,width: 1),
                                      top: BorderSide(color: Colors.white),
                                      right: BorderSide(color: Colors.white ),
                                      bottom: BorderSide(color: Colors.black,width: 1),
                                    ),
                                  ),
                                  child: Center(child: Text(num[2],style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: AbsorbPointer(
                              absorbing: four,
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    if(num[3]==""){
                                      num[3]="x";
                                      display="O  Turn";
                                      win();
                                      one=true;
                                      two=true;
                                      three=true;
                                      four=true;
                                      five=true;
                                      six=true;
                                      seven=true;
                                      eight=true;
                                      nine=true;
                                      if(wonx!=1){
                                        Timer(const Duration(seconds: 3),(){
                                          setState(() {});
                                          if(turn<4){
                                            while(true){
                                              int random = Random().nextInt(9);
                                              if(num[random]==""){
                                                num[random]="o";
                                                display="X  Turn";
                                                one=false;
                                                two=false;
                                                three=false;
                                                four=false;
                                                five=false;
                                                six=false;
                                                seven=false;
                                                eight=false;
                                                nine=false;
                                                win();
                                                turn++;
                                                break;
                                              }
                                            }
                                          }
                                        });
                                      }
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(left: BorderSide(color: Colors.white),
                                      top: BorderSide(color: Colors.black,width: 1),
                                      right: BorderSide(color: Colors.black,width: 1),
                                      bottom: BorderSide(color: Colors.black,width: 1),
                                    ),
                                  ),
                                  child: Center(child: Text(num[3],style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: AbsorbPointer(
                              absorbing: five,
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    if(num[4]==""){
                                      num[4]="x";
                                      display="O  Turn";
                                      win();
                                      one=true;
                                      two=true;
                                      three=true;
                                      four=true;
                                      five=true;
                                      six=true;
                                      seven=true;
                                      eight=true;
                                      nine=true;
                                      if(wonx!=1){
                                        Timer(const Duration(seconds: 3),(){
                                          setState(() {});
                                          if(turn<4){
                                            while(true){
                                              int random = Random().nextInt(9);
                                              if(num[random]==""){
                                                num[random]="o";
                                                display="X  Turn";
                                                one=false;
                                                two=false;
                                                three=false;
                                                four=false;
                                                five=false;
                                                six=false;
                                                seven=false;
                                                eight=false;
                                                nine=false;
                                                win();
                                                turn++;
                                                break;
                                              }
                                            }
                                          }
                                        });
                                      }
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(left: BorderSide(color: Colors.black,width: 1),
                                      top: BorderSide(color: Colors.black,width: 1),
                                      right: BorderSide(color: Colors.black,width: 1),
                                      bottom: BorderSide(color: Colors.black,width: 1),
                                    ),
                                  ),
                                  child: Center(child: Text(num[4],style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: AbsorbPointer(
                              absorbing: six,
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    if(num[5]==""){
                                      num[5]="x";
                                      display="O  Turn";
                                      win();
                                      one=true;
                                      two=true;
                                      three=true;
                                      four=true;
                                      five=true;
                                      six=true;
                                      seven=true;
                                      eight=true;
                                      nine=true;
                                      if(wonx!=1){
                                        Timer(const Duration(seconds: 3),(){
                                          setState(() {});
                                          if(turn<4){
                                            while(true){
                                              int random = Random().nextInt(9);
                                              if(num[random]==""){
                                                num[random]="o";
                                                display="X  Turn";
                                                one=false;
                                                two=false;
                                                three=false;
                                                four=false;
                                                five=false;
                                                six=false;
                                                seven=false;
                                                eight=false;
                                                nine=false;
                                                win();
                                                turn++;
                                                break;
                                              }
                                            }
                                          }
                                        });
                                      }
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(left: BorderSide(color: Colors.black,width: 1),
                                      top: BorderSide(color: Colors.black,width: 1),
                                      right: BorderSide(color: Colors.white),
                                      bottom: BorderSide(color: Colors.black,width: 1),
                                    ),
                                  ),
                                  child: Center(child: Text(num[5],style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: AbsorbPointer(
                              absorbing: seven,
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    if(num[6]==""){
                                      num[6]="x";
                                      display="O  Turn";
                                      win();
                                      one=true;
                                      two=true;
                                      three=true;
                                      four=true;
                                      five=true;
                                      six=true;
                                      seven=true;
                                      eight=true;
                                      nine=true;
                                      if(wonx!=1){
                                        Timer(const Duration(seconds: 3),(){
                                          setState(() {});
                                          if(turn<4){
                                            while(true){
                                              int random = Random().nextInt(9);
                                              if(num[random]==""){
                                                num[random]="o";
                                                display="X  Turn";
                                                one=false;
                                                two=false;
                                                three=false;
                                                four=false;
                                                five=false;
                                                six=false;
                                                seven=false;
                                                eight=false;
                                                nine=false;
                                                win();
                                                turn++;
                                                break;
                                              }
                                            }
                                          }
                                        });
                                      }
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(left: BorderSide(color: Colors.white,),
                                      top: BorderSide(color: Colors.black,width: 1),
                                      right: BorderSide(color: Colors.black,width: 1),
                                      bottom: BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  child: Center(child: Text(num[6],style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: AbsorbPointer(
                              absorbing: eight,
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    if(num[7]==""){
                                      num[7]="x";
                                      display="O  Turn";
                                      win();
                                      one=true;
                                      two=true;
                                      three=true;
                                      four=true;
                                      five=true;
                                      six=true;
                                      seven=true;
                                      eight=true;
                                      nine=true;
                                      if(wonx!=1){
                                        Timer(const Duration(seconds: 3),(){
                                          setState(() {});
                                          if(turn<4){
                                            while(true){
                                              int random = Random().nextInt(9);
                                              if(num[random]==""){
                                                num[random]="o";
                                                display="X  Turn";
                                                one=false;
                                                two=false;
                                                three=false;
                                                four=false;
                                                five=false;
                                                six=false;
                                                seven=false;
                                                eight=false;
                                                nine=false;
                                                win();
                                                turn++;
                                                break;
                                              }
                                            }
                                          }
                                        });
                                      }
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(left: BorderSide(color: Colors.black,width: 1),
                                      top: BorderSide(color: Colors.black,width: 1),
                                      right: BorderSide(color: Colors.black,width: 1),
                                      bottom: BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  child: Center(child: Text(num[7],style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: AbsorbPointer(
                              absorbing: nine,
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    if(num[8]==""){
                                      num[8]="x";
                                      display="O  Turn";
                                      win();
                                      one=true;
                                      two=true;
                                      three=true;
                                      four=true;
                                      five=true;
                                      six=true;
                                      seven=true;
                                      eight=true;
                                      nine=true;
                                      if(wonx!=1){
                                        Timer(const Duration(seconds: 3),(){
                                          setState(() {});
                                          if(turn<4){
                                            while(true){
                                              int random = Random().nextInt(9);
                                              if(num[random]==""){
                                                num[random]="o";
                                                display="X  Turn";
                                                one=false;
                                                two=false;
                                                three=false;
                                                four=false;
                                                five=false;
                                                six=false;
                                                seven=false;
                                                eight=false;
                                                nine=false;
                                                win();
                                                turn++;
                                                break;
                                              }
                                            }
                                          }
                                        });
                                      }
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(left: BorderSide(color: Colors.black,width: 1),
                                      top: BorderSide(color: Colors.black,width: 1),
                                      right: BorderSide(color: Colors.white),
                                      bottom: BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  child: Center(child: Text(num[8],style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),  )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        num = ['','','','','','','','',''];
                        one=false;
                        two=false;
                        three=false;
                        four=false;
                        five=false;
                        six=false;
                        seven=false;
                        eight=false;
                        nine=false;
                        wonx=0;
                        wony=0;
                        turn=0;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: const Center(child: Text("Reset",style: TextStyle(fontSize: 15,color: Colors.white),)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
