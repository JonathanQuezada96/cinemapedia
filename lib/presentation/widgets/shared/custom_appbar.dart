import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemapedia/presentation/providers/search/search_movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final initialMovies = ref.read(searchedMoviesProvider);
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.movie_outlined, color: colors.primary),
                const SizedBox(width: 5),
                Text(
                  "Cinemapedia",
                  style: titleStyle?.copyWith(color: colors.primary),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    // final searchQuery  = ref.read(searchQueryProvider);
                    final searchQuery = ref.read(searchQueryProvider);

                    showSearch(
                      query: searchQuery,
                      context: context,
                      delegate: SearchMovieDelegate(
                        initialMovies: searchQuery.isNotEmpty ? initialMovies : [],
                        searchMovies: ref.read(searchedMoviesProvider.notifier).searchMoviesByQuery
                      ),
                    );
                  },
                  icon: const Icon(Icons.search_outlined),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
