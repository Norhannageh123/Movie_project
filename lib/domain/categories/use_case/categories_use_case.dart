import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/categories/entites/categories_response_entity.dart';
import 'package:movie_app/domain/categories/repository/repository/categories_repository.dart';
@injectable
class CategoriesUseCase {
  CategoriesRepository categoriesRepository;
  CategoriesUseCase({required this.categoriesRepository});
   Future<Either<Failures,CategoriesResponseEntity>> invoke({String? genre}){
    return  categoriesRepository.gitCategories(genre: genre);
   }
}