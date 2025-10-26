import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/product/service/service_locator.dart';
import 'package:flutter_todo_app/product/service/services/version/version_maneger_service.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._versionManagerService) : super(SplashInitial()) {
    checkForUpdates();
  }
  late final VersionManagerService _versionManagerService;

  Future<void> checkForUpdates() async {
    emit(SplashLoading());
    try {
      final isLatest = await _versionManagerService.isLatestVersion();
      emit(SplashLoaded(version: isLatest));
    } on Exception catch (e) {
      locator.logger.e('Error in checkForUpdates: $e');
      emit(SplashError(message: 'Versiyon kontrolü başarısız'));
    }
  }
}
