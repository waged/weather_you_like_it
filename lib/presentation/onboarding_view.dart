import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_you_like_it/app/app_prefs.dart';
import 'package:weather_you_like_it/app/setup_locator.dart';
import 'package:weather_you_like_it/generated/l10n.dart';
import 'package:weather_you_like_it/resources/assets_manager.dart';
import 'package:weather_you_like_it/resources/routes_manager.dart';
import 'package:weather_you_like_it/utils/log_utils.dart';
import 'package:weather_you_like_it/widgets/custom_bottom_navigation.dart';
import 'package:weather_you_like_it/widgets/custom_slider_view.dart';

import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

final pageViewController = PageController(initialPage: 0);

class OnboardingView extends ConsumerWidget {
  final maxSlides = 3;
  final currentPageStateProvider = StateProvider<int>((ref) {
    return 0;
  });

  late final pageViewController = PageController(initialPage: 0);

  OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPageProvider = ref.watch(currentPageStateProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: AppSize.s0,
      ),
      body: PageView(
        controller: pageViewController,
        onPageChanged: (int page) {
          logDebug('current page: $page');
          ref.read(currentPageStateProvider.notifier).state = page;
        },
        children: [
          _sliderView(
            context,
            SliderObject(0, S.of(context).onBoardingTitle1,
                S.of(context).onBoardingSubTitle1, ImageAssets.onboarding1),
          ),
          _sliderView(
            context,
            SliderObject(1, S.of(context).onBoardingTitle2,
                S.of(context).onBoardingSubTitle2, ImageAssets.onboarding2),
          ),
          _sliderView(
            context,
            SliderObject(1, S.of(context).onBoardingTitle3,
                S.of(context).onBoardingSubTitle3, ImageAssets.onboarding3),
          ),
        ],
      ),
      bottomSheet: CustomBottomNavigation(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              style:
                  TextButton.styleFrom(foregroundColor: ColorManager.primary),
              onPressed: () {
                logDebug('skip');
                instanceGetIt
                    .get<AppPreferences>()
                    .setOnboardingScreenViewed(true);
                instanceGetIt<RoutesManager>().router.go('/home');
              },
              child: Text(
                S.of(context).skip,
                textAlign: TextAlign.end,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: _getBottomSheetWidget(currentPageProvider),
          ),
        ],
      ),
    );
  }

  Widget _getBottomSheetWidget(int current) {
    logDebug('current $current');
    return SizedBox(
      height: AppSize.s75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          //left Arrow
          current == 0
              ? const SizedBox(
                  height: AppSize.s48,
                  width: AppSize.s48,
                ) // app padding is  8 from all sides means to add 16 to the 32
              : IconButton(
                  iconSize: AppSize.s32,
                  icon: const Icon(
                    Icons.arrow_back,
                    color: ColorManager.primary,
                  ),
                  onPressed: () {
                    pageViewController.previousPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut);
                  },
                ),
          const Spacer(),
          // 4 circles
          Row(
            children: [
              for (int i = 0; i < maxSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i, current),
                ),
            ],
          ),
          const Spacer(),
          //right Arrow
          IconButton(
            iconSize: AppSize.s32,
            icon: const Icon(
              Icons.arrow_forward,
              color: ColorManager.primary,
            ),
            onPressed: () {
              if (current >= 3) {
                logDebug('skip_from_arrow');
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
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _getProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return const Icon(
        Icons.circle_outlined,
      );
    } else {
      return const Icon(
        Icons.circle,
      );
    }
  }
}

Widget _sliderView(BuildContext context, SliderObject sliderObject) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          sliderObject.title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: ColorManager.primary, fontSize: 22.0),
        ),
      ),
      const SizedBox(
        height: AppMargin.m30,
      ),
      Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
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
        width: AppMargin.m250,
        height: AppMargin.m250,
        child: Image.asset(
          sliderObject.image,
          fit: BoxFit.contain,
        ),
      ),
    ],
  );
}
