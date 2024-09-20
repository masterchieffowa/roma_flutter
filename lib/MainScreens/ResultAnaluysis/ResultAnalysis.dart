import 'package:flutter/material.dart';
import 'package:oneminuteclinic/Shared/Components/defaultTextFeild.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

class ResultAnalysis extends StatefulWidget {
  const ResultAnalysis({Key? key}) : super(key: key);

  @override
  State<ResultAnalysis> createState() => _ResultAnalysisState();
}

// class SalesData {
//   final String product;
//   final int amount;
//
//   SalesData(this.product, this.amount);
// }

class MyRadialGauge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          minimum: 0,
          maximum: 100,
          axisLineStyle: AxisLineStyle(
              thickness: 0.1,
              cornerStyle: CornerStyle.bothCurve,
              color: Colors.grey[700],
              thicknessUnit: GaugeSizeUnit.factor),
          tickOffset: 0.2,
          ticksPosition: ElementsPosition.outside,
          labelsPosition: ElementsPosition.outside,
          minorTickStyle: const MinorTickStyle(
            lengthUnit: GaugeSizeUnit.factor,
            length: 0.04,
            thickness: 1,
            color: Colors.white,
          ),
          majorTickStyle: const MajorTickStyle(
            lengthUnit: GaugeSizeUnit.factor,
            length: 0.1,
            thickness: 1.5,
            color: Colors.white,
          ),
          axisLabelStyle: const GaugeTextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
          ranges: [
            GaugeRange(
              startValue: 0,
              endValue: 30,
              color: Colors.red,
              startWidth: 0.1,
              endWidth: 0.1,
            ),
            GaugeRange(
              startValue: 30,
              endValue: 70,
              color: Colors.yellow,
              startWidth: 0.1,
              endWidth: 0.1,
            ),
            GaugeRange(
              startValue: 70,
              endValue: 100,
              color: Colors.green,
              startWidth: 0.1,
              endWidth: 0.1,
            ),
          ],
          pointers: const [
            NeedlePointer(
              value: 60,
              needleColor: Colors.white,
              needleStartWidth: 1,
              needleEndWidth: 3,
              lengthUnit: GaugeSizeUnit.factor,
              needleLength: 0.8,
              enableAnimation: true,
              animationType: AnimationType.ease,
              knobStyle: KnobStyle(
                knobRadius: 0.1,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
      enableLoadingAnimation: true,
      animationDuration: 2000,
    );
  }
}

Widget RCircleChart({
  animation = true,
  // animationDuration: 3000,
  required lable,
  required Axes,
}) =>
    SfRadialGauge(
      enableLoadingAnimation: animation,
      // animationDuration: animationDuration,
      title: GaugeTitle(
        text: lable,
        textStyle: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.black38,
        ),
      ),
      axes: Axes,
    );

Widget RLineChart({
  animation = true,
  // animationDuration: 3000,,
  min = 0.0,
  max = 100.0,
  value = 50.0,
  color = Colors.green,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: SfLinearGauge(
        minimum: min,
        maximum: max,
        showTicks: true,
        showLabels: true,
        barPointers: <LinearBarPointer>[
          LinearBarPointer(
            value: value,
            thickness: 10,
            edgeStyle: LinearEdgeStyle.bothCurve,
            color: color,
          ),
        ],
      ),
    );

Widget FullElement({
  required Widget chartSelecteed,
  required lable,
  required advice,
}) =>
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(
            //       lable,
            //       style: const TextStyle(
            //         fontSize: 20.0,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.black38,
            //       ),
            //     ),
            //     const Spacer(),
            //     chartSelecteed,
            //   ],
            // ),
            Center(
              child: Text(
                lable,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(child: chartSelecteed),
            Text(
              advice,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );

var MainValue = 75;

class _ResultAnalysisState extends State<ResultAnalysis> {
  // late List<charts.Series> seriesList;
  //
  // // Future<List<charts.Series<dynamic, String>>> _createSampleData() async {
  // //   final data = [
  // //     const Tab(text: 'Work', height: 35.8,),
  // //     const Tab(text: 'Bork', height: 40,),
  // //     const Tab(text: 'Aork', height: 30.0,),
  // //     const Tab(text: 'Cork', height: 45,),
  // //     const Tab(text: 'Rork', height: 30,),
  // //
  // //   ];
  //
  // //   return [
  // //     charts.Series<Task, String>(
  // //       id: 'Task',
  // //       domainFn: (Tab task, _) => task.task,
  // //       measureFn: (Task task, _) => task.taskValue,
  // //       colorFn: (Task task, _) => charts.ColorUtil.fromDartColor(task.color),
  // //       data: data,
  // //     )
  // //   ];
  // // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   seriesList = _createSampleData();
  // }

  // final List<charts.Series> seriesList = [
  //   charts.Series(
  //     id: 'Sales',
  //     data: [
  //       SalesData('Product A', 100),
  //       SalesData('Product B', 200),
  //       SalesData('Product C', 300),
  //     ],
  //     domainFn: (sales, _) => sales.product,
  //     measureFn: (sales, _) => sales.amount,
  //     colorFn: (sales, _) => charts.ColorUtil.fromDartColor(Colors.blue),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: const Color(0xffF7F6F8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Vitamins',
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Segoe UI',
                  fontSize: 25,
                  // make the text Semibold
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FullElement(
                chartSelecteed: SizedBox(
                  width: 200,
                  height: 200,
                  child: RCircleChart(
                    lable: "",
                    Axes: <RadialAxis>[
                      RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
                        GaugeRange(
                          // endWidth: 20,
                          // startWidth: 25,
                          startValue: 0.0,
                          endValue: 21.5,
                          color: Colors.red,
                        ),
                        GaugeRange(
                          // startWidth: 20,
                          // endWidth: 15,
                          startValue: 21.5,
                          endValue: 43,
                          color: Colors.yellow,
                        ),
                        GaugeRange(
                          // endWidth: 10,
                          // startWidth: 15,
                          startValue: 43,
                          endValue: 65,
                          color: Colors.blueAccent,
                        ),
                        GaugeRange(
                          startValue: 65,
                          endValue: 86,
                          color: Colors.green,
                        ),
                        GaugeRange(
                          // startWidth: 10,
                          // endWidth: 15,
                          startValue: 86,
                          endValue: 107,
                          color: Colors.blueAccent,
                        ),
                        GaugeRange(
                          // startWidth: 15,
                          // endWidth: 20,
                          startValue: 107,
                          endValue: 129,
                          color: Colors.yellow,
                        ),
                        GaugeRange(
                          // startWidth: 20,
                          // endWidth: 25,
                          startValue: 129,
                          endValue: 150,
                          color: Colors.red,
                        ),
                      ], pointers: const <GaugePointer>[
                        NeedlePointer(
                            value: 70,
                            needleColor: Colors.teal,
                            enableAnimation: true,
                            animationType: AnimationType.ease,
                            animationDuration: 1200,
                            needleStartWidth: 1,
                            needleEndWidth: 5,
                            needleLength: 0.8,
                            knobStyle: KnobStyle(
                              knobRadius: 0.08,
                              sizeUnit: GaugeSizeUnit.factor,
                              borderColor: Colors.white,
                              color: Colors.teal,
                              borderWidth: 0.05,
                            ),
                            tailStyle: TailStyle(
                              color: Colors.white,
                              width: 0.05,
                              lengthUnit: GaugeSizeUnit.factor,
                              length: 0.2,
                            )),
                      ], annotations: const <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Text('93%',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              )),
                          angle: 90,
                          positionFactor: 0.5,
                          axisValue: 70.0,
                        ),
                      ])
                    ],
                    animation: true,
                  ),
                ),
                lable: "Vitamin A",
                advice:
                    "Your rate is normal. go ahead and you will be in a good health."),
            FullElement(
                chartSelecteed: SizedBox(
                  width: 200,
                  height: 200,
                  child: RCircleChart(
                    lable: "",
                    Axes: <RadialAxis>[
                      RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
                        GaugeRange(
                          // endWidth: 20,
                          // startWidth: 25,
                          startValue: 0.0,
                          endValue: 21.5,
                          color: Colors.red,
                        ),
                        GaugeRange(
                          // startWidth: 20,
                          // endWidth: 15,
                          startValue: 21.5,
                          endValue: 43,
                          color: Colors.yellow,
                        ),
                        GaugeRange(
                          // endWidth: 10,
                          // startWidth: 15,
                          startValue: 43,
                          endValue: 65,
                          color: Colors.blueAccent,
                        ),
                        GaugeRange(
                          startValue: 65,
                          endValue: 86,
                          color: Colors.green,
                        ),
                        GaugeRange(
                          // startWidth: 10,
                          // endWidth: 15,
                          startValue: 86,
                          endValue: 107,
                          color: Colors.blueAccent,
                        ),
                        GaugeRange(
                          // startWidth: 15,
                          // endWidth: 20,
                          startValue: 107,
                          endValue: 129,
                          color: Colors.yellow,
                        ),
                        GaugeRange(
                          // startWidth: 20,
                          // endWidth: 25,
                          startValue: 129,
                          endValue: 150,
                          color: Colors.red,
                        ),
                      ], pointers: const <GaugePointer>[
                        NeedlePointer(
                            value: 30,
                            needleColor: Colors.teal,
                            enableAnimation: true,
                            animationType: AnimationType.ease,
                            animationDuration: 1200,
                            needleStartWidth: 1,
                            needleEndWidth: 5,
                            needleLength: 0.8,
                            knobStyle: KnobStyle(
                              knobRadius: 0.08,
                              sizeUnit: GaugeSizeUnit.factor,
                              borderColor: Colors.white,
                              color: Colors.teal,
                              borderWidth: 0.05,
                            ),
                            tailStyle: TailStyle(
                              color: Colors.white,
                              width: 0.05,
                              lengthUnit: GaugeSizeUnit.factor,
                              length: 0.2,
                            )),
                      ], annotations: const <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Text('50%',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              )),
                          angle: 90,
                          positionFactor: 0.5,
                          axisValue: 70.0,
                        ),
                      ])
                    ],
                    animation: true,
                  ),
                ),
                lable: "Vitamin C",
                advice:
                    "You should take all foods and fruits tha contain vitamin C as oranges. You can Also take vitamin C as a tablet with some water."),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Trace Elements',
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Segoe UI',
                  fontSize: 25,
                  // make the text Semibold
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FullElement(
                chartSelecteed: RLineChart(),
                lable: "Calcium Ca",
                advice:
                    "Your rate is normal. go ahead and you will be in a good health."),
            FullElement(
                chartSelecteed: RLineChart(
                  value: 20.0,
                  color: Colors.red,
                ),
                lable: "Ion Fe",
                advice:
                    "Your rate is abnormal. You should eat that vigitables and fruits that have Fe as apple and papa-beans."),

            Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: RCircleChart(
                    lable: "",
                    Axes: <RadialAxis>[
                      RadialAxis(
                          minimum: 0,
                          maximum: 360,
                          canRotateLabels: false,
                          endAngle: 360,
                          startAngle: 0,
                          showAxisLine: false,
                          showFirstLabel: false,
                          showLabels: false,
                          showLastLabel: false,
                          showTicks: false,

                          ranges: <GaugeRange>[
                            GaugeRange(
                              endWidth: 15,
                              startWidth: 15,
                              startValue: 0.0,
                              endValue: 360,
                              color: Colors.grey,
                            ),
                            GaugeRange(
                              endWidth: 15,
                              startWidth: 15,
                              startValue: 0.0,
                              endValue: 270,
                              color: Colors.teal,
                            ),

                          ],
                          pointers: const [
                            // RangePointer(
                            //   value: 292,
                            //   width: 15,
                            // )
                          ],
                          annotations: const <GaugeAnnotation>[
                            GaugeAnnotation(
                              horizontalAlignment: GaugeAlignment.center,
                              verticalAlignment: GaugeAlignment.center,
                              widget: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 80.0),
                                  child: Text('93%',
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black38,
                                      )),
                                ),
                              ),
                              angle: 90,
                              positionFactor: 0.5,
                              axisValue: 70.0,
                            ),
                          ])
                    ],
                    animation: true,
                  ),
                ),
              ],
            ),
          ),
        ),

            // Container(
            //   width: double.infinity,
            //   height: 500,
            //   margin: const EdgeInsets.all(20),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(25),
            //   ),
            //   child: Column(
            //     children: [
            //       SfRadialGauge(
            //         enableLoadingAnimation: true,
            //         animationDuration: 3000,
            //         title: const GaugeTitle(
            //           text: 'Vitamin A',
            //           textStyle: TextStyle(
            //             fontSize: 20.0,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.black38,
            //           ),
            //         ),
            //         axes: <RadialAxis>[
            //           RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
            //             GaugeRange(
            //               endWidth: 20,
            //               startWidth: 25,
            //               startValue: 0,
            //               endValue: 21.5,
            //               color: Colors.red,
            //             ),
            //             GaugeRange(
            //               startWidth: 20,
            //               endWidth: 15,
            //               startValue: 21.5,
            //               endValue: 43,
            //               color: Colors.yellow,
            //             ),
            //             GaugeRange(
            //               endWidth: 10,
            //               startWidth: 15,
            //               startValue: 43,
            //               endValue: 65,
            //               color: Colors.blueAccent,
            //             ),
            //             GaugeRange(
            //               startValue: 65,
            //               endValue: 86,
            //               color: Colors.green,
            //             ),
            //             GaugeRange(
            //               startWidth: 10,
            //               endWidth: 15,
            //               startValue: 86,
            //               endValue: 107,
            //               color: Colors.blueAccent,
            //             ),
            //             GaugeRange(
            //               startWidth: 15,
            //               endWidth: 20,
            //               startValue: 107,
            //               endValue: 129,
            //               color: Colors.yellow,
            //             ),
            //             GaugeRange(
            //               startWidth: 20,
            //               endWidth: 25,
            //               startValue: 129,
            //               endValue: 150,
            //               color: Colors.red,
            //             ),
            //           ], pointers: const <GaugePointer>[
            //             NeedlePointer(
            //                 value: 70,
            //                 needleColor: Colors.teal,
            //                 enableAnimation: true,
            //                 animationType: AnimationType.ease,
            //                 animationDuration: 1200,
            //                 needleStartWidth: 1,
            //                 needleEndWidth: 5,
            //                 needleLength: 0.8,
            //                 knobStyle: KnobStyle(
            //                   knobRadius: 0.08,
            //                   sizeUnit: GaugeSizeUnit.factor,
            //                   borderColor: Colors.white,
            //                   color: Colors.teal,
            //                   borderWidth: 0.05,
            //                 ),
            //                 tailStyle: TailStyle(
            //                   color: Colors.white,
            //                   width: 0.05,
            //                   lengthUnit: GaugeSizeUnit.factor,
            //                   length: 0.2,
            //                 )),
            //           ], annotations: const <GaugeAnnotation>[
            //             GaugeAnnotation(
            //               widget: Text('70.0',
            //                   style: TextStyle(
            //                     fontSize: 25,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.teal,
            //                   )),
            //               angle: 90,
            //               positionFactor: 0.5,
            //               axisValue: 70.0,
            //             ),
            //           ])
            //         ],
            //       ),
            //       TextButton(
            //         onPressed: () {},
            //         child: const Text(
            //           "Vitamin A",
            //           style: TextStyle(
            //             fontSize: 20,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // // SfRadialGauge(
            // //   title: const GaugeTitle(
            // //     text: 'Speedometer',
            // //     textStyle:
            // //         TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            // //   ),
            // //   axes: <RadialAxis>[
            // //     RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
            // //       GaugeRange(startValue: 0, endValue: 50, color: Colors.green),
            // //       GaugeRange(
            // //           startValue: 50, endValue: 100, color: Colors.orange),
            // //       GaugeRange(startValue: 100, endValue: 150, color: Colors.red)
            // //     ], pointers: const <GaugePointer>[
            // //       NeedlePointer(value: 70)
            // //     ], annotations: const <GaugeAnnotation>[
            // //       GaugeAnnotation(
            // //           widget: Text('70.0',
            // //               style: TextStyle(
            // //                   fontSize: 25, fontWeight: FontWeight.bold)),
            // //           angle: 90,
            // //           positionFactor: 0.5)
            // //     ])
            // //   ],
            // // ),
            // // const SizedBox(
            // //   height: 50,
            // // ),
            // // const Center(
            // //   child: Text(
            // //     "Result",
            // //     style: TextStyle(
            // //       fontSize: 25,
            // //       fontWeight: FontWeight.bold,
            // //     ),
            // //   ),
            // // ),
            // // Padding(
            // //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
            // //   child: SfLinearGauge(
            // //     minimum: 0.0,
            // //     maximum: 100.0,
            // //     showTicks: true,
            // //     showLabels: true,
            // //     barPointers: const <LinearBarPointer>[
            // //       LinearBarPointer(
            // //         value: 50,
            // //         thickness: 10,
            // //         edgeStyle: LinearEdgeStyle.bothCurve,
            // //         color: Colors.green,
            // //       ),
            // //     ],
            // //   ),
            // // ),
            // // const SizedBox(
            // //   height: 50,
            // // ),
            // // const Center(
            // //   child: Text(
            // //     "Result",
            // //     style: TextStyle(
            // //       fontSize: 25,
            // //       fontWeight: FontWeight.bold,
            // //     ),
            // //   ),
            // // ),
            // // Padding(
            // //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
            // //   child: SfLinearGauge(
            // //     minimum: 0.0,
            // //     maximum: 100.0,
            // //     showTicks: true,
            // //     showLabels: true,
            // //     barPointers: const <LinearBarPointer>[
            // //       LinearBarPointer(
            // //         value: 50,
            // //         thickness: 10,
            // //         edgeStyle: LinearEdgeStyle.bothCurve,
            // //         color: Colors.green,
            // //       ),
            // //     ],
            // //   ),
            // // ),
            // // const SizedBox(
            // //   height: 50,
            // // ),
            // // const Center(
            // //   child: Text(
            // //     "Result",
            // //     style: TextStyle(
            // //       fontSize: 25,
            // //       fontWeight: FontWeight.bold,
            // //     ),
            // //   ),
            // // ),
            // // Padding(
            // //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
            // //   child: Slider(
            // //     value: 0.5,
            // //     onChanged: (value) {},
            // //     label: "Result",
            // //     max: 100,
            // //     min: 0,
            // //     divisions: 100,
            // //     activeColor: Colors.green,
            // //     inactiveColor: Colors.red,
            // //     onChangeEnd: (value) {},
            // //     onChangeStart: (value) {},
            // //     semanticFormatterCallback: (value) => value.toString(),
            // //   ),
            // // ),
            // // const SizedBox(
            // //   height: 50,
            // // ),
            // // const Center(
            // //   child: Text(
            // //     "Result",
            // //     style: TextStyle(
            // //       fontSize: 25,
            // //       fontWeight: FontWeight.bold,
            // //     ),
            // //   ),
            // // ),
            // // Padding(
            // //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
            // //   child: SfRadialGauge(
            // //     title: const GaugeTitle(
            // //         text: 'Speedometer',
            // //         textStyle:
            // //             TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            // //         borderColor: Colors.red,
            // //         borderWidth: 2,
            // //         backgroundColor: Colors.green),
            // //     axes: [
            // //       RadialAxis(
            // //         minimum: 0,
            // //         maximum: 150,
            // //         ranges: <GaugeRange>[
            // //           GaugeRange(
            // //               startValue: 0, endValue: 50, color: Colors.red),
            // //           GaugeRange(
            // //               startValue: 50, endValue: 100, color: Colors.orange),
            // //           GaugeRange(
            // //               startValue: 100, endValue: 150, color: Colors.green)
            // //         ],
            // //         pointers: const <GaugePointer>[NeedlePointer(value: 70)],
            // //         annotations: <GaugeAnnotation>[
            // //           GaugeAnnotation(
            // //               widget: Container(
            // //                   child: const Text('70.0',
            // //                       style: TextStyle(
            // //                           fontSize: 25,
            // //                           fontWeight: FontWeight.bold))),
            // //               angle: 90,
            // //               positionFactor: 0.5)
            // //         ],
            // //       ),
            // //     ],
            // //   ),
            // // ),
            // // //   charts.PieChart(
            // // //   seriesList,
            // // //   animate: true,
            // // //   animationDuration: const Duration(milliseconds: 500),
            // // //   defaultRenderer: charts.ArcRendererConfig(
            // // //     arcRendererDecorators: [
            // // //       charts.ArcLabelDecorator(
            // // //         labelPosition: charts.ArcLabelPosition.outside,
            // // //       ),
            // // //     ],
            // // //   ),
            // // // ),
            // // const SizedBox(
            // //   height: 50,
            // // ),
            // // SfRadialGauge(
            // //     title: const GaugeTitle(
            // //         text: 'Speedometer',
            // //         textStyle:
            // //             TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            // //         borderColor: Colors.red,
            // //         borderWidth: 2,
            // //         backgroundColor: Colors.green),
            // //     axes: [
            // //       RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
            // //         GaugeRange(startValue: 0, endValue: 50, color: Colors.red),
            // //         GaugeRange(
            // //             startValue: 50, endValue: 100, color: Colors.orange),
            // //         GaugeRange(
            // //             startValue: 100, endValue: 150, color: Colors.green)
            // //       ], pointers: const <GaugePointer>[
            // //         NeedlePointer(value: 70)
            // //       ], annotations: <GaugeAnnotation>[
            // //         GaugeAnnotation(
            // //             widget: Container(
            // //                 child: const Text('70%',
            // //                     style: TextStyle(
            // //                         fontSize: 25,
            // //                         fontWeight: FontWeight.bold))),
            // //             angle: 90,
            // //             positionFactor: 0.5)
            // //       ])
            // //     ]),
            //
            // SizedBox(
            //   width: 200,
            //   height: 200,
            //   child: MyRadialGauge(),
            // ),
            // SizedBox(
            //   width: 200,
            //   height: 200,
            //   child: RCircleChart(
            //     lable: "Vitamin B",
            //     Axes: <RadialAxis>[
            //       RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
            //         GaugeRange(
            //           // endWidth: 20,
            //           // startWidth: 25,
            //           startValue: 0.0,
            //           endValue: 21.5,
            //           color: Colors.red,
            //         ),
            //         GaugeRange(
            //           // startWidth: 20,
            //           // endWidth: 15,
            //           startValue: 21.5,
            //           endValue: 43,
            //           color: Colors.yellow,
            //         ),
            //         GaugeRange(
            //           // endWidth: 10,
            //           // startWidth: 15,
            //           startValue: 43,
            //           endValue: 65,
            //           color: Colors.blueAccent,
            //         ),
            //         GaugeRange(
            //           startValue: 65,
            //           endValue: 86,
            //           color: Colors.green,
            //         ),
            //         GaugeRange(
            //           // startWidth: 10,
            //           // endWidth: 15,
            //           startValue: 86,
            //           endValue: 107,
            //           color: Colors.blueAccent,
            //         ),
            //         GaugeRange(
            //           // startWidth: 15,
            //           // endWidth: 20,
            //           startValue: 107,
            //           endValue: 129,
            //           color: Colors.yellow,
            //         ),
            //         GaugeRange(
            //           // startWidth: 20,
            //           // endWidth: 25,
            //           startValue: 129,
            //           endValue: 150,
            //           color: Colors.red,
            //         ),
            //       ], pointers: const <GaugePointer>[
            //         NeedlePointer(
            //             value: 70,
            //             needleColor: Colors.teal,
            //             enableAnimation: true,
            //             animationType: AnimationType.ease,
            //             animationDuration: 1200,
            //             needleStartWidth: 1,
            //             needleEndWidth: 5,
            //             needleLength: 0.8,
            //             knobStyle: KnobStyle(
            //               knobRadius: 0.08,
            //               sizeUnit: GaugeSizeUnit.factor,
            //               borderColor: Colors.white,
            //               color: Colors.teal,
            //               borderWidth: 0.05,
            //             ),
            //             tailStyle: TailStyle(
            //               color: Colors.white,
            //               width: 0.05,
            //               lengthUnit: GaugeSizeUnit.factor,
            //               length: 0.2,
            //             )),
            //       ], annotations: const <GaugeAnnotation>[
            //         GaugeAnnotation(
            //           widget: Text('93%',
            //               style: TextStyle(
            //                 fontSize: 25,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.teal,
            //               )),
            //           angle: 90,
            //           positionFactor: 0.5,
            //           axisValue: 70.0,
            //         ),
            //       ])
            //     ],
            //     animation: true,
            //   ),
            // ),
            //
            //   FullElement(
            //       chartSelecteed: SizedBox(
            //         width: 200,
            //         height: 200,
            //         child: RCircleChart(
            //           lable: "",
            //           Axes: <RadialAxis>[
            //             RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
            //               GaugeRange(
            //                 // endWidth: 20,
            //                 // startWidth: 25,
            //                 startValue: 0.0,
            //                 endValue: 21.5,
            //                 color: Colors.red,
            //               ),
            //               GaugeRange(
            //                 // startWidth: 20,
            //                 // endWidth: 15,
            //                 startValue: 21.5,
            //                 endValue: 43,
            //                 color: Colors.yellow,
            //               ),
            //               GaugeRange(
            //                 // endWidth: 10,
            //                 // startWidth: 15,
            //                 startValue: 43,
            //                 endValue: 65,
            //                 color: Colors.blueAccent,
            //               ),
            //               GaugeRange(
            //                 startValue: 65,
            //                 endValue: 86,
            //                 color: Colors.green,
            //               ),
            //               GaugeRange(
            //                 // startWidth: 10,
            //                 // endWidth: 15,
            //                 startValue: 86,
            //                 endValue: 107,
            //                 color: Colors.blueAccent,
            //               ),
            //               GaugeRange(
            //                 // startWidth: 15,
            //                 // endWidth: 20,
            //                 startValue: 107,
            //                 endValue: 129,
            //                 color: Colors.yellow,
            //               ),
            //               GaugeRange(
            //                 // startWidth: 20,
            //                 // endWidth: 25,
            //                 startValue: 129,
            //                 endValue: 150,
            //                 color: Colors.red,
            //               ),
            //             ], pointers: const <GaugePointer>[
            //               NeedlePointer(
            //                   value: 70,
            //                   needleColor: Colors.teal,
            //                   enableAnimation: true,
            //                   animationType: AnimationType.ease,
            //                   animationDuration: 1200,
            //                   needleStartWidth: 1,
            //                   needleEndWidth: 5,
            //                   needleLength: 0.8,
            //                   knobStyle: KnobStyle(
            //                     knobRadius: 0.08,
            //                     sizeUnit: GaugeSizeUnit.factor,
            //                     borderColor: Colors.white,
            //                     color: Colors.teal,
            //                     borderWidth: 0.05,
            //                   ),
            //                   tailStyle: TailStyle(
            //                     color: Colors.white,
            //                     width: 0.05,
            //                     lengthUnit: GaugeSizeUnit.factor,
            //                     length: 0.2,
            //                   )),
            //             ], annotations: const <GaugeAnnotation>[
            //               GaugeAnnotation(
            //                 widget: Text('93%',
            //                     style: TextStyle(
            //                       fontSize: 25,
            //                       fontWeight: FontWeight.bold,
            //                       color: Colors.teal,
            //                     )),
            //                 angle: 90,
            //                 positionFactor: 0.5,
            //                 axisValue: 70.0,
            //               ),
            //             ])
            //           ],
            //           animation: true,
            //         ),
            //       ),
            //       lable: "Vitamin C",
            //       advice:"You should take all foods and fruits tha contain vitamin C as oranges. You can Also take vitamin C as a tablet with some water."
            //   ),
          ],
        ),
      ),
    ));
  }
}
