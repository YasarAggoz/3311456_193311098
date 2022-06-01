import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class grafik extends StatefulWidget {
  const grafik({Key? key}) : super(key: key);

  @override
  State<grafik> createState() => _grafikState();
}

class _grafikState extends State<grafik> {

  @override
  Widget build(BuildContext context) {

     return Scaffold(
        appBar: AppBar(title: const Text("Grafik Sayfası"),) ,
    body: SafeArea(
    child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30 ),
    child: Column(
    children: [
      SfCartesianChart(
        title: ChartTitle(text: 'Yıllık parfüm kullanım Oranı'),
        primaryXAxis: NumericAxis(
            majorGridLines: MajorGridLines(width: 1)
        ),
        primaryYAxis: NumericAxis(
          labelFormat: '{value}%',
        ),
        series: getDefaultLineSeries(),
      ),
      Text("Kırmızı Bayan", style: TextStyle(
        color: Colors.red,
        fontSize: 13,

      ),
      ),
      Text("Mavi Eekek", style: TextStyle(
        color: Colors.blue,
        fontSize: 13,

      ),
      ),

    ]
    )
    )
    )
     );
  }
}
List getDefaultLineSeries() {
  final List<_Verilerim> verilerim = <_Verilerim>[
    _Verilerim(2016, 5, 4),
    _Verilerim(2017, 8, 9),
    _Verilerim(2018, 12, 11),
    _Verilerim(2019, 15, 14),
    _Verilerim(2020, 19, 15),
    _Verilerim(2021, 21, 19),
    _Verilerim(2022, 25, 24)
  ];
  return <LineSeries<_Verilerim, num>>[
    LineSeries<_Verilerim, num>(
      color: Colors.red,
      animationDuration: 2500,
      enableTooltip: true,
      dataSource: verilerim,
      xValueMapper: (_Verilerim sales, _) => sales.x,
      yValueMapper: (_Verilerim sales, _) => sales.y,
      width: 2,
      name: 'Erkek Parfüm',
      markerSettings: MarkerSettings(isVisible: true),
    ),
    LineSeries<_Verilerim, num>(
      color: Colors.blue,
      animationDuration: 2500,
      enableTooltip: true,
      dataSource: verilerim,
      width: 2,
      xValueMapper: (_Verilerim sales, _) => sales.x,
      yValueMapper: (_Verilerim sales, _) => sales.y2,
      name: 'Bayan Parfüm',
      markerSettings: MarkerSettings(isVisible: true),
    ),
  ];
}
class _Verilerim{
  late final double x;
  late final double y;
  late final double y2;

  _Verilerim(this.x, this.y, this.y2);

}