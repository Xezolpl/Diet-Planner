// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'measurement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$MeasurementTearOff {
  const _$MeasurementTearOff();

// ignore: unused_element
  _Measurement call(
      {@required DateTime date,
      @required double weight,
      @required double bodyFat,
      @required double height,
      @required double bmi,
      @required Map<String, double> parties}) {
    return _Measurement(
      date: date,
      weight: weight,
      bodyFat: bodyFat,
      height: height,
      bmi: bmi,
      parties: parties,
    );
  }
}

// ignore: unused_element
const $Measurement = _$MeasurementTearOff();

mixin _$Measurement {
  DateTime get date;
  double get weight;
  double get bodyFat;
  double get height;
  double get bmi;
  Map<String, double> get parties;

  $MeasurementCopyWith<Measurement> get copyWith;
}

abstract class $MeasurementCopyWith<$Res> {
  factory $MeasurementCopyWith(
          Measurement value, $Res Function(Measurement) then) =
      _$MeasurementCopyWithImpl<$Res>;
  $Res call(
      {DateTime date,
      double weight,
      double bodyFat,
      double height,
      double bmi,
      Map<String, double> parties});
}

class _$MeasurementCopyWithImpl<$Res> implements $MeasurementCopyWith<$Res> {
  _$MeasurementCopyWithImpl(this._value, this._then);

  final Measurement _value;
  // ignore: unused_field
  final $Res Function(Measurement) _then;

  @override
  $Res call({
    Object date = freezed,
    Object weight = freezed,
    Object bodyFat = freezed,
    Object height = freezed,
    Object bmi = freezed,
    Object parties = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed ? _value.date : date as DateTime,
      weight: weight == freezed ? _value.weight : weight as double,
      bodyFat: bodyFat == freezed ? _value.bodyFat : bodyFat as double,
      height: height == freezed ? _value.height : height as double,
      bmi: bmi == freezed ? _value.bmi : bmi as double,
      parties:
          parties == freezed ? _value.parties : parties as Map<String, double>,
    ));
  }
}

abstract class _$MeasurementCopyWith<$Res>
    implements $MeasurementCopyWith<$Res> {
  factory _$MeasurementCopyWith(
          _Measurement value, $Res Function(_Measurement) then) =
      __$MeasurementCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime date,
      double weight,
      double bodyFat,
      double height,
      double bmi,
      Map<String, double> parties});
}

class __$MeasurementCopyWithImpl<$Res> extends _$MeasurementCopyWithImpl<$Res>
    implements _$MeasurementCopyWith<$Res> {
  __$MeasurementCopyWithImpl(
      _Measurement _value, $Res Function(_Measurement) _then)
      : super(_value, (v) => _then(v as _Measurement));

  @override
  _Measurement get _value => super._value as _Measurement;

  @override
  $Res call({
    Object date = freezed,
    Object weight = freezed,
    Object bodyFat = freezed,
    Object height = freezed,
    Object bmi = freezed,
    Object parties = freezed,
  }) {
    return _then(_Measurement(
      date: date == freezed ? _value.date : date as DateTime,
      weight: weight == freezed ? _value.weight : weight as double,
      bodyFat: bodyFat == freezed ? _value.bodyFat : bodyFat as double,
      height: height == freezed ? _value.height : height as double,
      bmi: bmi == freezed ? _value.bmi : bmi as double,
      parties:
          parties == freezed ? _value.parties : parties as Map<String, double>,
    ));
  }
}

class _$_Measurement implements _Measurement {
  const _$_Measurement(
      {@required this.date,
      @required this.weight,
      @required this.bodyFat,
      @required this.height,
      @required this.bmi,
      @required this.parties})
      : assert(date != null),
        assert(weight != null),
        assert(bodyFat != null),
        assert(height != null),
        assert(bmi != null),
        assert(parties != null);

  @override
  final DateTime date;
  @override
  final double weight;
  @override
  final double bodyFat;
  @override
  final double height;
  @override
  final double bmi;
  @override
  final Map<String, double> parties;

  @override
  String toString() {
    return 'Measurement(date: $date, weight: $weight, bodyFat: $bodyFat, height: $height, bmi: $bmi, parties: $parties)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Measurement &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.weight, weight) ||
                const DeepCollectionEquality().equals(other.weight, weight)) &&
            (identical(other.bodyFat, bodyFat) ||
                const DeepCollectionEquality()
                    .equals(other.bodyFat, bodyFat)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.bmi, bmi) ||
                const DeepCollectionEquality().equals(other.bmi, bmi)) &&
            (identical(other.parties, parties) ||
                const DeepCollectionEquality().equals(other.parties, parties)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(weight) ^
      const DeepCollectionEquality().hash(bodyFat) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(bmi) ^
      const DeepCollectionEquality().hash(parties);

  @override
  _$MeasurementCopyWith<_Measurement> get copyWith =>
      __$MeasurementCopyWithImpl<_Measurement>(this, _$identity);
}

abstract class _Measurement implements Measurement {
  const factory _Measurement(
      {@required DateTime date,
      @required double weight,
      @required double bodyFat,
      @required double height,
      @required double bmi,
      @required Map<String, double> parties}) = _$_Measurement;

  @override
  DateTime get date;
  @override
  double get weight;
  @override
  double get bodyFat;
  @override
  double get height;
  @override
  double get bmi;
  @override
  Map<String, double> get parties;
  @override
  _$MeasurementCopyWith<_Measurement> get copyWith;
}
