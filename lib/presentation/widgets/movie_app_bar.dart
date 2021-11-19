import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/common/screenutil/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'logo.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
          left: Sizes.dimen_16.w.toDouble(),
          right: Sizes.dimen_16.w.toDouble(),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: SvgPicture.asset(
                'assets/svgs/menu.svg',
                height: Sizes.dimen_12.h.toDouble(),
              ),
            ),
            const Expanded(
                child: Logo(
              height: Sizes.dimen_14,
            )),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: Sizes.dimen_12.h.toDouble(),
              ),
            ),
          ],
        ));
  }
}
