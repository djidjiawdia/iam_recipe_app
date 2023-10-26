import 'package:flutter/material.dart';

class DialogBoxWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;

  const DialogBoxWidget(
      {super.key, required this.controller, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nouveau ingredient'),
      content: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text('Nom')),
      ),
      actions: [
        ElevatedButton(onPressed: () => onSave(), child: const Text("Ajouter")),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text("Annuler"),
        ),
      ],
    );
  }
}
