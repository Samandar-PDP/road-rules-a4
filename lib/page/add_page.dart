import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _name = TextEditingController();
  final _desc = TextEditingController();
  String _selectedType = "";

  final _picker = ImagePicker();
  XFile? _xFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Rule"),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          _imageSection(),
          TextField(
            controller: _name,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              )
            ),
          )
        ],
      ),
    );
  }
  Widget _imageSection() {
    return InkWell(
      onTap: _showBottom,
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 2)
        ),
        child: SizedBox(
          height: 280,
          child: Center(
            child: _xFile == null ? const Icon(CupertinoIcons.photo) : Image.file(
              File(_xFile?.path ?? "") // -> import qil -> dart:io
            ),
          ),
        ),
      ),
    );
  }
  _showBottom() {
    showCupertinoModalPopup(context: context, builder: (dialogContext) => CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(onPressed: () => _pickImage(ImageSource.gallery), child: const Text("Gallery")),
        CupertinoActionSheetAction(onPressed: () => _pickImage(ImageSource.camera), child: const Text("Camera")),
        CupertinoActionSheetAction(onPressed: () => Navigator.of(context).pop(), isDestructiveAction: true,
            child: const Text("Cancel")),
      ],
    ));
  }
  _pickImage(ImageSource source) async {
    _xFile = null;
    _xFile = await _picker.pickImage(source: source);
    setState(() {

    });
  }
}
