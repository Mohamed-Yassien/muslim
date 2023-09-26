import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslin/app/domain/models/surah/surah_model.dart';
import 'package:muslin/app/presentation/components/custom_text.dart';
import 'package:muslin/app/presentation/components/loading_and_error.dart';
import 'package:muslin/core/constants.dart';
import 'cubit/surah_ayat_cubit.dart';

class SurahAyatScreen extends StatefulWidget {
  static const String id = "/SurahAyatScreen";
  final SurahData surahData;

  const SurahAyatScreen({
    Key? key,
    required this.surahData,
  }) : super(key: key);

  @override
  State<SurahAyatScreen> createState() => _SurahAyatScreenState();
}

class _SurahAyatScreenState extends State<SurahAyatScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var cubit = SurahAyatCubit.get(context);
      cubit.surahAyat.clear();
      await cubit.getSurahDetails(
          surahNumber: widget.surahData.number ?? 0,
          surahCount: widget.surahData.numberOfAyahs ?? 0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int surahIndex = widget.surahData.number ?? 0;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: widget.surahData.name ?? "",
          fontSize: 22,
          textColor: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: BlocBuilder<SurahAyatCubit, SurahAyatState>(
        builder: (context, state) {
          return LoadingAndError(
            isError: state is GetSurahAyatErrorState,
            isLoading: state is GetSurahAyatLoadingState,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: BodyOfSurah(
                surahNumber: surahIndex,
                surahCount: widget.surahData.numberOfAyahs ?? 0,
              ),
            ),
          );
        },
      ),
    );
  }
}

class BodyOfSurah extends StatefulWidget {
  const BodyOfSurah({
    Key? key,
    required this.surahNumber,
    required this.surahCount,
  }) : super(key: key);

  final int surahNumber;
  final int surahCount;

  @override
  State<BodyOfSurah> createState() => _BodyOfSurahState();
}

class _BodyOfSurahState extends State<BodyOfSurah> {
  @override
  Widget build(BuildContext context) {
    var cubit = SurahAyatCubit.get(context);
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              const CustomText(
                text: "حجم الخط",
                fontSize: 22,
              ),
              Slider(
                min: 25,
                max: 37.0,
                value: cubit.fontSize,
                activeColor: AppConstance.primaryColor,
                onChanged: (value) {
                  cubit.changeSliderValue(val: value);
                },
              ),
              const Padding(
                padding: EdgeInsets.all(5),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onLongPress: () {},
                child: RichText(
                  textAlign: widget.surahCount <= 20
                      ? TextAlign.center
                      : TextAlign.justify,
                  text: TextSpan(
                    children: [
                      for (var i = 0; i <= widget.surahCount - 1; i++) ...{
                        TextSpan(
                          recognizer: LongPressGestureRecognizer()
                            ..onLongPress = () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(seconds: 1),
                                  backgroundColor: AppConstance.primaryColor,
                                  elevation: 2,
                                  content: CustomText(
                                    text: "تم حفظ الاية بنجاح",
                                    fontSize: 20,
                                    textColor: Colors.white,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          text: SurahAyatCubit.get(context).surahAyat[i],
                          style: TextStyle(
                            fontFamily: 'Traditional',
                            fontSize: cubit.fontSize,
                            color: Colors.black87,
                            height: 2,
                          ),
                        ),
                        WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Image.asset(
                              "assets/icons/star.png",
                              width: 25,
                              height: 25,
                              // color: AppConstance.primaryColor,
                            )
                           
                            ),
                      }
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: "صدق الله العظيم",
                  fontSize: cubit.fontSize,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
