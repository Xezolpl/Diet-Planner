// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ProductTearOff {
  const _$ProductTearOff();

// ignore: unused_element
  _Product call(
      {@required String id,
      @required String name,
      @required String category,
      @required Nutrition nutrition,
      @required double weight}) {
    return _Product(
      id: id,
      name: name,
      category: category,
      nutrition: nutrition,
      weight: weight,
    );
  }
}

// ignore: unused_element
const $Product = _$ProductTearOff();

mixin _$Product {
  String get id;
  String get name;
  String get category;
  Nutrition get nutrition;
  double get weight;

  $ProductCopyWith<Product> get copyWith;
}

abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String category,
      Nutrition nutrition,
      double weight});

  $NutritionCopyWith<$Res> get nutrition;
}

class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  final Product _value;
  // ignore: unused_field
  final $Res Function(Product) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object category = freezed,
    Object nutrition = freezed,
    Object weight = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      category: category == freezed ? _value.category : category as String,
      nutrition:
          nutrition == freezed ? _value.nutrition : nutrition as Nutrition,
      weight: weight == freezed ? _value.weight : weight as double,
    ));
  }

  @override
  $NutritionCopyWith<$Res> get nutrition {
    if (_value.nutrition == null) {
      return null;
    }
    return $NutritionCopyWith<$Res>(_value.nutrition, (value) {
      return _then(_value.copyWith(nutrition: value));
    });
  }
}

abstract class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) then) =
      __$ProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String category,
      Nutrition nutrition,
      double weight});

  @override
  $NutritionCopyWith<$Res> get nutrition;
}

class __$ProductCopyWithImpl<$Res> extends _$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(_Product _value, $Res Function(_Product) _then)
      : super(_value, (v) => _then(v as _Product));

  @override
  _Product get _value => super._value as _Product;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object category = freezed,
    Object nutrition = freezed,
    Object weight = freezed,
  }) {
    return _then(_Product(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      category: category == freezed ? _value.category : category as String,
      nutrition:
          nutrition == freezed ? _value.nutrition : nutrition as Nutrition,
      weight: weight == freezed ? _value.weight : weight as double,
    ));
  }
}

class _$_Product implements _Product {
  const _$_Product(
      {@required this.id,
      @required this.name,
      @required this.category,
      @required this.nutrition,
      @required this.weight})
      : assert(id != null),
        assert(name != null),
        assert(category != null),
        assert(nutrition != null),
        assert(weight != null);

  @override
  final String id;
  @override
  final String name;
  @override
  final String category;
  @override
  final Nutrition nutrition;
  @override
  final double weight;

  @override
  String toString() {
    return 'Product(id: $id, name: $name, category: $category, nutrition: $nutrition, weight: $weight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Product &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.nutrition, nutrition) ||
                const DeepCollectionEquality()
                    .equals(other.nutrition, nutrition)) &&
            (identical(other.weight, weight) ||
                const DeepCollectionEquality().equals(other.weight, weight)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(nutrition) ^
      const DeepCollectionEquality().hash(weight);

  @override
  _$ProductCopyWith<_Product> get copyWith =>
      __$ProductCopyWithImpl<_Product>(this, _$identity);
}

abstract class _Product implements Product {
  const factory _Product(
      {@required String id,
      @required String name,
      @required String category,
      @required Nutrition nutrition,
      @required double weight}) = _$_Product;

  @override
  String get id;
  @override
  String get name;
  @override
  String get category;
  @override
  Nutrition get nutrition;
  @override
  double get weight;
  @override
  _$ProductCopyWith<_Product> get copyWith;
}
