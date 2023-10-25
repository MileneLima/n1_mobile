import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //get
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  //CREATE
  Future<void> addNote(String note) {
    return notes.add({
      'note': note,
      'timestemp': Timestamp.now(),
    });
  }

  //READ 
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream = 
      notes.orderBy('timestemp', descending: true).snapshots();

    return notesStream;
  }

  //UPDATE
  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  //DELETE  
  Future<void> deleteNote(String docId) {
    return notes.doc(docId).delete();
  }
}