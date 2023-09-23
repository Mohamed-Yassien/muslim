import 'package:flutter/material.dart';
import 'package:muslin/app/presentation/components/custom_text.dart';
import 'package:muslin/app/presentation/screens/surahs/widgets/surah_search.dart';
import 'package:muslin/core/constants.dart';

class SurahsScreen extends StatefulWidget {
  const SurahsScreen({Key? key}) : super(key: key);

  @override
  State<SurahsScreen> createState() => _SurahsScreenState();
}

class _SurahsScreenState extends State<SurahsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          const SurahSearch(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Card(
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
                                children: const [
                                  Expanded(
                                    child: CustomText(
                                      text: "الفاتحة",
                                    ),
                                  ),
                                  Spacer(),
                                  CustomText(
                                    text: "مكية",
                                    fontSize: 16,
                                    textColor: AppConstance.primaryColor,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: const [
                                  Expanded(
                                    child: CustomText(
                                      text: "رقم السورة : 1",
                                      fontSize: 14,
                                      textColor: Colors.grey,
                                    ),
                                  ),
                                  Spacer(),
                                  CustomText(
                                    text: "عدد اياتها : 200",
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
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
