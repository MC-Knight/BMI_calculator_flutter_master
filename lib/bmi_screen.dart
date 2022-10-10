import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:bmi_calculator/screens/card.dart';

const knbackgroundColor = Color(0xFF263238);
const knblueGreyColor = Color(0xFF37474F);
const kntranparentColor = Color(0xFFECEFF1);

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMaleSelected = false;
  int height = 160;
  int weight = 80;
  int age = 21;

  void ageIncreament() {
    setState(() {
      age++;
    });
  }

  void ageDecreament() {
    setState(() {
      age--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: knbackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'BMI Calculator',
          style: textTheme.bodyMedium,
        ),
        centerTitle: false,
        titleSpacing: 20,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMaleSelected = true;
                  });
                },
                child: PageCard(
                  width: 140,
                  borderSide: isMaleSelected
                      ? const BorderSide(color: Colors.white70, width: 3)
                      : BorderSide.none,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.male, color: Colors.orange),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Male',
                        style: isMaleSelected
                            ? textTheme.bodySmall
                            : textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMaleSelected = false;
                  });
                },
                child: PageCard(
                    width: 140,
                    borderSide: isMaleSelected == false
                        ? const BorderSide(color: Colors.white70, width: 3)
                        : BorderSide.none,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.female, color: Colors.pinkAccent),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Female',
                          style: isMaleSelected == false
                              ? textTheme.bodySmall
                              : textTheme.labelSmall,
                        ),
                      ],
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: PageCard(
              width: 300,
              borderSide: null,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Height (in cm)',
                    style: textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  NumberPicker(
                      minValue: 110,
                      maxValue: 250,
                      value: height,
                      selectedTextStyle:
                          const TextStyle(color: Colors.white, fontSize: 30),
                      textStyle:
                          const TextStyle(color: Colors.white54, fontSize: 15),
                      axis: Axis.horizontal,
                      itemCount: 5,
                      itemWidth: 60,
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue;
                        });
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(
                        5,
                        (index) => Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              height: index == 2 ? 30 : 20,
                              width: 3,
                              color: index == 2 ? Colors.white : Colors.white54,
                            )),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PageCard(
                borderSide: null,
                width: 140,
                height: 135,
                child: Column(children: [
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Weight',
                    style: textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 75,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.18),
                        border: Border.all(
                            width: 2, color: Colors.grey.withOpacity(.3)),
                        borderRadius: BorderRadius.circular(30)),
                    child: Stack(alignment: Alignment.topCenter, children: [
                      const Positioned(
                        bottom: 60,
                        child: RotatedBox(
                          quarterTurns: 45,
                          child: Icon(
                            Icons.play_arrow_rounded,
                            size: 30,
                          ),
                        ),
                      ),
                      Center(
                        child: NumberPicker(
                          minValue: 10,
                          maxValue: 150,
                          value: weight,
                          itemWidth: 40,
                          selectedTextStyle: const TextStyle(
                              color: Colors.white, fontSize: 24),
                          textStyle: const TextStyle(
                              color: Colors.white54, fontSize: 16),
                          axis: Axis.horizontal,
                          onChanged: (newValue) {
                            setState(() {
                              weight = newValue;
                            });
                          },
                        ),
                      ),
                    ]),
                  ),
                ]),
              ),
              const SizedBox(
                width: 10,
              ),
              PageCard(
                  borderSide: null,
                  height: 135,
                  width: 140,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 3,
                      ),
                      Text('Age', style: textTheme.bodySmall),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              ageDecreament();
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.white54, width: 3)),
                              child: Center(
                                child: Text(
                                  '-',
                                  style: textTheme.labelSmall,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '$age',
                            style: textTheme.bodyLarge,
                          ),
                          InkWell(
                            onTap: () {
                              ageIncreament();
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.white54, width: 3)),
                              child: Center(
                                child: Text(
                                  '+',
                                  style: textTheme.labelSmall,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return BottomSheet(
                  onClosing: () {},
                  builder: (context) {
                    return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        height: 430,
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "Your BMI is:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.white.withOpacity(.8),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                calculateBMI(height, weight),
                                style: textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                bmiResult(),
                                style: textTheme.bodySmall,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                bmiFeedBack(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    height: 1.5,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.white.withOpacity(.8)),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Close',
                                    style: TextStyle(color: knbackgroundColor)),
                              ),
                            ],
                          ),
                        ));
                  },
                );
              });
        },
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Text(
          'BMI',
          style:
              TextStyle(color: knbackgroundColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

double bmi = 18;

calculateBMI(int height, int weight) {
  bmi = weight / (height * height) * 10000;
  return bmi.toStringAsFixed(1);
}

bmiResult() {
  if (bmi < 18.5) {
    return '(Underweight)';
  } else if (bmi >= 18.5 && bmi < 25) {
    return '(Normal)';
  } else if (bmi > 25 && bmi < 30) {
    return '(Overweight)';
  } else {
    return '(Obese)';
  }
}

bmiFeedBack() {
  if (bmi < 18.5) {
    return 'A BMI of less than 18.5 indicates that you are underweight, so you may need to put on some weight. You are recommended to ask your doctor or a dietitian for advice.';
  } else if (bmi >= 18.5 && bmi < 25) {
    return 'A BMI of 18.5-24.9 indicates that you are at a healthy weight for your height. By maintaining a healthy weight, you lower your risk of developing serious health problems.';
  } else if (bmi > 25 && bmi < 30) {
    return 'A BMI of 25-29.9 indicates that you are slightly overweight. You may be advised to lose some weight for health reasons. You are recommended to talk to your doctor or a dietitian for advice.';
  } else {
    return 'A BMI of over 30 indicates that you are heavily overweight. Your health may be at risk if you do not lose weight. You are recommended to talk to your doctor or a dietitian for advice';
  }
}
