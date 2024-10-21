import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:post/core/styles/appColors.dart';
import 'package:post/core/styles/appPicture.dart';
import 'package:post/core/styles/appStyle.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../common/constants/button/custom_button.dart';
import '../../core/routering/router_path.dart';
import '../../core/styles/appText.dart';
import '../../data/model/onboarding_model/onboarding_model.dart';
import 'onboarding_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: BlocBuilder<OnboardingBloc, OnboardingStates>(
        builder: (context, state) {
          return Padding(
            padding: Appstyle.padding,
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: onboardingData.length,
                    controller: pageController,
                    onPageChanged: (index) {
                      context.read<OnboardingBloc>().add(
                            OnboardingEvents(pageIndex: index),
                          );
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (onboardingData[OnboardingInitial().pageIndex]
                                  .image !=
                              null)
                            Apppicture.svgOnboarding,
                          Appstyle.sizeBoxheight100,
                          Text(
                            onboardingData[OnboardingInitial().pageIndex]
                                .title!,
                            style: Appstyle.styleTextFirst,
                          ),
                          Appstyle.sizeBoxheight28,
                          Text(
                            onboardingData[OnboardingInitial().pageIndex]
                                .description!,
                            style: Appstyle.styleTextSecond,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: onboardingData.length, // Cập nhật số lượng trang
                  effect: Appstyle.effect,
                ),
                Appstyle.sizeBoxheight20,
                Center(
                  child: CustomButton(
                    gradient: LinearGradient(
                      colors: AppColor.gradientColor,
                    ),
                    onPressed: () {
                      if (state is OnboardingInitial) {
                        if (state.pageIndex == 2) {
                          context.go(Routers.home);
                        }
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      }
                    },
                    text: AppText.textOnboardingScreen,
                    borderRadius: Appstyle.borderRadius,
                    width: 197,
                    height: 45,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
