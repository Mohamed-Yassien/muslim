import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslin/app/presentation/components/custom_text.dart';
import 'package:muslin/app/presentation/components/loading_and_error.dart';

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
                  return ListTile(
                    key: Key('$item'),
                    title: CustomText(
                      text: item.content ?? '',
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
