import 'package:movie_app/domain/details/repositories/repo/details_repo.dart';

class DetailsUseCase{

  ///business logic
  ///must know the repo
  DetailsRepo detailsRepo;
  DetailsUseCase({required this.detailsRepo});//constructor injection
  void invokeCachingMovie(){
    detailsRepo.cachingMovie();
  }
  getCachingMovie(){
    return detailsRepo.getCachingMovie();
  }
}