import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'ProductDao.dart';
import 'package:flutter_app/model/product.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Product])
abstract class FlutterDatabase extends FloorDatabase {
  ProductDao get productDao;
}