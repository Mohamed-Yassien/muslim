part of 'surahs_cubit.dart';

abstract class SurahsState {}

class SurahsInitial extends SurahsState {}

class GetSurahsLoadingState extends SurahsState {}

class GetSurahsSuccessState extends SurahsState {}

class GetSurahsErrorState extends SurahsState {}

class SearchSuccessState extends SurahsState {}
