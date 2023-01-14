import 'package:code19_tracker/View/world_state.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  String name;
  String image;
  int totalCases,
      totalDeaths,
      totalRecoverd,
      active,
      critical,
      todayRecovered,
      test;
  DetailsScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecoverd,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .067),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .06),
                        ReusabaleRow(
                            title: 'Cases',
                            value: widget.totalCases.toString()),
                        ReusabaleRow(
                            title: 'Deaths',
                            value: widget.totalDeaths.toString()),
                        ReusabaleRow(
                            title: 'Recovered',
                            value: widget.totalRecoverd.toString()),
                        ReusabaleRow(
                            title: 'Active', value: widget.active.toString()),
                        ReusabaleRow(
                            title: 'Critical',
                            value: widget.critical.toString()),
                        ReusabaleRow(
                            title: 'Tests', value: widget.test.toString()),
                        ReusabaleRow(
                            title: 'Today Recovered',
                            value: widget.todayRecovered.toString()),
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.image.toString()),
                ),
              ],
            )
          ]),
    );
  }
}
