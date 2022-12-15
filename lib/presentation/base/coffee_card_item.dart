// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:algoriza/model/coffe_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeCardItem extends StatelessWidget {
  CoffeResponse? model;
  void Function()? onTap;
  CoffeCardItem({Key? key, this.model, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Column(
          children: [
            RPadding(
              padding: REdgeInsets.all(8.0.r),
              child: AspectRatio(
                aspectRatio: 1.08,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Hero(
                      tag: model!.id!,
                      child: CachedNetworkImage(
                        imageUrl: model!.image!,
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
            ),
            ListTile(
              title: Text(model!.title!,
                  style: Theme.of(context).textTheme.bodyText1, maxLines: 2),
              subtitle: Text(model!.description!,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2),
            )
          ],
        ),
      ),
    );
  }
}
