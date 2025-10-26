part of '../drawer_home.dart';

final class _CustomDrawer extends StatelessWidget {
  const _CustomDrawer();

  // Menü öğeleri ekleme
  static const List<_DrawerMenuItem> _menuItems = [
    _DrawerMenuItem(
      icon: Icons.note_add_outlined,
      title: AppString.todos,
      index: 0,
    ),
    _DrawerMenuItem(icon: Icons.person, title: AppString.profile, index: 1),
    _DrawerMenuItem(icon: Icons.person, title: AppString.profile, index: 2),
    _DrawerMenuItem(icon: Icons.person, title: AppString.profile, index: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer Header bölümü
          const _DrawerHeaderSection(),

          // Menü öğeleri
          ..._menuItems.map((item) => _DrawerTile(item: item)),
        ],
      ),
    );
  }
}

final class _DrawerTile extends StatelessWidget {
  const _DrawerTile({required this.item});

  final _DrawerMenuItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(item.icon),
      title: Text(item.title),
      onTap: () {
        Navigator.pop(context);
        context.read<DrawerCubit>().selectPage(item.index);
      },
    );
  }
}

final class _DrawerHeaderSection extends StatelessWidget {
  const _DrawerHeaderSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DrawerHeader(
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.image.akkilisletme.image(
            width: 80,
            height: 80,
            package: 'gen',
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

final class _DrawerMenuItem {
  const _DrawerMenuItem({
    required this.icon,
    required this.title,
    required this.index,
  });

  final IconData icon;
  final String title;
  final int index;
}
