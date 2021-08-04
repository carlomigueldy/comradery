import 'package:comradery/app.dart';
import 'package:comradery/auth/services/auth_service.dart';
import 'package:comradery/common/services/app_snackbar_service.dart';
import 'package:comradery/common/supabase/supabase_client.dart';
import 'package:comradery/interest/models/interest.dart';
import 'package:comradery/interest/services/interest_service.dart';
import 'package:comradery/user/models/user_interest.dart';
import 'package:logger/logger.dart';
import 'package:postgrest/postgrest.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SelectInterestsViewModel extends BaseViewModel {
  final log = Logger();
  final _interestService = locator<InterestService>();
  final _snackbarService = locator<AppSnackbarService>();
  final _authService = locator<AuthService>();
  final _router = locator<NavigationService>();

  String _query = '';
  String get query => _query;

  String get _textSearchKey => '_textSearchKey';
  String get textSearchDebounceKey => 'textSearchDebounceKey';
  bool get textSearchBusy => busy(_textSearchKey);

  List<Interest> _interests = [];
  List<Interest> get interests => _interests;
  String get _fetchInterestsKey => '_fetchInterestsKey';
  bool get fetchInterestsBusy => busy(_fetchInterestsKey);

  List<Interest> _selectedInterests = [];
  List<Interest> get selectedInterests => _selectedInterests;
  bool get hasAtLeast3Selected => selectedInterests.length >= 3;

  String get _insertUserInterestsKey => '_insertUserInterestsKey';
  bool get insertUserInterestsBusy => busy(_insertUserInterestsKey);

  void init() {
    fetchInterests();
  }

  Future<void> fetchInterests() async {
    final response = await runBusyFuture<PostgrestResponse>(
      _interestService.all(columns: 'id, name'),
      busyObject: _fetchInterestsKey,
      throwException: true,
    );
    log.v('response "${response.toJson()}"');

    if (response.error != null) {
      return log.e(response.error?.message);
    }

    _interests =
        (response.data as List).map((e) => Interest.fromJson(e)).toList();
    notifyListeners();
  }

  void onSelectInterest(Interest interest) {
    if (_selectedInterests.contains(interest)) {
      _selectedInterests.remove(interest);
      return notifyListeners();
    }

    _selectedInterests.add(interest);
    return notifyListeners();
  }

  Future<void> onQueryChange(String? value) async {
    log.v('value "$value"');

    if (value == null || value.isEmpty) {
      return await fetchInterests();
    }

    _query = value;

    final response = await runBusyFuture<PostgrestResponse>(
      supabase
          .from('interests')
          .select('id, name')
          .ilike('name', '%$query%')
          // .textSearch(
          //   'name',
          //   query,
          //   // "'$query'",
          //   // "'$query'",
          //   // "'Supab or Fitness'",
          //   type: TextSearchType.plain,
          //   // config: 'english',
          // )
          .execute(),
      busyObject: _textSearchKey,
      throwException: true,
    );
    log.v('response "${response.toJson()}"');

    if (response.error != null) {
      return log.e(response.error?.message);
    }

    _interests =
        (response.data as List).map((e) => Interest.fromJson(e)).toList();
    notifyListeners();
  }

  Future<void> onTapContinue() async {
    if (!hasAtLeast3Selected) {
      log.e('Must have at least 3 selected interests');
      _snackbarService.showError();

      return;
    }

    final response = await runBusyFuture<PostgrestResponse>(
      supabase
          .from('user_interests')
          .insert(
            selectedInterests
                .map(
                  (item) => UserInterest(
                    interestId: item.id!,
                    userId: _authService.user!.id!,
                  ).toPayload(),
                )
                .toList(),
          )
          .execute(),
      busyObject: _insertUserInterestsKey,
      throwException: true,
    );
    log.v('response "${response.toJson()}"');

    if (response.error != null) {
      _snackbarService.showUnexpectedError();
      return log.e(response.error?.message);
    }

    return _router.navigateTo(Routes.appView);
  }
}
