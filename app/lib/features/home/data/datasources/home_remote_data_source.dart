import 'package:custom_utilities/custom_utilities.dart';
import 'package:professorfc_app/features/home/data/models/player_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<PlayerModel>> getPlayers();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl(this.remoteClientRepository);

  final RemoteClientRepository remoteClientRepository;

  @override
  Future<List<PlayerModel>> getPlayers() {
    // TODO: implement getPlayers
    throw UnimplementedError();
  }
}
