import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/services/database_helper/archived_list_database.dart';
import '../../../../../../core/services/database_helper/archived_sura_model.dart';

part 'archives_state.dart';

class ArchivesCubit extends Cubit<ArchivesState> {
  ArchivesCubit() : super(ArchivesInitial());

  static ArchivesCubit get(context) => BlocProvider.of(context);

  List<ArchivedSuraModel> archivedList = [];

  var databaseHelper = ArchivedListDataBaseHelper.db;

  Future<void> getArchivedList() async {
    emit(GetArchivedListLoadingState());
    try {
      archivedList = await databaseHelper.getArchivedList();
      emit(GetArchivedListSuccessState());
    } catch (e) {
      emit(GetArchivedListErrorState());
    }
  }

  Future<void> addProductToCart({
    required ArchivedSuraModel archivedSuraModel,
    required context,
  }) async {
    emit(AddToArchivedListLoadingState());
    try {
      archivedList.add(archivedSuraModel);
      databaseHelper.addAyahToList(archivedSuraModel);

      emit(AddToArchivedListSuccessState());
    } catch (e) {
      emit(AddToArchivedListErrorState());
    }
  }
}
