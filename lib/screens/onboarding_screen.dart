import 'package:firebase_auth_demo/screens/profile_screen.dart';
import 'package:firebase_auth_demo/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatefulWidget {
  static var routeName='/onboarding';

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: demo_data.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                            itemBuilder: (context, index) => OnBoardContent(
                            image: demo_data[index].image,
                            title: demo_data[index].title,
                            description: demo_data[index].description,
                  ) 
                            ),
                ),
                Row(
                  children: [
                    ...List.generate(demo_data.length,
                     (index) => Padding(
                       padding: const EdgeInsets.only(right: 4),
                       child: DotIndicator(isActive: index == _pageIndex),
                     ))
                  ],
                ),
                Row(
                  children: [
                    const Spacer(),
                    SizedBox(height: 60, 
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(curve: Curves.ease, duration: Duration(milliseconds: 300));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: buttonColor,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Arrow-Right.svg",
                        color: Colors.white,),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
              ],
      ),
          ),
    )
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key, this.isActive = false,
  }) : super(key: key);
 
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? 12:4,
      width: 4,
      decoration:BoxDecoration(
        color: isActive ? buttonColor : buttonColor.withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}


class Onboard {
  final String image, title, description;

  Onboard({
    required this.title,
    required this.image,
    required this.description,
  });
}

// ignore: non_constant_identifier_names
final List<Onboard> demo_data = [
  Onboard(
    image: 'assets/images/onboarding1.jpg',
    title: "You've come to the \n right place to win!",
    description: "We're pleased to have you here at Arena",
    ),
    Onboard(
    image: 'assets/images/onb.jpg',
    title: "Pitch in & Win big prizes on Arena",
    description: "Now, help us get to know you better",
    ),
    Onboard(
    image: 'assets/images/onboarding3.png',
    title: "Take part in timed quizes and show off to your friends!",
    description: "Enter the details & let's begin with\n ",
    ),
    Onboard(
    image: 'assets/images/arena.jpg',
    title: "Pay. Pool. Play",
    description: "T&C Apply",
    ),
];

// ignore: must_be_immutable
class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    Key? key, 
    required this.image, 
    required this.title, 
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(image,
        height: 250,
        ),
        const Spacer(),
        Text(title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16,),
        Text(description,
        textAlign: TextAlign.center,
        ),
        const Spacer(),
      ]);
  }
}