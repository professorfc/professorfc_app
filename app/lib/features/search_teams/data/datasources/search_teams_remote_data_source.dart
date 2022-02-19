import 'package:custom_utilities/custom_utilities.dart';

abstract class SearchTeamsRemoteDataSource {
  //TODO:implement methods here
}

class SearchTeamsRemoteDataSourceImpl implements SearchTeamsRemoteDataSource {
  SearchTeamsRemoteDataSourceImpl(this.remoteClientRepository);

  final RemoteClientRepository remoteClientRepository;
}
