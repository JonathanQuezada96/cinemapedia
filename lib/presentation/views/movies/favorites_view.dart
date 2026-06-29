import 'package:cinemapedia/presentation/providers/storage/favorite_movies_provider.dart';
import 'package:cinemapedia/presentation/widgets/movies/movies_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key });

  @override
  ConsumerState<FavoritesView> createState() => _FavoritesViewState();
  
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    ref.read(favoritesMoviesProvider.notifier).loadNextPage();
    // scrollController.addListener((){
    //   if(widget.loadNextPage == null){
    //     return;
    //   }
    //   if (scrollController.position.pixels + 200 >=
    //       scrollController.position.maxScrollExtent) {
    //     widget.loadNextPage!();
    //   }
    // });
  }
  @override
  Widget build(BuildContext context) {
    final favoritesMovies = ref.watch(favoritesMoviesProvider);
    final myMovieList = favoritesMovies.values.toList();
    // final myMovies = favoritesMovies.values.toList();

    return Scaffold(
      body:   MovieMasonry(
        movies: myMovieList,
        loadNextPage: () =>  ref.read(favoritesMoviesProvider.notifier).loadNextPage(),
      
      )
    );
  }
}