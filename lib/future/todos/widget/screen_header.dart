part of '../todo_view.dart';

final class _TodoViewHeaders extends StatelessWidget {
  const _TodoViewHeaders({
    required this.data,
    this.onPressed,
    this.icon,
  });
  final VoidCallback? onPressed;
  final IconData? icon;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPadding.verticalMedium,
      child: Row(
        children: [
          Text(
            data,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const Spacer(),
          IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
          ),
        ],
      ),
    );
  }
}
