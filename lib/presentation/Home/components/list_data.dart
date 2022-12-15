import 'package:algoriza/model/coffe_model.dart';
import 'package:algoriza/presentation/DetailedPage/coffe_detailed_page.dart';
import 'package:algoriza/presentation/base/coffee_card_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CoffeListItems extends StatelessWidget {
  CoffeListItems({super.key, required this.coffes, required this.refreshController,this.onRefresh});
  RefreshController refreshController;
  void Function()? onRefresh;

  List<CoffeResponse?> coffes;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      onRefresh: onRefresh,
      enablePullDown: true,
      child: ListView.builder(
        itemCount: coffes.length,
        itemBuilder: (context, index) {
          return CoffeCardItem(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) =>
                        CoffeDetailedPage(model: coffes[index]),
                  ));
            },
            model: coffes[index],
          );
        },
      ),
    );
  }
}
