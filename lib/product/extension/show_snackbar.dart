import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void showSnackBar(
    String message, {
    bool isError = false,
    Duration duration = const Duration(seconds: 4),
    IconData? icon,
  }) {
    final messenger = ScaffoldMessenger.of(this);
    final theme = Theme.of(this);

    // Icon belirleme: custom icon varsa onu kullan, yoksa default'ları kullan
    final displayIcon =
        icon ?? (isError ? Icons.error_outline : Icons.check_circle_outline);

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                displayIcon,
                color: Colors.white,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: isError
              ? theme.colorScheme.error
              : theme.colorScheme.primary,
          behavior: SnackBarBehavior.floating,
          duration: duration,
          action: SnackBarAction(
            label: 'OK',
            textColor: isError ? theme.colorScheme.onError : Colors.white,
            onPressed: messenger.hideCurrentSnackBar,
          ),
        ),
      );
  }
}

/*
// Default icon (check_circle_outline)
context.showSnackBar('Başarılı!');

// Default error icon (error_outline)
context.showSnackBar('Hata!', isError: true);

// Özel icon
context.showSnackBar('Kaydedildi', icon: Icons.save);

context.showSnackBar('Silindi', icon: Icons.delete_outline);

context.showSnackBar('Bilgi', icon: Icons.info_outline);

context.showSnackBar('Uyarı', icon: Icons.warning_amber_rounded);

// Icon null olarak geçilirse default kullanılır
context.showSnackBar('Mesaj', icon: null); // check_circle_outline gösterir
*/
