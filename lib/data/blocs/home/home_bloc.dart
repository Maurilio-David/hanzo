import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hanzo/data/models/models.dart';
import '../../repositories/repositories.dart';

part 'home.event.dart';
part 'home.state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;
  List<Movie> list = [];

  HomeBloc(this._repository) : super(HomeInitialState()) {
    on<GetMovies>(_onGetMovies);
  }

  void _onGetMovies(GetMovies event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      final movies = await _repository.getMovie();
      list = movies;
      emit(HomeLoadedState(movies: movies));
    } catch (error) {
      emit(const HomeErrorState(message: 'Failed to load movies'));
    }
  }
}
