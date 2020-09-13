// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'diet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$DietTearOff {
  const _$DietTearOff();

// ignore: unused_element
  _Diet call(
      {@required String id,
      @required String name,
      @required List<Meal> meals}) {
    return _Diet(
      id: id,
      name: name,
      meals: meals,
    );
  }
}

// ignore: unused_element
const $Diet = _$DietTearOff();

mixin _$Diet {
  String get id;
  String get name;
  List<Meal> get meals;

  $DietCopyWith<Diet> get copyWith;
}

abstract class $DietCopyWith<$Res> {
  factory $DietCopyWith(Diet value, $Res Function(Diet) then) =
      _$DietCopyWithImpl<$Res>;
  $Res call({String id, String name, List<Meal> meals});
}

class _$DietCopyWithImpl<$Res> implements $DietCopyWith<$Res> {
  _$DietCopyWithImpl(this._value, this._then);

  final Diet _value;
  // ignore: unused_field
  final $Res Function(Diet) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object meals = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      meals: meals == freezed ? _value.meals : meals as List<Meal>,
    ));
  }
}

abstract class _$DietCopyWith<$Res> implements $DietCopyWith<$Res> {
  factory _$DietCopyWith(_Diet value, $Res Function(_Diet) then) =
      __$DietCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, List<Meal> meals});
}

class __$DietCopyWithImpl<$Res> extends _$DietCopyWithImpl<$Res>
    implements _$DietCopyWith<$Res> {
  __$DietCopyWithImpl(_Diet _value, $Res Function(_Diet) _then)
      : super(_value, (v) => _then(v as _Diet));

  @override
  _Diet get _value => super._value as _Diet;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object meals = freezed,
  }) {
    return _then(_Diet(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      meals: meals == freezed ? _value.meals : meals as List<Meal>,
    ));
  }
}

class _$_Diet implements _Diet {
  const _$_Diet({@required this.id, @required this.name, @required this.meals})
      : assert(id != null),
        assert(name != null),
        assert(meals != null);

  @override
  final String id;
  @override
  final String name;
  @override
  final List<Meal> meals;

  @override
  String toString() {
    return 'Diet(id: $id, name: $name, meals: $meals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Diet &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.meals, meals) ||
                const DeepCollectionEquality().equals(other.meals, meals)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(meals);

  @override
  _$DietCopyWith<_Diet> get copyWith =>
      __$DietCopyWithImpl<_Diet>(this, _$identity);
}

abstract class _Diet implements Diet {
  const factory _Diet(
      {@required String id,
      @required String name,
      @required List<Meal> meals}) = _$_Diet;

  @override
  String get id;
  @override
  String get name;
  @override
  List<Meal> get meals;
  @override
  _$DietCopyWith<_Diet> get copyWith;
}
