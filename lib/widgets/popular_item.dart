import 'package:flutter/material.dart';
import 'package:flutter_food_recipe/theme/color.dart';
import 'package:flutter_food_recipe/widgets/xcore.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({
    Key? key,
    required this.data,
    this.width = 200,
    this.height = 220,
    this.radius = 15,
    this.onTap,
    this.onFavoriteTap,
  }) : super(key: key);

  final Map data;
  final double width;
  final double height;
  final double radius;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Stack(
          children: [
            CustomImage(
              data['image'],
              borderRadius: BorderRadius.circular(radius),
              isShadow: false,
              width: width,
              height: 350,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                margin: const EdgeInsets.all(8),
                width: width - 16,
                height: 80,
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      data['name'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        CustomImage(
                          data['creator']['image'],
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['creator']['name'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: textColor,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                data['creator']['type'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: labelColor,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.stars,
                                color: textColor,
                                size: 14,
                              ),
                              Text(
                                data['rate'],
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
