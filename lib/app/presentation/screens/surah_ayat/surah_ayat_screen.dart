import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslin/app/presentation/components/custom_text.dart';
import 'package:muslin/app/presentation/components/loading_and_error.dart';
import 'package:muslin/app/presentation/components/to_arabic_converter.dart';

import '../../components/surah_arabic_number.dart';
import 'cubit/surah_ayat_cubit.dart';

class SurahAyatScreen extends StatefulWidget {
  const SurahAyatScreen({
    Key? key,
    required this.surahNumber,
  }) : super(key: key);

  final int surahNumber;

  @override
  State<SurahAyatScreen> createState() => _SurahAyatScreenState();
}

class _SurahAyatScreenState extends State<SurahAyatScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var cubit = SurahAyatCubit.get(context);
      await cubit.loadSurahAyat(surahNumber: widget.surahNumber);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<SurahAyatCubit, SurahAyatState>(
        builder: (context, state) {
          var cubit = SurahAyatCubit.get(context);
          return LoadingAndError(
            isError: state is GetSurahAyatErrorState,
            isLoading: state is GetSurahAyatLoadingState,
            child: ListView.separated(
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                final text = cubit.surahAyat.join(
                  "\uFD3F${(index + 1).toString().toArabicNumbers}\uFD3E",
                );

                return CustomText(
                  text: text,
                  textColor: Colors.black,
                  textAlign: TextAlign.justify,
                );
              },
              separatorBuilder: (context, index) {
                return ArabicSuraNumber(
                  i: index,
                );
              },
              itemCount: cubit.surahAyat.length,
            ),
          );
        },
      ),
    );
  }
}
