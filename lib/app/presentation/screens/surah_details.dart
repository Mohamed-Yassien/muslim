
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:quran/quran.dart' as quran;
// import 'package:quran/quran.dart';
// import '../../../../core/widgets/custom_app_bar_widget.dart';
// import '../../controller/quran_controller.dart';
// import '../../controller/quran_states.dart';
// import '../../model/surah_model.dart';
// import '../widgets/custom_bottom_sheet.dart';

// class SurahDetails extends StatelessWidget {
//   static const String id = "/SurahDetails";
//   final Surah? surah;
//   final int? surahNumber;
//   const SurahDetails({Key? key, this.surah, this.surahNumber})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     QuranController controller = QuranController.get(context);
//     int surahCount = surah!.versesCount;
//     int surahIndex = surah!.id;
//     controller.getSurahDetails(
//         surahNumber: surahIndex, surahCount: surahCount, verseEndSymbol: false);
//     return Scaffold(
//       appBar: CustomAppBarWidget(
//         actions: [
//           Padding(
//             padding: EdgeInsetsDirectional.only(end: 20.sp),
//             child: BlocConsumer<QuranController, QuranStates>(
//                 listener: (context, state) {},
//                 builder: (context, state) {
//                   return IconButton(
//                       onPressed: () async {
//                         await controller.runSurahVoice(surahNumber: surahIndex);
//                       },
//                       padding: EdgeInsets.zero,
//                       icon: Icon(
//                         controller.isSurahRunning
//                             ? Icons.pause
//                             : Icons.play_arrow,
//                         color: Colors.white,
//                       ));
//                 }),
//           ),
//         ],
//         titleWidget: Text("${LocaleKeys.surah.tr()} ${surah!.arabicName}"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: BodyOfSurah(surahCount: surahCount, surahNumber: surahIndex),
//       ),
//     );
//   }
// }

// class BodyOfSurah extends StatelessWidget {
//   const BodyOfSurah({
//     Key? key,
//     required this.surahCount,
//     required this.surahNumber,
//   }) : super(key: key);

//   final int surahCount;
//   final int surahNumber;

//   @override
//   Widget build(BuildContext context) {
//     QuranController controller = QuranController.get(context);

//     return Column(
//       children: [
//         if (surahNumber != 1 &&
//             surahNumber != 9) //!for surah alfatiha and surah altwba
//           Text(QuranController.get(context).getBasmala()),
//         Expanded(
//           child: ListView(
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(5),
//               ),
//               SizedBox(
//                 height: 5.h,
//               ),
//               BlocConsumer<QuranController, QuranStates>(
//                   listener: (context, state) {},
//                   builder: (context, state) {
//                     return RichText(
//                       textAlign: surahCount <= 20
//                           ? TextAlign.center
//                           : TextAlign.justify, // count of surah
//                       text: TextSpan(
//                         children: [
//                           for (var i = 1; i <= surahCount; i++) ...{
//                             TextSpan(
//                               recognizer: TapGestureRecognizer()
//                                 ..onTap = () {
//                                   controller.getAyahTranslation(
//                                       surahNumber: surahNumber,
//                                       verseNumber: i,
//                                       verseEndSymbol: false);

//                                   controller.getAyahTafseer(
//                                     surahNumber: surahNumber,
//                                     verseNumber: i,
//                                   );
//                                   showBottomSheet(
//                                     clipBehavior: Clip.antiAliasWithSaveLayer,
//                                     enableDrag: true,
//                                     context: context,
//                                     builder: (context) {
//                                       return CustomBottomSheet(
//                                         ayah: "$surahNumber,$i",
//                                       );
//                                     },
//                                   );
//                                 },
//                               text:
//                                   ' ${quran.getVerse(surahNumber, i, verseEndSymbol: false)} ',
//                               style: TextStyle(
//                                 // fontFamily: 'Kitab',
//                                 fontSize: 25,
//                                 color: controller.selectedAyat
//                                         .contains("$surahNumber,$i")
//                                     ? Colors.red
//                                     : Colors.black87,
//                               ),
//                             ),
//                             WidgetSpan(
//                               alignment: PlaceholderAlignment.middle,
//                               child: quran.isSajdahVerse(surahNumber, i)
//                                   ? Wrap(
//                                       children: [
//                                         AppImages.drawSvg(
//                                           svg: AppImages.sajda2,
//                                           width: 16.sp,
//                                           height: 16.sp,
//                                         ),
//                                         SizedBox(
//                                           width: 3.w,
//                                         ),
//                                         AyahSpanNumberWidget(i: i),
//                                       ],
//                                     )
//                                   : AyahSpanNumberWidget(i: i),
//                             )
//                           }
//                         ],
//                       ),
//                     );
//                   }),
//               SizedBox(
//                 height: 20.h,
//               ),
//               const KhatimaOfSurah(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class AyahSpanNumberWidget extends StatelessWidget {
//   const AyahSpanNumberWidget({
//     Key? key,
//     required this.i,
//   }) : super(key: key);

//   final int i;

//   @override
//   Widget build(BuildContext context) {
//     return CircleAvatar(
//       radius: 16,
//       child: Text(
//         // '$i',
//         getVerseEndSymbol(i, arabicNumeral: true),
//         textAlign: TextAlign.center,
//         // textScaleFactor: i.toString().length <= 2
//         //     ? 1
//         //     : .8, //to handle ayah number widget when be more than 2 numbers
//         style: Theme.of(context)
//             .textTheme
//             .bodyText2!
//             .copyWith(fontSize: 20.sp, color: Colors.white),
//       ),
//     );
//   }
// }

// class KhatimaOfSurah extends StatelessWidget {
//   const KhatimaOfSurah({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: Text(
//         "صدق الله العظيم",
//         style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 25.sp),
//       ),
//     );
//   }
// }
