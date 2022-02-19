import 'package:dartz/dartz.dart';
import 'package:professorfc_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:professorfc_app/features/home/data/models/team_model.dart';
import 'package:professorfc_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({
    required this.remoteDataSource,
  });

  final HomeRemoteDataSource remoteDataSource;

  @override
  Future<Either<TeamModel, Exception>> getTeam() async {
    try {
      var response = await remoteDataSource.getTeam();
      return Left<TeamModel, Exception>(response);
    } on dynamic catch (e) {
      return Right<TeamModel, Exception>(e);
    }
  }

  @override
  Future<Either<List<int>, Exception>> getFormations() async {
    try {
      var response = await remoteDataSource.getFormations();
      return Left<List<int>, Exception>(response);
    } on dynamic catch (e) {
      return Right<List<int>, Exception>(e);
    }
  }
}
