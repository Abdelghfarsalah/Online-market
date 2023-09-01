import 'package:flutter/material.dart';
import 'package:shopapp/models/Onboardingmodel.dart';

class itemOnboarding extends StatelessWidget {
  const itemOnboarding({super.key, required this.boardin});
  final Onboardingmodel boardin;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(
          flex: 2,
        ),
        Image(fit: BoxFit.cover, image: AssetImage(boardin.image)),
        const Spacer(
          flex: 2,
        ),
        Text(
          boardin.title,
          style: const TextStyle(fontSize: 30),
        ),
        const Spacer(
          flex: 1,
        ),
        Text(boardin.body, style: const TextStyle(fontSize: 20)),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
