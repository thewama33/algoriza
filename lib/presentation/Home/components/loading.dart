import 'package:algoriza/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CoffeLoadingWidget extends StatelessWidget {
  const CoffeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(backgroundColor: kPrimaryColor),
    );
  }
}
