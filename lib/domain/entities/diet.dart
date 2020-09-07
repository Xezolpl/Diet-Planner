import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import 'meal.dart';
import 'nutrition.dart';
part 'diet.freezed.dart';

@freezed
abstract class Diet with _$Diet {
  const factory Diet({
    @required String id,
    @required String name,
    @required Nutrition overralNutrition,
    @required List<Meal> meals,
  }) = _Diet;

  factory Diet.empty() => Diet(
        id: Uuid().v4(),
        name: '',
        overralNutrition: Nutrition.empty(),
        meals: [],
      );
}
