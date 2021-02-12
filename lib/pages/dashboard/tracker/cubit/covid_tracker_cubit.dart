import 'package:bloc/bloc.dart';
import 'package:cts_qr_wallet/models/tracker/tracker.dart';
import 'package:cts_qr_wallet/pages/dashboard/tracker/repository/repository.dart';
import 'package:equatable/equatable.dart';

part 'covid_tracker_state.dart';

class CovidTrackerCubit extends Cubit<CovidTrackerState> {
  CovidTrackerCubit({TrackerInterface repository})
      : _repository = repository ?? TrackerRepository(),
        super(CovidTrackerInitial());
  final TrackerInterface _repository;
  void fetch() async {
    try {
      final result = await _repository.findAll();
      emit(CovidTrackerLoaded(tracker: result));
    } catch (e) {
      emit(CovidTrackerError(error: 'Something went wrong: ${e}'));
    }
  }
}
