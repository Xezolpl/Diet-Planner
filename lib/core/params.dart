import 'package:openfoodfacts/openfoodfacts.dart';

abstract class Params {}

class ProductQueryParams {
  //final ProductSearchQueryConfiguration configuration; //That's from API

  //const ProductQueryParams(this.configuration);
}

class BarcodeParams {
  final int barcode;
  final bool fromApi;

  const BarcodeParams(this.barcode, {this.fromApi = false});
}
