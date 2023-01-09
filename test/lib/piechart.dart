import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'homepage.dart';
class skinResultPage extends StatefulWidget {
  const skinResultPage({required this.dry, required this.oily, required this.sensitive});
  final dry;
  final oily;
  final sensitive;

  @override
  _skinResultPageState createState() => _skinResultPageState(dry: dry, oily: oily, sensitive: sensitive);
}

class _skinResultPageState extends State<skinResultPage> {
  _skinResultPageState({required this.dry, required this.oily, required this.sensitive});
  var dry;
  var oily;
  var sensitive;
  var _width;
  String problem = '';
  List<ChartData> customerData = [];

  @override
  void initState() {
    if(dry > oily && dry > sensitive){problem = '您的肌膚屬於乾燥肌';}
    else if(oily > dry && oily > sensitive){problem = '您的肌膚屬於油性肌';}
    else{problem = '您的肌膚屬於敏感肌';}


    super.initState();
    customerData.add(ChartData('Dry(乾燥肌)', dry, rate: dry, color: Colors.yellowAccent));
    customerData.add(ChartData('Oily(油性肌)', oily, rate: oily, color: Colors.amber));
    customerData.add(ChartData('Sensitive(敏感肌)', sensitive, rate: sensitive, color: Colors.orange));
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('檢測結果'), backgroundColor: Colors.blueGrey,),
        body: ListView(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                        '\n\n檢測結果顯示:\n',
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                        textAlign: TextAlign.center
                    ),
                    Text(
                        problem,
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                        textAlign: TextAlign.center
                    ),
                    Container(
                      height: 350,
                      child: SfCircularChart(
                        title: ChartTitle(text: '肌膚檢測結果'),
                        // 显示图例，position显示所在位置
                        legend: Legend(isVisible: true, position: LegendPosition.bottom),
                        series: <CircularSeries>[
                          PieSeries<ChartData, String>(
                            dataSource: customerData,
                            // 数据块颜色
                            pointColorMapper: (ChartData data, _) => data.color,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            // 显示数据
                            dataLabelMapper: (ChartData data, _) =>
                            (data.rate * 100).toStringAsFixed(1) + '%',
                            // 显示数据标签
                            dataLabelSettings: DataLabelSettings(isVisible: true),
                          ),
                        ],
                      ),
                    )
                  ]
              ),
              const Text(
                  '\n',
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
                        backgroundColor: Colors.blueGrey,
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
                        backgroundColor: Colors.blueGrey,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Imeiskin')));},
                      //padding: const EdgeInsets.all(20),
                      child: const Text('        回主頁        ',
                          style: TextStyle(color: Colors.white,
                              fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ]
        )
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, {required this.color, required this.rate});

  final String x;
  final double y;
  final double rate;
  final Color color;
}