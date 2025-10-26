part of '../drawer_home.dart';

//
final class _CustomAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const _CustomAppbar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, DrawerPageSelected>(
      builder: (context, state) {
        final index = state.index;
        switch (index) {
          case 0:
            return _appbar(AppString.todos, Colors.blue);
          case 1:
            return _appbar(AppString.profile, Colors.red);
          case 2:
            return _appbar(AppString.profile, Colors.orange);
          case 3:
            return _appbar(AppString.profile, Colors.purple);
          default:
            return _appbar(AppString.profile, Colors.blue);
        }
      },
    );
  }

  AppBar _appbar(String data, Color color) {
    return AppBar(
      title: Text(data),
      centerTitle: true,
      backgroundColor: color,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications, color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.bar_chart_rounded, color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.auto_stories,
            color: Colors.deepOrangeAccent,
          ),
        ),
      ],
    );
  }
}
