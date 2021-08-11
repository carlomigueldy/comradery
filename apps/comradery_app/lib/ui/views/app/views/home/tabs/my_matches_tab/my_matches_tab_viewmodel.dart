import 'package:comradery/app.dart';
import 'package:comradery/app.logger.dart';
import 'package:comradery/matching/models/matching.dart';
import 'package:comradery/matching/services/matching_service.dart';
import 'package:postgrest/postgrest.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MyMatchesTabViewModel extends BaseViewModel {
  final log = stackedLogger('MyMatchesTabViewModel');
  final _matchingService = locator<MatchingService>();
  final _router = locator<NavigationService>();

  List<Matching> _matchings = [];
  List<Matching> get matchings => _matchings;
  List<String> get matchingsIds => _matchings.map((e) => e.id!).toList();
  List<Matching> get filteredMatchings => _matchings.where((element) {
        return targettedMatchingTargetUserIds.contains(element.createdBy);
      }).toList();
  List<String> get filteredMatchingsIds =>
      filteredMatchings.map((e) => e.id!).toList();
  String get _fetchMyMatchingsKey => '_fetchMyMatchingsKey';
  bool get fetchMyMatchingsBusy => busy(_fetchMyMatchingsKey);

  List<Matching> _targettedMatchings = [];
  List<Matching> get targettedMatchings => _targettedMatchings;
  List<String> get targettedMatchingTargetUserIds =>
      targettedMatchings.map((e) => e.targetUserId).toList();
  String get _fetchWhoLikedMeKey => '_fetchWhoLikedMeKey';
  bool get fetchWhoLikedMeBusy => busy(_fetchWhoLikedMeKey);

  Future<void> init() async {
    try {
      setBusy(true);
      await Future.wait([
        fetchWhoLikedMe(),
        fetchMyMatchings(),
      ]);
    } catch (e) {
      log.e('error "$e"');
    } finally {
      setBusy(false);
    }
  }

  Future<void> fetchMyMatchings() async {
    final response = await runBusyFuture<PostgrestResponse>(
      _matchingService.fetchMyMatchings(),
      busyObject: _fetchMyMatchingsKey,
      throwException: true,
    );
    // log.v('fetchMyMatchings-response "${response.toJson()}"');

    if (response.error != null) {
      log.e(response.error?.message);
      return;
    }

    _matchings =
        (response.data as List).map((e) => Matching.fromJson(e)).toList();
    notifyListeners();
  }

  Future<void> fetchWhoLikedMe() async {
    final response = await runBusyFuture<PostgrestResponse>(
      _matchingService.fetchWhoLikedMe(),
      busyObject: _fetchWhoLikedMeKey,
      throwException: true,
    );
    // log.v('fetchWhoLikedMe-response "${response.toJson()}"');

    if (response.error != null) {
      log.e(response.error?.message);
      return;
    }

    _targettedMatchings =
        (response.data as List).map((e) => Matching.fromJson(e)).toList();
    notifyListeners();
  }

  void toUserDetailView(String value) {
    _router.navigateTo(
      Routes.userDetailView(userId: value),
    );
  }
}
