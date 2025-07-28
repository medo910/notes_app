import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 32),
          CustomTextField(hintText: 'Title'),
          SizedBox(height: 16),
          CustomTextField(hintText: 'Content', maxLines: 5),
          ElevatedButton(
            onPressed: () {
              // Logic to add a new note
              Navigator.pop(context); // Close the sheet after adding
            },
            child: const Text('Add Note'),
          ),
        ],
      ),
    );
  }
}
