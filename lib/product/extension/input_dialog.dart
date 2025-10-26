import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

class InputDialog extends StatelessWidget {
  const InputDialog({required this.title, super.key, this.buttonText});

  final String title;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return AlertDialog(
      title: Text(title),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: 'Kategori adını girin',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, controller.text);
          },
          child: Text(buttonText ?? 'Kaydet'),
        ),
      ],
    );
  }

  static Future<CategoryModel> show(
    BuildContext context, {
    required String title,
    String? buttonText,
    int? colorCode,
  }) async {
    final result = await showDialog<String>(
      context: context,
      builder: (_) => InputDialog(title: title, buttonText: buttonText),
    );
    return CategoryModel(
      id: UniqueKey().toString(),
      name: result ?? '',
      colorCode: colorCode ?? 0xFF0000FF,
    ); // kullanıcı metin girip "Gönder"e bastıysa text gelir
  }
}
