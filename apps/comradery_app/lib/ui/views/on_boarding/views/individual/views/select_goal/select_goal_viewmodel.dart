import 'package:comradery/app.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum Goal {
  findTeam,
  findIndividuals,
}

class SelectGoalViewModel extends BaseViewModel {
  final _router = locator<NavigationService>();

  Goal _goal = Goal.findTeam;
  Goal get goal => _goal;

  void onSelectGoal(Goal goal) {
    _goal = goal;
    notifyListeners();
  }

  void proceed() {
    if (goal == Goal.findTeam) {
      _router.navigateTo(Routes.uploadPhotoView);
      return;
    }

    _router.navigateTo(Routes.setupTeamProfileView);
    return;
  }
}
