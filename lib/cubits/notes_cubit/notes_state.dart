part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesLoading extends NotesState {}

final class NotesSuccesss extends NotesState {
  List<NoteModel> notes;
  NotesSuccesss(this.notes);
}

final class NotesFailure extends NotesState {
  final String errmassage;

  NotesFailure(this.errmassage);
}
