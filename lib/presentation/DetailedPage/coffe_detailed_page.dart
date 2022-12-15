import 'package:algoriza/model/coffe_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../base/base_app_bar.dart';

class CoffeDetailedPage extends StatefulWidget {
  CoffeDetailedPage({super.key, this.model});

  CoffeResponse? model;

  @override
  State<CoffeDetailedPage> createState() => _CoffeDetailedPageState();
}

class _CoffeDetailedPageState extends State<CoffeDetailedPage> {
  bool isOverFlow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Column(
                children: [
                  Hero(
                    tag: widget.model!.id!,
                    child: AspectRatio(
                      aspectRatio: 1.08,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: widget.model!.image!,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.title),
                    title: Text(widget.model!.title!,
                        style: Theme.of(context).textTheme.bodyText1!),
                    subtitle: Text(widget.model!.description!,
                        overflow: isOverFlow ? TextOverflow.ellipsis : null,
                        style: Theme.of(context).textTheme.bodyText2!),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () {}, child: const Text("See More")),
                  ),
                  ExpansionTile(
                    title: Text("Ingredients",
                        style: Theme.of(context).textTheme.bodyText1!),
                    leading: const Icon(Icons.coffee),
                    children: [
                      ...List.generate(
                        widget.model!.ingredients!.length,
                        (index) => RPadding(
                          padding: REdgeInsets.all(8.0.r),
                          child: Text(widget.model!.ingredients![index],
                              style: Theme.of(context).textTheme.bodyText2),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
