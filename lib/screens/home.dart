import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_work_8/components/icon_content.dart';
import 'package:home_work_8/components/reuseable_card.dart';
import 'package:home_work_8/components/round_icon_button.dart';
import 'package:home_work_8/methods/calculate_bmi.dart';
import 'package:home_work_8/screens/result_screen.dart';

enum GenderSelection { male, female }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final inActiveColor = const Color(0xff1d1e33);
  final activColor = const Color(0x111d1e33);
  GenderSelection? selection;
  int _height = 150;
  int _weight = 50;
  int _age = 16;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                ReuseableCard(
                  color: selection == GenderSelection.male
                      ? inActiveColor
                      : activColor,
                  myChild: const IconWithLabel(
                    icon: FontAwesomeIcons.mars,
                    label: 'ЭРКЕК',
                  ),
                  onPress: () {
                    selection = GenderSelection.male;
                  },
                ),
                ReuseableCard(
                  color: selection == GenderSelection.male
                      ? activColor
                      : inActiveColor,
                  myChild: const IconWithLabel(
                    icon: FontAwesomeIcons.venus,
                    label: 'АЯЛ',
                  ),
                  onPress: () {
                    setState(() {
                      selection = GenderSelection.female;
                    });
                  },
                ),
              ],
            ),
          ),
          ReuseableCard(
            color: const Color(0xff1d1e33),
            myChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'БОЮ',
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      _height.toString(),
                      style: const TextStyle(
                          fontSize: 47, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'см',
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 2,
                    activeTrackColor: Colors.white,
                    thumbColor: const Color(0xffeb1555),
                    overlayColor: const Color(0x15eb1555),
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 30),
                  ),
                  child: Slider(
                    max: 220,
                    min: 120,
                    value: _height.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        _height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
            onPress: () {},
          ),
          Expanded(
            child: Row(
              children: [
                ReuseableCard(
                  color: const Color(0xff1d1e33),
                  myChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('САЛМАГЫ'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(
                            _weight.toString(),
                            style: const TextStyle(
                                fontSize: 47, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'кг',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedBTN(
                            color: const Color(0xff0a0e21),
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                _weight++;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          RoundedBTN(
                            color: const Color(0xff0a0e21),
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              if (_weight < 1) {
                                return;
                              }
                              setState(() {
                                _weight--;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  onPress: () {},
                ),
                ReuseableCard(
                  color: const Color(0xff1d1e33),
                  myChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('ЖАШЫ'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(
                            _age.toString(),
                            style: const TextStyle(
                                fontSize: 47, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'жаш',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedBTN(
                            color: const Color(0xff0a0e21),
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                _age++;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          RoundedBTN(
                            color: const Color(0xff0a0e21),
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              if (_age < 1) {
                                return;
                              }
                              setState(() {
                                _age--;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  onPress: () {},
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              CalculateBMI calculateBMI = CalculateBMI(
                height: _height,
                weight: _weight,
              );
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultScreen(
                            bmi: calculateBMI.calculateBMI(),
                            result: calculateBMI.getResult(),
                            feedback: calculateBMI.feedBack(),
                          )));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                minimumSize: const Size(double.infinity, 45)),
            child: const Text(
              'ЭСЕПТЕ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 5,
          )
        ],
      )),
    );
  }
}
