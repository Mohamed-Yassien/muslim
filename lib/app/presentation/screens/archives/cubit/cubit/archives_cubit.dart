import 'package:flutter_bloc/flutter_bloc.dart';

part 'archives_state.dart';

class ArchivesCubit extends Cubit<ArchivesState> {
  ArchivesCubit() : super(ArchivesInitial());

  static ArchivesCubit get(context) => BlocProvider.of(context);
}
