import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:arena/screens/quiz/components/time_bar.dart';
import 'package:arena/screens/quiz/components/question_card.dart';
import 'package:arena/controller/question_controller.dart';
import 'package:arena/models/question.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        // SvgPicture.asset("assets/bg.svg", fit: BoxFit.fill),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TimeBar(),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          "Question ${_questionController.questionNumber.value}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Color.fromARGB(255, 110, 126, 195)),
                      children: [
                        TextSpan(
                          text: "/${_questionController.questions.length}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: Color.fromARGB(255, 110, 126, 195)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(thickness: 1.5),
              SizedBox(height: 20),
              Expanded(
                child: PageView.builder(
                  // Block swipe to next qn
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                      question: _questionController.questions[index]),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
