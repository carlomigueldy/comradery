import 'package:comradery/app.dart';
import 'package:comradery/app.logger.dart';
import 'package:comradery/ui/views/app/app_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ConversationsTabViewModel extends BaseViewModel {
  final log = stackedLogger('AppViewModel');
  final _appViewModel = locator<AppViewModel>();

  AppViewModel get appViewModel => _appViewModel;

  Future<void> init() async {
    // await Future.wait([
    //   fetchMyConversations(),
    // ]);
  }
}
