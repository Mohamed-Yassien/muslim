part of 'archives_cubit.dart';

abstract class ArchivesState {}

class ArchivesInitial extends ArchivesState {}

class GetArchivedListLoadingState extends ArchivesState {}

class GetArchivedListSuccessState extends ArchivesState {}

class GetArchivedListErrorState extends ArchivesState {}

class AddToArchivedListLoadingState extends ArchivesState {}

class AddToArchivedListSuccessState extends ArchivesState {}

class AddToArchivedListErrorState extends ArchivesState {}
