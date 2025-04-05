

import 'package:audio_service/audio_service.dart';
import 'package:essa/audio_helpers/page_manager.dart';
import 'package:get_it/get_it.dart';

import 'audio_handler.dart';

GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
   getIt.registerSingleton<AudioHandler>( await initAudioService() );
   getIt.registerLazySingleton<PageManager>( () => PageManager() );
}