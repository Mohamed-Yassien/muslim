import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslin/app/presentation/screens/surahs/cubit/surahs_cubit.dart';

import '../../../components/textfield.dart';

class SurahSearch extends StatelessWidget {
  const SurahSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      radius: 8,
      textSize: 13,
      hintSize: 12,
      isFill: true,
      fillColor: Colors.white,
      onChange: (val) {
        if (val.isEmpty) {
          context.read<SurahsCubit>().deleteFilters();
        } else {
          context.read<SurahsCubit>().filterCategoryProductsWithName(
                name: val,
              );
        }
      },
      suffixIcon: const Padding(
        padding: EdgeInsets.only(
          right: 20.0,
          top: 10,
          bottom: 10,
          left: 8,
        ),
        child: Icon(
          Icons.search,
          size: 20,
        ),
      ),
      hintText: 'ابحث عما تريد ...',
      hintColor: Colors.grey,
    );
  }
}
