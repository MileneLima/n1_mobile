import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:n1_mobile/services/firestore.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final FirestoreService firestoreService = FirestoreService();

  final TextEditingController textController = TextEditingController();

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void openNoteBox({String? docID}) {
    String initialText = docID == null ? "" : textController.text;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(docID == null ? "Adicionar Nota" : "Editar Nota"),
        content: TextField(
          controller: textController,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              String noteText = textController.text.trim();
              if (noteText.isNotEmpty) {
                if (docID == null) {
                  firestoreService.addNote(noteText);
                  showMessage("Nota adicionada com sucesso: $noteText");
                } else {
                  firestoreService.updateNote(docID, noteText);
                  showMessage("Nota atualizada com sucesso: $noteText");
                }
                textController.clear();
                Navigator.pop(context);
              } else {
                showMessage("O texto da nota não pode estar vazio.");
              }
            },
            child: Text("Salvar"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;
            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = notesList[index];
                String docID = document.id;

                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String noteText = data['note'];
                return ListTile(
                    title: Text(noteText),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => openNoteBox(docID: docID),
                          icon: const Icon(Icons.settings),
                        ),
                        IconButton(
                          onPressed: () {
                            firestoreService.deleteNote(docID);
                            showMessage("Nota excluída com sucesso");
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ));
              },
            );
          } else {
            return const Text("Sem notas...");
          }
        },
      ),
    );
  }
}
