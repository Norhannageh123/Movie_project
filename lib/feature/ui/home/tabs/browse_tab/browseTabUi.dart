import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/ui/home/tabs/browse_tab/browse_movie_card.dart';
import 'package:movie_app/feature/ui/home/tabs/browse_tab/cubit/bowse_tab_state.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_style.dart';
import 'package:movie_app/feature/ui/home/tabs/browse_tab/cubit/browse_tab_cubit.dart';
import 'package:get_it/get_it.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance<BrowseCubit>()..loadInitialMovies(),
      child: const BrowseTabContent(),
    );
  }
}

class BrowseTabContent extends StatefulWidget {
  const BrowseTabContent({super.key});

  @override
  State<BrowseTabContent> createState() => _BrowseTabContentState();
}

class _BrowseTabContentState extends State<BrowseTabContent>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: BlocConsumer<BrowseCubit, BrowseState>(
        listener: (context, state) {
          if (state is BrowseSuccess) {
            _tabController = TabController(
              length: state.genres.length,
              vsync: this,
            );
          }
        },
        builder: (context, state) {
          if (state is BrowseLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is BrowseError) {
            return Center(
              child: Text(
                state.message,
                style: AppStyle.white16Regular,
              ),
            );
          }

          if (state is BrowseSuccess) {
            return Column(
              children: [
                buildGenresTab(state),
                const SizedBox(height: 20),
                buildMoviesGrid(state),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget buildGenresTab(BrowseSuccess state) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.genres.length,
        itemBuilder: (context, index) {
          final genre = state.genres.elementAt(index);
          final isSelected = genre == context.read<BrowseCubit>().selectedGenre;

          return GestureDetector(
            onTap: () {
              context.read<BrowseCubit>().changeSelectedGenre(genre);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.yellowColor : Colors.transparent,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: AppColors.yellowColor, width: 1.5),
              ),
              child: Text(
                genre,
                style: TextStyle(
                  color: isSelected ? Colors.black : AppColors.yellowColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildMoviesGrid(BrowseSuccess state) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: state.movies.length,
        itemBuilder: (context, index) {
          return MovieCard(movie: state.movies[index]);
        },
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
