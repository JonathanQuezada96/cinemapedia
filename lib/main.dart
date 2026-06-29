import 'package:cinemapedia/config/database/database.dart';
import 'package:flutter/material.dart';

import 'package:cinemapedia/config/router/app_route.dart';
import 'package:cinemapedia/config/theme/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await db.into(db.favoriteMovies).insert(FavoriteMoviesCompanion.insert(
  //   movieId: 1, 
  //   backdropPath: 'backdropPath.png', 
  //   originalTitle: 'originalTitle', 
  //   posterPath: 'posterPath', 
  //   title: 'title',
    
  //   ));
  // await (db.delete(db.favoriteMovies)).go();
  final movies = await db.select(db.favoriteMovies).get();
  print(movies);
  await dotenv.load(fileName: ".env");
  await initializeDateFormatting('es_MX');
  runApp(const ProviderScope(child: MainApp()));
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
