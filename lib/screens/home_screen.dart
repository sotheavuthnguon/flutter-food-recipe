import 'package:flutter/material.dart';
import 'package:flutter_food_recipe/theme/color.dart';
import 'package:flutter_food_recipe/widgets/icon_box.dart';
import 'package:flutter_food_recipe/widgets/notification_box.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            child: SvgPicture.asset('assets/icons/menu1.svg'),
            radius: 15,
            bgColor: appBgColor,
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
            text: const TextSpan(children: <TextSpan>[
              TextSpan(
                text: 'Stay at home, \nmake your own ',
              )
            ]),
          )
        ],
      ),
    );
  }
}
