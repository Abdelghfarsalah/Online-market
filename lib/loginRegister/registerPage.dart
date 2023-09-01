import 'package:flutter/material.dart';

import 'Widgets/registerpagebody.dart';

class registerPage extends StatelessWidget {
  const registerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: registerpagebody()),
    );
  }
}
