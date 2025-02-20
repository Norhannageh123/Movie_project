import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/categories/entites/categories_response_entity.dart';

abstract class CategoriesDataSource {
   Future<Either<Failures,CategoriesResponseEntity>> gitCategories({String? genre});
}