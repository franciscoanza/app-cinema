import 'package:cinema/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const name = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNetxPage();
    ref.read(popularMoviesProvider.notifier).loadNetxPage();
    ref.read(topRatedMoviesProvider.notifier).loadNetxPage();
    ref.read(upcomingMoviesProvider.notifier).loadNetxPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  MoviesSlideshow(
                    movies: slideShowMovies,
                  ),
                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En cines',
                    subtitle: 'Lunes 20',
                    loadNextPage: () => ref
                        .read(nowPlayingMoviesProvider.notifier)
                        .loadNetxPage(),
                  ),
                  MovieHorizontalListview(
                    movies: popularMovies,
                    title: 'Populares',
                    subtitle: 'xd',
                    loadNextPage: () =>
                        ref.read(popularMoviesProvider.notifier).loadNetxPage(),
                  ),
                  MovieHorizontalListview(
                    movies: topRatedMovies,
                    title: 'topRated',
                    subtitle: 'xd2',
                    loadNextPage: () => ref
                        .read(topRatedMoviesProvider.notifier)
                        .loadNetxPage(),
                  ),
                  MovieHorizontalListview(
                    movies: upcomingMovies,
                    title: 'Upcoming',
                    subtitle: 'xd3',
                    loadNextPage: () => ref
                        .read(upcomingMoviesProvider.notifier)
                        .loadNetxPage(),
                  ),
                ],
              );
            },
            childCount: 1,
          ),
        )
      ],
    );
  }
}
