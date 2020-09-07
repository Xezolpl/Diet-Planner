abstract class Params {}

class ProductQueryParams {
  final String name;

  const ProductQueryParams(this.name);
}

class BarcodeParams {
  final int barcode;

  const BarcodeParams(this.barcode);
}
