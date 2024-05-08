import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;

  fetchAllNotes() {
    // receive our box in notesBox variable
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    // get all notes from the box
    notes = notesBox.values.toList();
  }
}
