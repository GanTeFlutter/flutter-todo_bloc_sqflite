
import 'package:flutter/material.dart';

abstract class DialogBase {
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
  }) {
    return showDialog<T>(
      context: context,
      builder: builder,
    );
  }
}

/// Show an information dialog
final class InfoDialog extends StatelessWidget {
  /// Constructor for dialog
  const InfoDialog({
    required this.title,
    required this.content,
    this.buttonText,
    super.key,
  });

  /// Title for the dialog
  final String title;

  /// Content message for the dialog
  final String content;

  /// Custom button text (defaults to "OK")
  final String? buttonText;

  /// Show the dialog for page info
  static Future<void> show(
    BuildContext context, {
    required String title,
    required String content,
    String? buttonText,
  }) async {
    await DialogBase.show<void>(
      context: context,
      builder: (context) => InfoDialog(
        title: title,
        content: content,
        buttonText: buttonText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(buttonText ?? 'OK'),
        ),
      ],
    );
  }
}
