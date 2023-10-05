import 'dart:io';

import 'package:docx_to_text/docx_to_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:latex_app/common/constants.dart';
import 'package:latex_app/pages/about_app_page.dart';
import 'package:latex_app/widgets/horizontal_split_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void importFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt', 'docx'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);

      String fileContent;
      if (getFilePath(file.path) == 'txt') {
        fileContent = file.readAsStringSync();
      } else {
        final bytes = file.readAsBytesSync();
        fileContent = docxToText(bytes);
      }
      controller.text = fileContent;
      file.delete();
    }
  }

  String getFilePath(String path) => path.split('.').last.toLowerCase();

  void clearText() {
    if (controller.text.isNotEmpty) {
      controller.clear();
    }
  }

  void openAboutPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AboutAppPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          appTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: clearText,
            icon: const Icon(Icons.close),
            tooltip: clearTooltip,
          ),
          IconButton(
            onPressed: openAboutPage,
            icon: const Icon(Icons.info_outlined),
            tooltip: aboutTooltip,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: importFile,
        label: const Text(fabLabel),
        icon: const Icon(Icons.file_open),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: HorizontalSplitView(
          top: TextField(
            controller: controller,
            minLines: null,
            maxLines: null,
            expands: true,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: inputHint,
              hintStyle: TextStyle(overflow: TextOverflow.visible),
              border: InputBorder.none,
            ),
          ),
          bottom: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListenableBuilder(
              listenable: controller,
              builder: (context, child) => controller.text.isEmpty
                  ? Text(
                      outputHint,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  : TeXView(
                      child: TeXViewDocument(
                        controller.text,
                        style: const TeXViewStyle(
                          textAlign: TeXViewTextAlign.left,
                        ),
                      ),
                      loadingWidgetBuilder: (_) =>
                          const Text(outputLoadingLabel),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
