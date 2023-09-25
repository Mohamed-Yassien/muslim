import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslin/app/presentation/screens/surahs/cubit/surahs_cubit.dart';
import 'package:muslin/app/presentation/screens/surahs/widgets/surah_item.dart';
import 'package:muslin/app/presentation/screens/surahs/widgets/surah_search.dart';

import '../../components/loading_and_error.dart';

class SurahsScreen extends StatefulWidget {
  const SurahsScreen({Key? key}) : super(key: key);

  @override
  State<SurahsScreen> createState() => _SurahsScreenState();
}

class _SurahsScreenState extends State<SurahsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahsCubit, SurahsState>(
      builder: (context, state) {
        var cubit = SurahsCubit.get(context);
        return LoadingAndError(
          isLoading: state is GetSurahsLoadingState,
          isError: state is GetSurahsErrorState,
          child: Padding(
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
                      return SurahItem(
                        surahData: cubit.surahs[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: cubit.surahs.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
