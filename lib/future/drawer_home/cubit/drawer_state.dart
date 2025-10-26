part of 'drawer_cubit.dart';


final class DrawerPageSelected extends Equatable  {
  const DrawerPageSelected(this.index);
  final int index;

  @override
  List<Object?> get props => [index];
}
