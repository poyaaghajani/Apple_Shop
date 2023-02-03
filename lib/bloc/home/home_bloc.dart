import 'package:bloc/bloc.dart';
import 'package:book_shop/bloc/home/home_event.dart';
import 'package:book_shop/bloc/home/home_state.dart';
import 'package:book_shop/data/repository/banner_repository.dart';
import 'package:book_shop/di/di.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository = locator.get();
  HomeBloc() : super(HomeInitState()) {
    on<HomeGetInitData>((event, emit) async {
      emit(HomeLoadingState());

      var bannerList = await _bannerRepository.getBanners();
      emit(HomeRequestSuccessState(bannerList));
    });
  }
}
