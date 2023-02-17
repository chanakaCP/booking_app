import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/home_repository/home_feature_repository.dart';
import 'home_feature.dart';

class HomeFeatureBlock extends Bloc<HomeFeatureEvent, HomeFeatureState> {
  final HomeFeatureRepository _homeFeatureRepository;

  HomeFeatureBlock(this._homeFeatureRepository) : super(HomeFeatureLoadingState()) {
    on<LoadHomeFeatureEvent>((event, emit) async {
      emit(HomeFeatureLoadingState());

      try {
        final hotelList = await _homeFeatureRepository.getAllHotels();

        if (hotelList.isEmpty) {
          emit(HomeFeatureEmptyState());
        } else {
          emit(HomeFeatureLoadedState(hotelList));
        }
      } catch (e) {
        emit(HomeFeatureErrorState(e.toString()));
      }
    });

    on<ReloadHomeFeatureEvent>((event, emit) async {
      emit(HomeFeatureLoadingState());
      try {
        final hotelList = await _homeFeatureRepository.getAllHotels();
        if (hotelList.isEmpty) {
          emit(HomeFeatureEmptyState());
        } else {
          emit(HomeFeatureLoadedState(hotelList));
        }
      } catch (e) {
        emit(HomeFeatureErrorState(e.toString()));
      }
    });
  }
}
