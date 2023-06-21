import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/src/utils/styles.dart';

import '../models/movie.dart';

class MovieSliverAppBar extends StatelessWidget {
  const MovieSliverAppBar({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      expandedHeight: MediaQuery.of(context).size.height * 0.6,
      backgroundColor: AppColor.primary,
      elevation: 0.0,
      pinned: true,
      stretch: true,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
        background: Image.network(movie.posterurl!,
            height: MediaQuery.of(context).size.height * 0.60,
            fit: BoxFit.cover, loadingBuilder: (BuildContext context,
                Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
              child: SliverFillRemaining(
                  hasScrollBody: false,
                  fillOverscroll: true,
                  child: Center(
                      child: SpinKitFadingCube(
                    size: 80,
                    color: AppColor.primary,
                  ))));
        }, errorBuilder: (context, exception, stackTrace) {
          return Image.asset(
            'assets/images/poster_placeholder.png',
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height * 0.60,
            width: double.infinity,
          );
        }),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          height: 40.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
          ),
          child: Container(
            width: 40.0,
            height: 5.0,
            decoration: BoxDecoration(
              color: AppColor.kOutlineColor,
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 32.0),
          child: IconButton(
              iconSize: 32,
              icon: Icon(
                CupertinoIcons.heart_fill,
                color: Color.fromARGB(130, 226, 128, 128),
              ),
              onPressed: () => {}),
        )
      ],
      leadingWidth: 80.0,
      leading: Container(
        margin: const EdgeInsets.only(left: 24.0),
        child: GestureDetector(
          onTap: () => context.router.pop(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: Container(
                  height: 56.0,
                  width: 56.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.32),
                  ),
                  child: const Icon(
                    CupertinoIcons.chevron_back,
                    size: 24,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
