import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_you_like_it/app/app_prefs.dart';
import 'package:weather_you_like_it/app/setup_locator.dart';
import 'package:weather_you_like_it/generated/l10n.dart';
import 'package:weather_you_like_it/presentation/onboarding_view.dart';
import 'package:weather_you_like_it/resources/color_manager.dart';
import 'package:weather_you_like_it/resources/routes_manager.dart';
import 'package:weather_you_like_it/resources/values_manager.dart';
import 'package:weather_you_like_it/utils/log_utils.dart';

class SliderObject {
  int index;
  String title;
  String subTitle;
  String image;

  SliderObject(this.index, this.title, this.subTitle, this.image);
}

class CustomSliderView extends ConsumerWidget {
  final SliderObject sliderObject;
  final int currentPageProvider;
  const CustomSliderView(this.sliderObject, this.currentPageProvider,
      {super.key});
  // ignore: non_constant_identifier_names
  final int MAX_SLIDES = 3;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Text(
              sliderObject.title,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(color: ColorManager.primary, fontSize: 22.0),
            ),
          ),
          const SizedBox(
            height: AppMargin.m30,
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Text(
              sliderObject.subTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
          const SizedBox(
            height: AppMargin.m60,
          ),
          SizedBox(
            width: AppMargin.m200,
            height: AppMargin.m200,
            child: Image.asset(
              sliderObject.image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 42),
              ),
              onPressed: () {
                logDebug('next');
                if (currentPageProvider >= MAX_SLIDES) {
                  logDebug('finish installation');
                  instanceGetIt
                      .get<AppPreferences>()
                      .setOnboardingScreenViewed(true);
                  instanceGetIt<RoutesManager>().router.go('/home');
                } else {
                  pageViewController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                }
              },
              child: Text(
                currentPageProvider == 0
                    ? S.of(context).start
                    : currentPageProvider >= MAX_SLIDES
                        ? S.of(context).finish
                        : S.of(context).next,
                textAlign: TextAlign.end,
                style: const TextStyle(fontSize: 22),
              )),
        ],
      ),
    );
  }
}
