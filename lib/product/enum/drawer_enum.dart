enum AppViews {
  updateVersionView,
  drawerHome,
  events,
  notes,
  settings,
  notifications,
}

extension AppViewsExtension on AppViews {
  String get name {
    switch (this) {
      case AppViews.updateVersionView:
        return 'updateVersionView';
      case AppViews.drawerHome:
        return 'drawerHome';
      case AppViews.events:
        return 'Events';
      case AppViews.notes:
        return 'Notes';
      case AppViews.settings:
        return 'Settings';
      case AppViews.notifications:
        return 'Notifications';
    }
  }
}
