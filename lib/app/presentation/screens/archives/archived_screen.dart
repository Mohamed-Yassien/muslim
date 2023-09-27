import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslin/app/domain/models/surah/surah_model.dart';
import 'package:muslin/app/presentation/components/custom_text.dart';
import 'package:muslin/app/presentation/components/loading_and_error.dart';
import 'package:muslin/core/constants.dart';

import '../../../../core/routes/routes.dart';
import 'cubit/cubit/archives_cubit.dart';

class ArchivedListScreen extends StatefulWidget {
  const ArchivedListScreen({Key? key}) : super(key: key);

  @override
  State<ArchivedListScreen> createState() => _ArchivedListScreenState();
}

class _ArchivedListScreenState extends State<ArchivedListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var cubit = ArchivesCubit.get(context);
      await cubit.getArchivedList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ArchivesCubit, ArchivesState>(
        builder: (context, state) {
          var cubit = ArchivesCubit.get(context);
          return LoadingAndError(
            isLoading: state is GetArchivedListLoadingState,
            isError: state is GetArchivedListErrorState,
            child: ReorderableListView(
              padding: const EdgeInsets.all(15),
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  final item = cubit.archivedList.removeAt(oldIndex);
                  cubit.archivedList.insert(newIndex, item);
                });
              },
              children: List.generate(
                cubit.archivedList.length,
                (index) {
                  final item = cubit.archivedList[index];
                  return Card(
                    color: AppConstance.primaryColor,
                    key: Key('${Random().nextInt(1000000) + index} '),
                    elevation: 2,
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.surahAyatScreen,
                          arguments: PassModel(
                            surahData: SurahData(
                              type: item.type,
                              name: item.name,
                              number: item.number,
                              numberOfAyahs: item.numberOfAyahs,
                            ),
                            isFromArchives: true,
                            index: item.suraIndex,
                          ),
                        );
                      },
                      title: CustomText(
                        text: item.content ?? '',
                        textColor: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
