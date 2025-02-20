import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_constants.dart';
import 'package:movie_app/core/api/api_endpoints.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/data/categories/model/categories_response_dm.dart';
import 'package:movie_app/domain/categories/repository/data_sourcse/remote_data_source/categories_data_source.dart';
@Injectable(as:CategoriesDataSource)
class CategoriesDataSourceImpl implements CategoriesDataSource{
  @override
  Future<Either<Failures, CategoriesResponseDM>> gitCategories({String? genre})async {
    var response = await ApiManager.instance.request(
      baseUrl: ApiConstants.moviesBaseUrl,
      endpoint: ApiEndpoints.categoriesEndPoint,
      method: "GET",
       header: genre != null ? {'genre': genre} : null
    );

    return response.fold(
      (l) => Left(l),
      (r) => Right(CategoriesResponseDM.fromJson(r)),
    );
  }
}