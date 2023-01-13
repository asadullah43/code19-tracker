import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStateScreen extends StatefulWidget {
  const WorldStateScreen({Key? key}) : super(key: key);

  @override
  State<WorldStateScreen> createState() => _WorldStateScreenState();
}

class _WorldStateScreenState extends State<WorldStateScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            PieChart(
              // ignore: prefer_const_literals_to_create_immutables
              dataMap: {
                "Total": 50,
                "Death": 20,
                "Recoverd": 10,
              },
              animationDuration: const Duration(milliseconds: 1200),
              chartRadius: MediaQuery.of(context).size.width / 3.2,
              legendOptions: const LegendOptions(
                legendPosition: LegendPosition.left,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartType: ChartType.ring,
              colorList: const [
                Color(0xff4285f4),
                Color(0xff1aa260),
                Color(0xffde5246),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * .06),
              child: Card(
                child: Column(
                  children: [
                    ReusabaleRow(
                      title: "Active",
                      value: "300",
                    ),
                    ReusabaleRow(
                      title: "Active",
                      value: "300",
                    ),
                    ReusabaleRow(
                      title: "Active",
                      value: "300",
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green[600],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text('Track Countries'),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class ReusabaleRow extends StatelessWidget {
  String title, value;
  ReusabaleRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
