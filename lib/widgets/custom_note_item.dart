import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffffcc80),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24, top: 24, left: 16, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                'Note Title',
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  'Note content goes here.',
                  style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontSize: 18,
                  ),
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.black, size: 24),
                onPressed: () {
                  // Handle delete action
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                'July28 , 2025',
                style: TextStyle(
                  color: Colors.black.withOpacity(.4),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
