import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  bool isLoading = false;

  addNote(NoteModel note) async {
    isLoading = true;
    emit(AddNoteLoading());
    try {
      // receive our box in notesBox variable
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      isLoading = false;
      emit(AddNoteSuccess());
      // add our note to the box
      await notesBox.add(note);
    } catch (e) {
      isLoading = false;
      emit(AddNoteFailure(e.toString()));
    }
  }
}
