// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

class _$ProductTearOff {
  const _$ProductTearOff();

// ignore: unused_element
  _Product call(
      {@required String id,
      @required String name,
      @required List<String> categories,
      @required Nutrients nutrients,
      @required double weight}) {
    return _Product(
      id: id,
      name: name,
      categories: categories,
      nutrients: nutrients,
      weight: weight,
    );
  }
}

// ignore: unused_element
const $Product = _$ProductTearOff();

mixin _$Product {
  String get id;
  String get name;
  List<String> get categories;
  Nutrients get nutrients;
  double get weight;

  Map<String, dynamic> toJson();
  $ProductCopyWith<Product> get copyWith;
}

abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      List<String> categories,
      Nutrients nutrients,
      double weight});

  $NutrientsCopyWith<$Res> get nutrients;
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
    Object categories = freezed,
    Object nutrients = freezed,
    Object weight = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      categories: categories == freezed
          ? _value.categories
          : categories as List<String>,
      nutrients:
          nutrients == freezed ? _value.nutrients : nutrients as Nutrients,
      weight: weight == freezed ? _value.weight : weight as double,
    ));
  }

  @override
  $NutrientsCopyWith<$Res> get nutrients {
    if (_value.nutrients == null) {
      return null;
    }
    return $NutrientsCopyWith<$Res>(_value.nutrients, (value) {
      return _then(_value.copyWith(nutrients: value));
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
      List<String> categories,
      Nutrients nutrients,
      double weight});

  @override
  $NutrientsCopyWith<$Res> get nutrients;
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
    Object categories = freezed,
    Object nutrients = freezed,
    Object weight = freezed,
  }) {
    return _then(_Product(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      categories: categories == freezed
          ? _value.categories
          : categories as List<String>,
      nutrients:
          nutrients == freezed ? _value.nutrients : nutrients as Nutrients,
      weight: weight == freezed ? _value.weight : weight as double,
    ));
  }
}

@JsonSerializable()
class _$_Product implements _Product {
  const _$_Product(
      {@required this.id,
      @required this.name,
      @required this.categories,
      @required this.nutrients,
      @required this.weight})
      : assert(id != null),
        assert(name != null),
        assert(categories != null),
        assert(nutrients != null),
        assert(weight != null);

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final List<String> categories;
  @override
  final Nutrients nutrients;
  @override
  final double weight;

  @override
  String toString() {
    return 'Product(id: $id, name: $name, categories: $categories, nutrients: $nutrients, weight: $weight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Product &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)) &&
            (identical(other.nutrients, nutrients) ||
                const DeepCollectionEquality()
                    .equals(other.nutrients, nutrients)) &&
            (identical(other.weight, weight) ||
                const DeepCollectionEquality().equals(other.weight, weight)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(categories) ^
      const DeepCollectionEquality().hash(nutrients) ^
      const DeepCollectionEquality().hash(weight);

  @override
  _$ProductCopyWith<_Product> get copyWith =>
      __$ProductCopyWithImpl<_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductToJson(this);
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {@required String id,
      @required String name,
      @required List<String> categories,
      @required Nutrients nutrients,
      @required double weight}) = _$_Product;

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<String> get categories;
  @override
  Nutrients get nutrients;
  @override
  double get weight;
  @override
  _$ProductCopyWith<_Product> get copyWith;
}
