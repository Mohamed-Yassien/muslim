import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/surah/surah_model.dart';

part 'surahs_state.dart';

class SurahsCubit extends Cubit<SurahsState> {
  SurahsCubit() : super(SurahsInitial());

  static SurahsCubit get(context) => BlocProvider.of(context);

  SurahModel? surahModel;
  List<SurahData> surahs = [];

  Future<void> loadSurahs() async {
    emit(GetSurahsLoadingState());
    try {
      final String jsonString =
          await rootBundle.loadString('assets/json/surahs.json');
      final Map<String, dynamic> jsonList = json.decode(jsonString);
      surahModel = SurahModel.fromJson(jsonList);
      surahs = surahModel?.surahData ?? [];
      debugPrint('model is $jsonList');
      emit(GetSurahsSuccessState());
    } catch (e) {
      debugPrint(e.toString());
      emit(GetSurahsErrorState());
    }
  }

  void filterCategoryProductsWithName({required String name}) {
    List<SurahData> filteredData = [];
    if (name.isNotEmpty) {
      for (var surah in surahModel!.surahData!) {
        if (surah.name!.contains(name)) {
          filteredData.add(surah);
        }
      }
      surahs = filteredData;
      emit(SearchSuccessState());
    }
  }

  void deleteFilters() {
    surahs = surahModel?.surahData ?? [];
    emit(SearchSuccessState());
  }
}
