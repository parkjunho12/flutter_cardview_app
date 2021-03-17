import 'package:floor/floor.dart';
import 'package:flutter_app/model/product.dart';

@dao
abstract class ProductDao{
  @Query('SELECT * FROM Product')
  Future<List<Product>> findProducts();

  @insert
  Future<void> insertProduct(Product product);
}