import 'package:comradery/app.dart';
import 'package:comradery/app.logger.dart';
import 'package:comradery/matching/models/matching.dart';
import 'package:comradery/matching/services/matching_service.dart';
import 'package:comradery/ui/views/app/app_viewmodel.dart';
import 'package:postgrest/postgrest.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MyMatchesTabViewModel extends BaseViewModel {
  final log = stackedLogger('MyMatchesTabViewModel');
  final _matchingService = locator<MatchingService>();
  final _appViewModel = locator<AppViewModel>();
  final _router = locator<NavigationService>();

  AppViewModel get appViewModel => _appViewModel;
}
