import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/quraan/quraan_model.dart';
import 'package:quran/quran.dart' as quran;

part 'surah_ayat_state.dart';

class SurahAyatCubit extends Cubit<SurahAyatState> {
  SurahAyatCubit() : super(SurahAyatInitial());

  static SurahAyatCubit get(context) => BlocProvider.of(context);

  QuraanModel? quraanModel;
  List<String> surahAyat = [];

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
