import 'package:flutter/material.dart';
import 'package:muslin/app/domain/models/surah/surah_model.dart';
import 'package:muslin/core/routes/routes.dart';

import '../../../../../core/constants.dart';
import '../../../components/custom_text.dart';

class SurahItem extends StatelessWidget {
  const SurahItem({Key? key, required this.surahData}) : super(key: key);

  final SurahData surahData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.surahAyatScreen,
          arguments: PassIntArguments(
            id: surahData.number ?? 0,
          ),
        );
      },
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppConstance.primaryColor.withOpacity(.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/icons/quran.png",
                    height: 50,
                    width: 50,
                    color: AppConstance.primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            text: surahData.name ?? '',
                          ),
                        ),
                        const Spacer(),
                        CustomText(
                          text: surahData.type ?? '',
                          fontSize: 16,
                          textColor: AppConstance.primaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            text: "رقم السورة : ${surahData.number}",
                            fontSize: 14,
                            textColor: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        CustomText(
                          text: "عدد اياتها : ${surahData.numberOfAyahs}",
                          fontSize: 14,
                          textColor: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
