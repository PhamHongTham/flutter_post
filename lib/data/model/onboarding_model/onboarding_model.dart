import '../../../gen/assets.gen.dart';

class OnboardingModel {
  String? title;
  String? image;
  String? description;
  OnboardingModel();
}

List<OnboardingModel> onboardingData = [
  OnboardingModel()
    ..image = Assets.logo.fashionShopRafiki1
    ..title = 'Choose Products'
    ..description =
        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
  OnboardingModel()
    ..image = Assets.logo.salesConsultingPana1
    ..title = 'Make Payment'
    ..description =
        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
  OnboardingModel()
    ..image = Assets.logo.shoppingBagRafiki1
    ..title = 'Get Your Order'
    ..description =
        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.'
];
