import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:arena/controller/question_controller.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);
  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  late ConfettiController confettiController;

  @override
  void initState() {
    super.initState();
    setState(() {
      initController();
    });
    confettiController.play();
  }

  void initController() {
    confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Color.fromARGB(255, 12, 34, 130)),
              ),
              Spacer(),
              Text(
                "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Color.fromARGB(255, 20, 41, 137)),
              ),
              Spacer(flex: 3),
            ],
          ),
          buildConfettiWidget(confettiController, pi / 2),
        ],
      ),
    );
  }

  Align buildConfettiWidget(controller, double blastDirection) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        maximumSize: Size(40, 30),
        shouldLoop: false,
        confettiController: controller,
        blastDirection: blastDirection,
        blastDirectionality: BlastDirectionality.explosive,
        maxBlastForce: 20,
        minBlastForce: 8,
        emissionFrequency: 0.2,
        numberOfParticles: 20,
        gravity: 0.01,
      ),
    );
  }
}
