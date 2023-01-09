import 'package:flutter/material.dart';
import 'skin.dart';
import 'nail.dart';
import 'acne.dart';
import 'palette.dart';
import 'dart:async';
import 'customShape.dart';
const homePage = 'Home Page';
const skinPage = 'Skin Page';
const nailPage = 'Nail Page';
const acnePage = 'Acne Page';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool selected = false; int count = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xfffce7d2),
        /*appBar: AppBar(
          toolbarHeight: 130,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          bottomOpacity: 0.0,
          flexibleSpace: ClipPath(
            clipper: Customshape(),
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              color: Color(0xfff8b195),
              child: Text('\n\n\n   Welcome to ImeiSkin.', style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
          ),
          /*bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(child: Text('首頁')),
              Tab(child: Text('關於我們')),
              Tab(child: Text('服務項目')),
            ],
          ),*/
        ),*/
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/bg2.jpg"),
                  fit: BoxFit.cover
              )
          ),
          child: TabBarView(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text('\n\n\n', textAlign: TextAlign.left, style: TextStyle(fontSize: 15, color: Colors.white),),
                    const Text('Welcome to ImeiSkin.', textAlign: TextAlign.left, style: TextStyle(fontSize: 25, color: Color(0xffa16527)),),
                    const Text('\n', textAlign: TextAlign.left, style: TextStyle(fontSize: 10, color: Colors.white),),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = !selected;
                        });
                      },
                      child: Container(
                        alignment: Alignment(-0.5, -2),
                        child: AnimatedContainer(
                            width: selected ? 360.0 : 200.0,
                            height: selected ? 170.0 : 170.0,
                            decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(10),
                              color: selected ? Color(0xffd19477):Color(0xffc8aca3),
                            ),
                            alignment:
                            selected ? AlignmentDirectional(-0.6, 0) : Alignment.center,
                            duration: const Duration(seconds: 2),
                            curve: Curves.fastOutSlowIn,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: selected ? Row(
                                  children: [
                                    Text('  '),
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/image/acne.jpg',width: 175, )
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          backgroundColor: Color(0xfffef5eb),
                                        ),
                                        onPressed: () {Navigator.of(context).pushNamed(acnePage);},
                                        //padding: const EdgeInsets.all(20),
                                        child: const Text(' 開始痘痘檢測 \n Acne testing ', style: TextStyle(color: Color(0xffd19477), fontSize: 15)),
                                      ),
                                    ),
                                  ],
                                ):Image.asset(
                                  'assets/image/acne.jpg',width: 175, )
                            )
                        ),
                      ),
                    ),
                    Text('\n', style: TextStyle(fontSize: 10, color: Colors.white),),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = !selected;
                        });
                      },
                      child: Container(
                        alignment: Alignment(1.5, -2),
                        child: AnimatedContainer(
                            width: selected ? 360.0 : 200.0,
                            height: selected ? 170.0 : 170.0,
                            decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(10),
                              color: selected ? Color(0xffffcba3):Color(0xffe7c1b2),
                            ),
                            alignment:
                            selected ? Alignment.centerRight : Alignment.center,
                            duration: const Duration(seconds: 2),
                            curve: Curves.fastOutSlowIn,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: selected ? Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          backgroundColor: Color(0xfffef5eb),
                                        ),
                                        onPressed: () {Navigator.of(context).pushNamed(nailPage);},
                                        //padding: const EdgeInsets.all(20),
                                        child: const Text(' 開始指甲檢測 \n Nail testing ', style: TextStyle(color: Color(0xffd19477), fontSize: 15)),
                                      ),
                                    ),
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/image/nail.jpg',width: 175, )
                                    ),
                                  ],
                                ):Image.asset(
                                  'assets/image/nail.jpg',width: 175, alignment: Alignment.centerRight,)
                            )
                        ),
                      ),
                    ),
                    Text('\n', style: TextStyle(fontSize: 10, color: Colors.white),),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = !selected;
                        });
                      },
                      child: Container(
                        alignment: Alignment(-0.5, -2),
                        child: AnimatedContainer(
                            width: selected ? 360.0 : 200.0,
                            height: selected ? 170.0 : 170.0,
                            decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(10),
                              color: selected ? Color(0xffecbcb4):Color(0xffd1a3a4),
                            ),
                            alignment:
                            selected ? AlignmentDirectional(-0.6, 0) : Alignment.center,
                            duration: const Duration(seconds: 2),
                            curve: Curves.fastOutSlowIn,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: selected ? Row(
                                  children: [
                                    Text('  '),
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/image/skin.jpg',width: 175, )
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          backgroundColor: Color(0xfffef5eb),
                                        ),
                                        onPressed: () {Navigator.of(context).pushNamed(skinPage);},
                                        //padding: const EdgeInsets.all(20),
                                        child: const Text(' 開始膚質檢測 \n Skin testing ', style: TextStyle(color: Color(0xffd19477), fontSize: 15)),
                                      ),
                                    ),
                                  ],
                                ):Image.asset(
                                  'assets/image/skin.jpg',width: 175, )
                            )
                        ),
                      ),
                    ),


                  ]
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      '\n\n\nLine官方帳號',
                      style: TextStyle(fontSize: 32.0, color: Colors.black),
                    ),
                    const Text(
                      '掃描QR code加入Line好友\n',
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    Column(
                      children: [
                        Image.asset('assets/image/qrcode.jpg',
                          height: 200,)
                      ],
                    ),
                    const Text(
                      '\n\n聯絡資訊',
                      style: TextStyle(fontSize: 32.0, color: Colors.black),
                    ),
                    const Text(
                      'Email: uscciamskin@gmail.com',
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                  ]
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("\n\n\n關於我們\n", style: TextStyle(fontSize: 25.0, color: Colors.black))
                  ]
              ),
            ],
          ),
        )
      ),
    );
  }
}

final routes = <String, WidgetBuilder>{
  homePage: (context) => const MyHomePage(title: "ImeiSkin"),
  skinPage: (context) => const skin(title: "ImeiSkin"),
  nailPage: (context) => const nail(title: "ImeiSkin"),
  acnePage: (context) => const acne(title: "ImeiSkin"),
};
