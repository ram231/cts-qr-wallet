part of 'covid_tracker_cubit.dart';

abstract class CovidTrackerState extends Equatable {
  const CovidTrackerState();

  @override
  List<Object> get props => [];
}

class CovidTrackerInitial extends CovidTrackerState {}

class CovidTrackerLoading extends CovidTrackerState {}

class CovidTrackerLoaded extends CovidTrackerState {
  final String error;
  final List<CovidTracker> tracker;
  CovidTrackerLoaded({
    this.error,
    this.tracker,
  });
  @override
  List<Object> get props => [error, tracker];
  CovidTracker get cases {
    if (tracker?.isEmpty ?? true) {
      return null;
    }
    return tracker.fold(null, (prev, curr) {
      if (prev == null) {
        return curr;
      }
      return prev.copyWith(
        confirmedAdmitted: prev.confirmedAdmitted + curr.confirmedAdmitted,
        confirmedCases: prev.confirmedCases + curr.confirmedCases,
        confirmedDeath: prev.confirmedDeath + curr.confirmedDeath,
      );
    });
  }

  CovidTrackerLoaded copyWith({
    String error,
    List<CovidTracker> tracker,
  }) {
    return CovidTrackerLoaded(
      error: error ?? this.error,
      tracker: tracker ?? this.tracker,
    );
  }
}

class CovidTrackerError extends CovidTrackerState {
  final String error;
  CovidTrackerError({
    this.error,
  });
  @override
  List<Object> get props => [error];

  CovidTrackerError copyWith({
    String error,
  }) {
    return CovidTrackerError(
      error: error ?? this.error,
    );
  }
}
