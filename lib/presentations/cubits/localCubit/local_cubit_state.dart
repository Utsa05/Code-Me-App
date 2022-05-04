part of 'local_cubit_cubit.dart';

abstract class LocalCubitState extends Equatable {
  const LocalCubitState();

  @override
  List<Object> get props => [];
}

class LocalCubitInitial extends LocalCubitState {}

class LocalCubitLoadingState extends LocalCubitState {}

class LocalCubitSuccessState extends LocalCubitState {}

class FetchedLanguageState extends LocalCubitState {
  final List<LanguageItemEntity> languageList;

  const FetchedLanguageState(this.languageList);
}

class LocalErrorState extends LocalCubitState {
  final String message;

  const LocalErrorState(this.message);
}

class LocalCubitSearchedEmptyState extends LocalCubitState {}
