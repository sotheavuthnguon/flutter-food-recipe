import 'package:flutter/material.dart';
import 'package:flutter_food_recipe/theme/color.dart';
import 'package:flutter_food_recipe/utils/data.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/xcore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        title: buildAppBar(),
      ),
      body: buildBody(),
    );
  }

  Widget buildAppBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 34,
          height: 34,
          child: IconBox(
            radius: 15,
            bgColor: appBgColor,
            child: SvgPicture.asset('assets/icons/menu1.svg'),
          ),
        ),
        const NotificationBox(
          notifiedNumber: 1,
        ),
      ],
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          buildHeader(),
          const SizedBox(
            height: 15,
          ),
          buildCategory(),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              'Popular Recipes',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ),
          buildPopular(),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Stay at home, \nmake your own ',
                  style: TextStyle(
                    height: 1.3,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
                TextSpan(
                  text: 'food',
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategory() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 5, 7, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CategoryItem(
              data: categories[index],
              isSelected: index == selectedCategoryIndex,
              onTap: () {
                setState(() {
                  selectedCategoryIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPopular() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: List.generate(
          populars.length,
          (index) => Container(
            margin: const EdgeInsets.only(right: 15),
            child: PopularItem(
              data: populars[index],
              onFavoriteTap: () {
                setState(() {
                  populars[index]["is_favorited"] =
                      !populars[index]["is_favorited"];
                });
              },
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }
}
