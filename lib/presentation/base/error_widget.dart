// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:algoriza/providers/HomeProviders/home_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants.dart';

class CoffeErrorWidget extends StatelessWidget {
  String? err;
  CoffeErrorWidget({
    Key? key,
    this.err,
  }) : super(key: key);

  final maxSpace = 20.verticalSpace;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 100.w,
              height: 100.h,
              child: Image.asset(AppConstants.errImage)),
              maxSpace,
          Text(
            "$err",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          maxSpace,
          Consumer(
            builder: (context, ref, child) {
              return TextButton(
                  onPressed: () {
                    ref.read(cofferProvider.notifier).getProducts();
                  },
                  child: const Text("Try Again"));
            },
          )
        ],
      ),
    );
  }
}
