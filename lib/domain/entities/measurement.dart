import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'measurement.freezed.dart';

@freezed
abstract class Measurement with _$Measurement {
  const factory Measurement({
    @required DateTime date,
    @required double weight,
    @required double bodyFat,
    @required double height,
    @required double bmi,
    @required Map<String, double> parties,
  }) = _Measurement;

  factory Measurement.empty() => Measurement(
        date: DateTime.now(),
        weight: 0,
        bodyFat: 0,
        height: 0,
        bmi: 0,
        parties: {
          'arms': 0,
          'calves': 0,
          'chest': 0,
          'forearms': 0,
          'hips': 0,
          'neck': 0,
          'shoulders': 0,
          'thights': 0,
          'waist': 0,
        },
      );
}
