part of '../todo_view.dart';

final class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    required this.label,
    required this.isSelected,
    required this.onPressed,
    required this.color,
  });
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final background = isSelected ? color : theme.colorScheme.surface;
    final textColor = isSelected ? Colors.white : theme.colorScheme.onSurface;

    return InkWell(
      borderRadius: ProjectRadius.button,
      onTap: onPressed,
      splashColor: color.withValues(alpha: 0.15),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: ProjectPadding.horizontalMedium.copyWith(
          top: ProjectPadding.small,
          bottom: ProjectPadding.small,
        ),
        decoration: BoxDecoration(
          color: background,
          borderRadius: ProjectRadius.button,
          border: Border.all(
            color: isSelected
                ? color.withValues(alpha: 0.8)
                : Colors.grey.shade300,
            width: 1.2,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: color.withValues(alpha: 0.35),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: isSelected ? 12 : 10,
              height: isSelected ? 12 : 10,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? Colors.white
                      : color.withValues(alpha: 0.5),
                ),
              ),
            ),
            const SizedBox(width: ProjectPadding.small),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: textColor,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
