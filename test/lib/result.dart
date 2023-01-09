// ignore_for_file: empty_constructor_bodies
import 'homepage.dart';
import 'package:flutter/material.dart';
import 'nail.dart';
import 'main.dart';

class result extends StatefulWidget {
  const result({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<result> createState() => resultState(title: title);
}

class resultState extends State<result> {
  resultState({required String this.title});

  String title = 'title';

  @override
  Widget build(BuildContext context) {

    var _width;
    var result;
    String problem = '';


    if(title == 'normalnail')
    {
        result = Image.asset('assets/image/nail_result_L_V2.png');
        problem = '指甲健康!\n請繼續保持~';
    }
    else if(title == 'naildystrophy')
    {
        result = Image.asset('assets/image/nail_result_H_V2.png');
        problem = '請注意!\n您的指甲為粗面指甲(naildystrophy),\n建議您就醫做精確檢查!';
    }
    else if(title == 'melanonychia')
    {
        result = Image.asset('assets/image/nail_result_H_V2.png');
        problem = '請注意!\n您的指甲可能屬於黑甲症(melanonychia),\n建議您就醫做精確檢查!';
    }
    else if(title == 'atypical' || title == 'etc' || title == 'nodule')
    {
      result = Image.asset('assets/image/nail_result_H_V2.png');
      problem = '請注意!\n您的指甲為非典型(atypical),\n建議您就醫做精確檢查!';
    }
    else if(title == 'onychomycosis')
    {
      result = Image.asset('assets/image/nail_result_H_V2.png');
      problem = '請注意!\n您的指甲可能是甲癬\n(onychomycosis),俗稱灰指甲。\n建議您就醫做精確檢查!';
    }
    else if(title == 'onycholysis')
    {
      result = Image.asset('assets/image/nail_result_H_V2.png');
      problem = '請注意!\n您的指甲可能有甲床剝離(onycholysis),\n建議您就醫做精確檢查!';
    }
    else if(title == 'Mild')
    {
      result = Image.asset('assets/image/acne_low.png');
      problem = '恭喜!\n您的檢測結果很健康,\n不須擔心, 繼續保持~';
    }
    else if(title == 'Moderate')
    {
      result = Image.asset('assets/image/acne_middle.png');
      problem = '您的檢測結果為一般~\n保持良好作息可以使膚況更加提升喔!';
    }
    else if(title == 'Severe')
    {
      result = Image.asset('assets/image/acne_m_high.png');
      problem = '您的痘痘檢測結果有一點嚴重,\n請注意生活作息及衛生習館以利改善痘痘狀況。';
    }
    else if(title == 'Very-Severe')
    {
      result = Image.asset('assets/image/acne_high.png');
      problem = '您的痘痘檢測結果為嚴重程度,\n請就醫做更精確的檢測!';
    }

    _width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/bg7.jpg"),
                  fit: BoxFit.cover
              )
          ),
          child: ListView(
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                          '\n您的檢測結果如下:\n',
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                          textAlign: TextAlign.center
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),


                          child: result,
                        ),
                      ),
                    ]
                ),
                const Text(
                    '\n檢測結果顯示:\n',
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    textAlign: TextAlign.center
                ),
                Text(
                    problem,
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    textAlign: TextAlign.center
                ),
                const Text(
                    '\n\n',
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    textAlign: TextAlign.center
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor:  Color(0xffb89a79),
                        ),
                        onPressed: () {Navigator.pop(context);},
                        //padding: const EdgeInsets.all(20),
                        child: const Text(
                            '     重新檢測     ',
                            style: TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    ),
                    const Text(
                      '   ',
                      style: TextStyle(fontSize: 25.0, color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor:  Color(0xffb89a79),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Iamskin')));},
                        //padding: const EdgeInsets.all(20),
                        child: const Text('        回主頁        ',
                            style: TextStyle(color: Colors.white,
                                fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ]
          ),
        )
    );
  }
}
