import 'package:firebase_auth_demo/utils/app_layout.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class QuizView extends StatelessWidget {
  const QuizView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Applayout.getSize(context);
    return SizedBox(
      width: 350,
      height: 200,
      // ignore: avoid_unnecessary_containers
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff761582),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  fit:BoxFit.cover,
                                  image: AssetImage("assets/images/quiz.png")
                              )
                          ),
                      ),
                      const Spacer(),
                      Text("Quiz 1", style: Styles.header2.copyWith(color: Styles.textcolor_negative),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Ready to begin >", style: Styles.header4.copyWith(color: Styles.textcolor_negative),)
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
