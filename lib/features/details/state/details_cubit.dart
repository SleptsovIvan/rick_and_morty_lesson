import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_lesson/models/character/character.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsState(details: null));
}
