import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/categories/entites/categories_response_entity.dart';
import 'package:movie_app/domain/categories/repository/data_sourcse/remote_data_source/categories_data_source.dart';
import 'package:movie_app/domain/categories/repository/repository/categories_repository.dart';
@Injectable(as:CategoriesRepository)
class CategoriesRepositoryImpl  implements CategoriesRepository{
  CategoriesDataSource categoriesDataSource;
  CategoriesRepositoryImpl({required this.categoriesDataSource});
  @override
  Future<Either<Failures, CategoriesResponseEntity>> gitCategories({String? genre}) async{
     var either= await categoriesDataSource.gitCategories(genre: genre);
     return  either.fold((error)=>(Left(error)), (response)=>(Right(response)));
  }
}