import 'package:freezed_annotation/freezed_annotation.dart';
part 'nutrition.freezed.dart';

@freezed
abstract class Nutrition with _$Nutrition {
  const factory Nutrition(
    int kcal,
    double carbohydrates,
    double proteins,
    double fats, {
    double sugars,
    double salt,
    double saturated,
    double monounsaturated,
    double poliunsaturated,
    double omega3,
    double omega6,
    double ala,
    double epa,
    double dha,
    double fibre,
    double cholesterol,
    double caffeine,
    //vitamins
    double vitaminA,
    double vitaminB1,
    double vitaminB2,
    double vitaminB3,
    double vitaminB4,
    double vitaminB5,
    double vitaminB6,
    double vitaminB7,
    double vitaminB9,
    double vitaminB12,
    double vitaminC,
    double vitaminD,
    double vitaminE,
    double vitaminK,
    //minerals
    double sodium,
    double potassium,
    double calcium,
    double magnesium,
    double phosphorous,
    double iron,
    double copper,
    double zinc,
    double fluorine,
    double selenium,
    double iodine,
  }) = _Nutrition;

  factory Nutrition.empty() => Nutrition(0, 0, 0, 0);
}
