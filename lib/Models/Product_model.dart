class ProductModel {

  String? productCode;
  String? productName;
 
  get getProductCode => this.productCode;
  set setProductCode(String productCode) => this.productCode = productCode;

  get getProductName => this.productName;
  set setProductName(productName) => this.productName = productName;

  ProductModel.empty();

  ProductModel.full(String productCode, String productName) {
    this.productCode = productCode;
    this.productName = productName;
  }

  ProductModel.fullJson(
      {this.productCode,
      this.productName}) {
    this.productCode = productCode;
    this.productName = productName;
  }
  
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel.fullJson(
      productCode: json['ProductCode'] as String,
      productName: json['ProdName'] as String,
    );
  }
}