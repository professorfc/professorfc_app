import 'dart:io';

import 'package:custom_utilities/custom_utilities.dart';

GetIt getItInstance = GetIt.instance;
GetIt root = GetIt.asNewInstance();

void setupRoot() {}

Future setup() async {
  getItInstance.allowReassignment = true;

  // var remoteConfig = await _setupFirebaseRemoteConfig();
  // getItInstance.registerSingleton(remoteConfig);

  // registerSingletonModels(getItInstance);
  // registerSingletonServices(getItInstance);
  // registerSingletonRepositories(getItInstance);
  // registerSingletonDataSources(getItInstance);
  // registerBlocs(getItInstance);

  //_setupRemoteClientRepository();
}

// Future<RemoteConfig> _setupFirebaseRemoteConfig() async {
//   final RemoteConfig remoteConfig = RemoteConfig.instance;
//   await remoteConfig.setDefaults(getRemoteConfigDefault());
//   await remoteConfig.fetchAndActivate();
//   return remoteConfig;
// }

// void _setupRemoteClientRepository() {
//   Dio _dio = Dio();
//   (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//       (HttpClient client) {
//     client.badCertificateCallback =
//         (X509Certificate cert, String host, int port) => true;
//     return client;
//   };

//   getItInstance.registerLazySingleton<RemoteClientRepository>(
//       () => RemoteClientRepository(
//             dio: _dio,
//             url:
//                 //'http://enjoyapi.com.br/graphql/',
//                 //'https://localhost:5001/graphql',
//                 //'https://10.0.2.2:5001/graphql',
//                 getItInstance<RemoteConfig>().getString(url_endpoint),
//             loggerService: getItInstance<LoggerService>(),
//           ));
// }

Future<void> resetInstances() async {
  getItInstance.reset();

  await setup();
}
