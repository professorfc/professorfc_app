import 'package:professorfc_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:professorfc_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({
    required this.remoteDataSource,
  });

  final HomeRemoteDataSource remoteDataSource;
}
