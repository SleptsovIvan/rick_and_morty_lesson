part of 'home_cubit.dart';

class HomeState {
  bool isPending;
  List<Character> characters;
  String? errorMessage;
  int currentPage;
  int totalPages;
  bool isAllLoaded;
  bool isLoadingMore;

  HomeState({
    required this.isPending,
    required this.characters,
    required this.errorMessage,
    required this.currentPage,
    required this.totalPages,
    required this.isAllLoaded,
    required this.isLoadingMore,
  });

  HomeState copyWith({
    bool? isPending,
    List<Character>? characters,
    String? errorMessage,
    int? currentPage,
    int? totalPages,
    bool? isAllLoaded,
    bool? isLoadingMore,
  }) {
    return HomeState(
      isPending: isPending ?? this.isPending,
      characters: characters ?? this.characters,
      errorMessage: errorMessage ?? this.errorMessage,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      isAllLoaded: isAllLoaded ?? this.isAllLoaded,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}
