import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../resources/color.dart';
import '../resources/name.dart';
import '../resources/text.dart';


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  int ageValue = 30;
  int weightValue = 45;
  var value = 175.0;
  Random practise = Random();

  TextEditingController weigthController = TextEditingController();
  TextEditingController ageController = TextEditingController();


  double heightFinal = 0;
  double bmiTotal = 0;
  String health = "NORMAL WEIGHT";


  late AnimationController heightConAnimation;
  late AnimationController weightConAnimation;
  late AnimationController ageConAnimation;
  late AnimationController femaleConAnimation;
  late AnimationController maleConAnimation;

  @override
  void initState() {
    weigthController.text = weightValue.toString();
    ageController.text = ageValue.toString();

    heightConAnimation =
    AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..forward();
    heightConAnimation.addListener(() {
      setState(() {});
    });

    weightConAnimation =
    AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..forward();
    weightConAnimation.addListener(() {
      setState(() {});
    });

    ageConAnimation =
    AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..forward();
    ageConAnimation.addListener(() {
      setState(() {});
    });

    femaleConAnimation =
    AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..forward();
    femaleConAnimation.addListener(() {
      setState(() {});
    });

    maleConAnimation =
    AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..forward();
    maleConAnimation.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bmiCalcBG,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 100, right: 10),
                  child: Row(
                    children: [
                      Text(
                        bmiCalculator,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              ageValue = 30;
                              weightValue = 45;
                              weigthController.text = weightValue.toString();
                              ageController.text = ageValue.toString();
                              value = 180;
                            });
                          },
                          icon: const Icon(
                            Icons.restart_alt,
                            size: 30,
                            color: Colors.green,
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      FadeTransition(
                        opacity: femaleConAnimation,
                        child: InkWell(
                          onTap: () {
                            colorPink1 = Colors.green;
                            colorPink2 = colorPink;
                            setState(() {});
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: containerDeco,
                            child: Column(
                              children: [

                                Icon(
                                  Icons.female,
                                  size: 90,
                                  color: colorPink1,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  female,
                                  style: TextStyle(
                                      fontSize: 20, color: colorWhite),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      FadeTransition(
                        opacity: maleConAnimation,
                        child: InkWell(
                          onTap: () {
                            colorPink2 = Colors.green;
                            colorPink1 = colorPink;
                            setState(() {});
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: containerDeco,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.male,
                                  size: 90,
                                  color: colorPink2,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  male,
                                  style: TextStyle(
                                      fontSize: 20, color: colorWhite),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SlideTransition(
                  position: Tween<Offset>(
                      begin: const Offset(-1, 0), end: Offset.zero)
                      .animate(heightConAnimation),
                  child: Container(
                    height: 180,
                    width: 350,
                    padding: const EdgeInsets.all(10),
                    decoration: containerDeco,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          height,
                          style: const TextStyle(color: Color(0xFF626473)),
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: value.toInt().toString(),
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w400,
                                  color: colorWhite)),
                          const TextSpan(
                              text: " cm",
                              style: TextStyle(
                                  color: Color(0xFF626473),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15)),
                        ])),
                        Container(
                          width: 400,
                          child: SliderTheme(
                            data: SliderThemeData(
                                thumbColor: colorSliderThumb,
                                trackHeight: 0.2,
                                activeTrackColor: colorSliderActive,
                                inactiveTrackColor: colorSliderInactive),
                            child: Slider(
                                value: value,
                                min: 1.0,
                                max: 400.0,
                                onChanged: (data) {
                                  value = data;
                                  setState(() {});
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(-1, 0),
                          end: Offset.zero,
                        ).animate(weightConAnimation),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 200,
                          width: 150,
                          decoration: containerDeco,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                weight,
                                style:
                                TextStyle(fontSize: 15, color: colorWhite),
                              ),
                              Container(
                                height: 80,
                                child: TextField(
                                  onSubmitted: (data) {
                                    weightValue = int.parse(data);
                                  },
                                  controller: weigthController,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: colorWhite,
                                    fontSize: 50,
                                  ),
                                  cursorColor: bmiCalcBG,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(3)
                                  ],
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        weightValue++;
                                        weigthController.text =
                                            weightValue.toString();
                                      });
                                    },
                                    backgroundColor: const Color(0xFF4C4F5E),
                                    mini: true,
                                    child: const Icon(Icons.add),
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        weightValue--;
                                        weigthController.text =
                                            weightValue.toString();
                                      });
                                    },
                                    backgroundColor: const Color(0xFF4C4F5E),
                                    mini: true,
                                    child: const Icon(CupertinoIcons.minus),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      SlideTransition(
                        position: Tween<Offset>(
                            begin: const Offset(1, 0), end: Offset.zero)
                            .animate(ageConAnimation),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 200,
                          width: 150,
                          decoration: containerDeco,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                age,
                                style:
                                TextStyle(fontSize: 15, color: colorWhite),
                              ),
                              Container(
                                height: 80,
                                child: TextField(
                                  onSubmitted: (data) {
                                    ageValue = int.parse(data);
                                  },
                                  controller: ageController,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: colorWhite,
                                    fontSize: 50,
                                  ),
                                  cursorColor: bmiCalcBG,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(3),
                                  ],
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        ageValue++;
                                        ageController.text =
                                            ageValue.toString();
                                      });
                                    },
                                    backgroundColor: const Color(0xFF4C4F5E),
                                    mini: true,
                                    child: const Icon(Icons.add),
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        ageValue--;
                                        ageController.text =
                                            ageValue.toString();
                                      });
                                    },
                                    backgroundColor: const Color(0xFF4C4F5E),
                                    mini: true,
                                    child: const Icon(CupertinoIcons.minus),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),

                InkWell(
                  onTap: () {
                    heightFinal = (value / 100) * (value / 100);
                    bmiTotal = weightValue / heightFinal;
                    if (bmiTotal < 18.5) {
                      health = "UNDERWEIGHT";
                    } else if (bmiTotal >= 18.5 && bmiTotal < 25) {
                      health = "You have normal body weight,Good Job.!!";
                    } else if (bmiTotal >= 25 && bmiTotal < 30) {
                      health = "OVERWEIGHT";
                    } else {
                      health = "OBESE";
                    }

                    _modalBottomSheetMenu();
                  },
                  child: Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                        color:  Colors.pink,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Text(
                          calculate,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return Container(
            height: 350.0,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(35),
              child: Container(
                  decoration: BoxDecoration(
                    color: bmiCalcBG,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Your BMI is: ",
                        style: TextStyle(color: colorWhite, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 250,
                        height: 60,
                        decoration: BoxDecoration(
                            color:  Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            bmiTotal.toDouble().toStringAsFixed(2).toString(),
                            style: TextStyle(
                                color: colorSliderThumb,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        health,
                        style: TextStyle(
                            color: colorWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            shadows: [
                              Shadow(
                                  color: colorSliderThumb,
                                  blurRadius: 15.0,
                                  offset: const Offset(1, 1))
                            ]),
                      ),
                    ],
                  )),
            ),
          );
        });
  }
}