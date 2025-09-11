part of 'details_cubit.dart';

class DetailsState {
  Character? details;

  DetailsState({this.details});

  DetailsState copyWith({Character? details}) {
    return DetailsState(details: details ?? this.details);
  }
}
