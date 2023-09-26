import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/quraan/quraan_model.dart';
import 'package:quran/quran.dart' as quran;

part 'surah_ayat_state.dart';

class SurahAyatCubit extends Cubit<SurahAyatState> {
  SurahAyatCubit() : super(SurahAyatInitial());

  static SurahAyatCubit get(context) => BlocProvider.of(context);

  QuraanModel? quraanModel;
  List<String> surahAyat = [];

  // Future<void> loadSurahAyat({
  //   required int surahNumber,
  // }) async {
  //   surahAyat.clear();
  //   emit(GetSurahAyatLoadingState());
  //   try {
  //     final String jsonString =
  //         await rootBundle.loadString('assets/json/quraan.json');
  //     final Map<String, dynamic> jsonList = json.decode(jsonString);
  //     quraanModel = QuraanModel.fromJson(jsonList);
  //     quraanModel?.quran?.forEach(
  //       (element) {
  //         if (element.suraNo == surahNumber) {
  //           surahAyat.add(element.ayaTextEmlaey ?? '');
  //           debugPrint('dd ${element.ayaTextEmlaey}');
  //         }
  //         debugPrint('ayat is $surahAyat');
  //       },
  //     );
  //     debugPrint('model is $jsonList');
  //     emit(GetSurahAyatSuccessState());
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     emit(GetSurahAyatErrorState());
  //   }
  // }

  Future<void> getSurahDetails(
      {required int surahNumber,
      required int surahCount,
      bool verseEndSymbol = false}) async {
    emit(GetSurahAyatLoadingState());
    try {
      for (int i = 1; i <= surahCount; i++) {
        surahAyat.add(
          quran.getVerse(
            surahNumber,
            i,
            verseEndSymbol: verseEndSymbol,
          ),
        );
      }

      emit(GetSurahAyatSuccessState());
    } catch (error) {
      emit(GetSurahAyatErrorState());
    }
  }

  double fontSize = 22;

  changeSliderValue({
    required double val,
  }) {
    fontSize = val;
    emit(ChangeSliderValueState());
  }
}
