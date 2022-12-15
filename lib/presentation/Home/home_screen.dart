import 'package:algoriza/presentation/Home/components/list_data.dart';
import 'package:algoriza/providers/HomeProviders/home_provider.dart';
import 'package:algoriza/providers/HomeProviders/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../base/base_app_bar.dart';
import '../base/error_widget.dart';
import 'components/loading.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  static const String routeName = "/home_screen";
RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SizedBox(child: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(cofferProvider);

          if (state is CoffeDataLoaded) {
            return CoffeListItems(coffes: state.model!,onRefresh: () {
              ref.read(cofferProvider.notifier).getProducts();
            },
            refreshController: _refreshController,);
          } else if (state is CoffeError) {
            return CoffeErrorWidget(
              err: state.message,
            );
          } else {
            return const CoffeLoadingWidget();
          }
        },
      )),
    );
  }

  void onRefresh(){}
}
