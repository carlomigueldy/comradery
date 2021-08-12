import 'package:comradery/app.dart';
import 'package:comradery/ui/views/app/app_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MyTeamsTabViewModel extends BaseViewModel {
  final _appViewModel = locator<AppViewModel>();

  AppViewModel get appViewModel => _appViewModel;
}
