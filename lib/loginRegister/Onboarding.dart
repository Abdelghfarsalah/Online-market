import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopapp/helper/sharedpref.dart';
import 'package:shopapp/loginRegister/Widgets/ItemBordring.dart';
import 'package:shopapp/loginRegister/registerPage.dart';
import 'package:shopapp/models/Onboardingmodel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<Onboardingmodel> boarding = [
    Onboardingmodel(
        body: 'Providing the best international and local products',
        image: 'assets/images/image_processing20200630-15633-1235wem.jpg',
        title: ''),
    Onboardingmodel(
        body: 'Complete comfort in payment methods',
        image: 'assets/images/Internet-Shopping-Illustration.jpg',
        title: ''),
    Onboardingmodel(
        body: 'Register as soon as possible to benefit from all services',
        image: 'assets/images/online-shopping-vector-illustration1.webp',
        title: ''),
  ];
  bool islast = false;
  var controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [
          TextButton(
              onPressed: () {
                helper.savedata(key: 'onboarding', value: true);
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => registerPage()),
                    (predicate) {
                  return false;
                });
              },
              child: const Text(
                'SKIP',
                style: TextStyle(fontSize: 25, color: Color(0xff4050B5)),
              ))
        ]),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: PageView.builder(
                  onPageChanged: (value) {
                    if (value == boarding.length - 1) {
                      setState(() {
                        islast = true;
                      });
                    } else {
                      setState(() {
                        islast = false;
                      });
                    }
                  },
                  controller: controller,
                  physics: BouncingScrollPhysics(),
                  itemCount: boarding.length,
                  itemBuilder: ((context, index) {
                    return itemOnboarding(boardin: boarding[index]);
                  })),
            ),
            Spacer(),
            Row(
              children: [
                SmoothPageIndicator(
                    effect: const ExpandingDotsEffect(
                      expansionFactor: 2.5,
                      dotWidth: 16,
                      dotColor: Colors.grey,
                    ),
                    controller: controller,
                    count: boarding.length),
                Spacer(),
                FloatingActionButton(
                  backgroundColor: Color(0xff4050B5),
                  onPressed: () {
                    if (islast) {
                      helper.savedata(key: 'onboarding', value: true);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => registerPage()),
                          (predicate) {
                        return false;
                      });
                    } else {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: const Icon(FontAwesomeIcons.arrowRight, size: 30),
                )
              ],
            ),
            Spacer(),
          ]),
        ),
      ),
    );
  }
}
