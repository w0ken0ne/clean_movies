import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/constants/translation_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/common/extensions/string_extensions.dart';
import 'package:clean_movies/presentation/blocs/movie_tab/movietab_bloc.dart';
import 'package:clean_movies/presentation/journeys/loading/loading_circle.dart';
import 'package:clean_movies/presentation/journeys/movie_tabs/movie_list_view_widget.dart';
import 'package:clean_movies/presentation/journeys/movie_tabs/tab_title_widget.dart';
import 'package:clean_movies/presentation/widgets/app_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movie_tabbed_constants.dart';

class MovieTabbedWidget extends StatefulWidget {
  const MovieTabbedWidget({Key? key}) : super(key: key);

  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  MovieTabBloc get movieTabbedBloc => BlocProvider.of<MovieTabBloc>(context);
  int currentTabIndex = 0;
  @override
  void initState() {
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: currentTabIndex));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabBloc, MovieTabState>(builder: (context, state) {
      return Padding(
        padding: EdgeInsets.only(top: Sizes.dimen_4.h),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //tabs
                for (var i = 0; i < MovieTabbedConstants.movieTabs.length; i++)
                  TabTitleWidget(
                    title: MovieTabbedConstants.movieTabs[i].title,
                    onTap: () => _onTabTapped(i),
                    isSelected: MovieTabbedConstants.movieTabs[i].index ==
                        state.currentTabIndex,
                  ),
              ],
            ),
            //empty

            if (state is MovieTabLoadError)
              AppErrorWidget(
                errorType: state.errorType,
                onPressed: () => movieTabbedBloc.add(
                    MovieTabChangedEvent(currentTabIndex: currentTabIndex)),
              ),
            //movies pertaining to the current tab
            if (state is MovieTabLoading)
              Expanded(
                child: Center(
                  child: LoadingCircle(
                    size: Sizes.dimen_100.w,
                  ),
                ),
              ),

            if (state is MovieTabChanged)
              state.movies.isEmpty
                  ? Expanded(
                      child: Center(
                        child: Text(TranslationsConstants.noMovies.t(context),
                            style: Theme.of(context).textTheme.subtitle1),
                      ),
                    )
                  : Expanded(
                      child: MovieListViewBuilder(movies: state.movies),
                    ),
          ],
        ),
      );
    });
  }

  void _onTabTapped(int index) {
    //? Study use of context.read to call add
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}
