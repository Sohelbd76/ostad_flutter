class Urls {
  static const String _baseUrl = 'http://35.73.30.144:2008/api/v1';

  static const String getProductsUrl = '$_baseUrl/ReadProduct';

  static String deleteProductsUrl(String id) => '$_baseUrl/DeleteProduct/$id';

  static const String updateProductsUrl = '$_baseUrl/UpdateProduct/65abe919f68794d36c5b7ffa';

}