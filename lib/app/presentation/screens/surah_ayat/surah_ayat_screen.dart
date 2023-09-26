import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslin/app/presentation/components/custom_text.dart';
import 'package:muslin/app/presentation/components/surah_arabic_number.dart';
import 'package:quran/quran.dart';
import 'cubit/surah_ayat_cubit.dart';

// class SurahAyatScreen extends StatefulWidget {
//   const SurahAyatScreen({
//     Key? key,
//     required this.surahNumber,
//   }) : super(key: key);

//   final int surahNumber;

//   @override
//   State<SurahAyatScreen> createState() => _SurahAyatScreenState();
// }

// class _SurahAyatScreenState extends State<SurahAyatScreen> {
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//       var cubit = SurahAyatCubit.get(context);
//       await cubit.loadSurahAyat(surahNumber: widget.surahNumber);
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: BlocBuilder<SurahAyatCubit, SurahAyatState>(
//         builder: (context, state) {
//           var cubit = SurahAyatCubit.get(context);
//           return LoadingAndError(
//             isError: state is GetSurahAyatErrorState,
//             isLoading: state is GetSurahAyatLoadingState,
//             child: ListView.separated(
//               padding: const EdgeInsets.all(15),
//               itemBuilder: (context, index) {
//                 final text = cubit.surahAyat.join(
//                   "\uFD3F${(index + 1).toString().toArabicNumbers}\uFD3E",
//                 );

//                 return CustomText(
//                   text: text,
//                   textColor: Colors.black,
//                   textAlign: TextAlign.justify,
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return ArabicSuraNumber(
//                   i: index,
//                 );
//               },
//               itemCount: cubit.surahAyat.length,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class SurahAyatScreen extends StatefulWidget {
  static const String id = "/SurahAyatScreen";
  final int surahNumber;

  const SurahAyatScreen({Key? key, required this.surahNumber})
      : super(key: key);

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
    int surahIndex = widget.surahNumber;
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<SurahAyatCubit, SurahAyatState>(
        builder: (context, state) {
          //   var cubit = SurahAyatCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: BodyOfSurah(surahNumber: surahIndex - 1),
          );
        },
      ),
    );
  }
}

class BodyOfSurah extends StatelessWidget {
  const BodyOfSurah({
    Key? key,
    required this.surahNumber,
  }) : super(key: key);

  final int surahNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(5),
              ),
              const SizedBox(
                height: 5,
              ),
              RichText(
                textAlign: TextAlign.justify, // count of surah
                text: TextSpan(
                  children: [
                    for (var i = 0;
                        i <= SurahAyatCubit.get(context).surahAyat.length - 1;
                        i++) ...{
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        text: SurahAyatCubit.get(context).surahAyat[i],
                        style: const TextStyle(
                          fontFamily: 'Traditional',
                          fontSize: 24,
                          color: Colors.black87,
                          height: 2,
                        ),
                      ),
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: ArabicSuraNumber(
                            i: i,
                          ))
                    }
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const KhatimaOfSurah(),
            ],
          ),
        ),
      ],
    );
  }
}

class AyahSpanNumberWidget extends StatelessWidget {
  const AyahSpanNumberWidget({
    Key? key,
    required this.i,
  }) : super(key: key);

  final int i;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      child: Text(
        // '$i',
        getVerseEndSymbol(i, arabicNumeral: true),
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(fontSize: 20, color: Colors.white),
      ),
    );
  }
}

class KhatimaOfSurah extends StatelessWidget {
  const KhatimaOfSurah({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: CustomText(
        text: "صدق الله العظيم",
        fontSize: 20,
      ),
    );
  }
}
