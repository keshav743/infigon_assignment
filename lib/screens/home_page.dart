import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:infugion_ui/screens/change_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //VARIABLES
  List<BarChartGroupData> _chartData = [];
  List<double> result = [];
  List<String> labels = [];

  //HELPER FUNCTIONS
  int findMaxIndex(List<double> result) {
    var max = result[0];
    var maxIndex = 0;
    for (var i = 0; i < result.length; i++) {
      if (result[i] > max) {
        maxIndex = i;
        max = result[i];
      }
    }
    print(maxIndex);
    return maxIndex;
  }

  int findMinIndex(List<double> result) {
    var min = result[0];
    var minIndex = 0;
    for (var i = 0; i < result.length; i++) {
      if (result[i] < min) {
        minIndex = i;
        min = result[i];
      }
    }
    print(minIndex);
    return minIndex;
  }

  BarChartGroupData createData(int xparam, double yparam) {
    return BarChartGroupData(
      x: xparam,
      barRods: [
        BarChartRodData(
          gradientTo: Offset(0.05, 0),
          gradientFrom: Offset(0.05, 1),
          gradientColorStops: [0.0, 0.05, 1],
          y: yparam,
          width: 30,
          colors: [Colors.blue, Colors.blue.shade200],
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ],
    );
  }

  //INIT STATE
  @override
  void initState() {
    super.initState();
    result = [50, 60, 70, 80, 90];
    labels = [
      'English',
      'Computer Science',
      'Science',
      'Genral Knowledge',
      'Social Science'
    ];
    _chartData = [
      createData(1, result[0]),
      createData(2, result[1]),
      createData(3, result[2]),
      createData(4, result[3]),
      createData(5, result[4]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: double.infinity,
                ),
                topContainer(),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.21,
                  left: 28,
                  right: 28,
                  child: barChart(),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            detailCard('Strongest', labels[findMaxIndex(result)]),
            SizedBox(
              height: 10,
            ),
            detailCard('Weakest', labels[findMinIndex(result)]),
            SizedBox(
              height: 25,
            ),
            viewMore(),
          ],
        ),
      ),
    );
  }

  //WIDGET BUILDS
  Widget barChart() {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: MediaQuery.of(context).orientation == Orientation.portrait
                ? EdgeInsets.symmetric(horizontal: 28, vertical: 20)
                : EdgeInsets.symmetric(horizontal: 28, vertical: 5),
            alignment: Alignment.topLeft,
            child: Text(
              'Results',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12, 10, 30, 5),
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: BarChart(
              BarChartData(
                maxY: 100,
                minY: 0,
                titlesData: FlTitlesData(
                  leftTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (value) => const TextStyle(
                            color: Color(0xff7589a2),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                      margin: 20,
                      reservedSize: 14,
                      getTitles: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? (value) {
                              if (value == 0) {
                                return '0';
                              } else if (value == 10) {
                                return '10';
                              } else if (value == 20) {
                                return '20';
                              } else if (value == 30) {
                                return '30';
                              } else if (value == 40) {
                                return '40';
                              } else if (value == 50) {
                                return '50';
                              } else if (value == 60) {
                                return '60';
                              } else if (value == 70) {
                                return '70';
                              } else if (value == 80) {
                                return '80';
                              } else if (value == 90) {
                                return '90';
                              } else if (value == 100) {
                                return '100';
                              } else {
                                return '';
                              }
                            }
                          : (value) {
                              if (value == 0) {
                                return '0';
                              } else if (value == 20) {
                                return '20';
                              } else if (value == 40) {
                                return '40';
                              } else if (value == 60) {
                                return '60';
                              } else if (value == 80) {
                                return '80';
                              } else if (value == 100) {
                                return '100';
                              } else {
                                return '';
                              }
                            }),
                  bottomTitles: SideTitles(
                    getTextStyles: (value) => const TextStyle(
                      color: Color(0xff7589a2),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    showTitles: true,
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 1:
                          return 'Eng';
                        case 2:
                          return 'CS';
                        case 3:
                          return 'Sci';
                        case 4:
                          return 'GK';
                        case 5:
                          return 'So.Sci';
                        default:
                          return 'Unknown';
                      }
                    },
                  ),
                ),
                borderData: FlBorderData(
                  border: Border(
                    top: BorderSide.none,
                    right: BorderSide.none,
                    left: BorderSide.none,
                    bottom: BorderSide.none,
                  ),
                ),
                barGroups: _chartData,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget viewMore() {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        child: InkWell(
          onTap: () async {
            result = await Navigator.of(context).pushNamed(ChangePage.routeName)
                as List<double>;
            print(result);
            setState(() {
              _chartData = [
                createData(1, result[0]),
                createData(2, result[1]),
                createData(3, result[2]),
                createData(4, result[3]),
                createData(5, result[4]),
              ];
            });
          },
          child: Text(
            'View More',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget detailCard(String strongOrWeak, String subject) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: strongOrWeak == 'Strongest'
            ? Colors.greenAccent[100]
            : Colors.redAccent[100],
        borderRadius: BorderRadius.all(
          Radius.circular(40.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              strongOrWeak,
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Text(
              subject,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget topContainer() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.2),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(100.0),
          top: Radius.circular(5.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 26.0,
            ),
          ),
          Text(
            'Subject Analyser',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}

//Extra Container
// : Container(
//     height: 200,
//     padding: EdgeInsets.symmetric(
//       horizontal: 10.0,
//       vertical: 10.0,
//     ),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.all(
//         Radius.circular(10.0),
//       ),
//     ),
//     alignment: Alignment.center,
//     child: Text(
//       'Rotate your Phone To View Bar Graph',
//       style: TextStyle(
//         color: Colors.black,
//       ),
//     ),
//   ),
