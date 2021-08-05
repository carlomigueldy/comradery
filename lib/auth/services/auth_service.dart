import 'package:comradery/app.logger.dart';
import 'package:comradery/common/services/local_storage_service.dart';
import 'package:comradery/common/supabase/supabase_client.dart';
import 'package:comradery/app.locator.dart';
import 'package:comradery/user/models/user.dart';
import 'package:gotrue/src/user.dart' as gotrue;
import 'package:postgrest/postgrest.dart';
import 'package:supabase/supabase.dart' as supa;

class AuthService {
  final log = stackedLogger('AuthService');
  final _localStorageService = locator<LocalStorageService>();

  User? _user;
  User? get user => _user;
  bool get hasUser => _user != null;

  gotrue.User? _supabaseUser;
  gotrue.User? get supabaseUser => _supabaseUser;

  Future<void> initialize() async {
    supabase.auth.autoRefreshToken = true;
    final accessToken = await _localStorageService.getItem('token');
    log.i(accessToken);

    if (accessToken == null) {
      return;
    }

    supabase.auth.onAuthStateChange((event, session) {
      log.v('event "$event", session "$session"');

      if (session != null) {
        _supabaseUser = session.user;
      }
    });

    final response = await supabase.auth.api.getUser(accessToken);

    if (response.error != null) {
      log.e(response.error?.message);
      await _localStorageService.removeItem('token');
      return;
    }

    if (response.data == null) {
      log.v('No user');
      return;
    }

    final user = response.data!;
    log.i(user.toJson());
    await fetchUser(id: user.id);
    await supabase.auth.refreshSession();
  }

  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    final response = await supabase.auth.signIn(
      email: email,
      password: password,
    );

    if (response.error != null) {
      log.e(response.error!.message);
      return null;
    }

    log.i(response.data);

    await _localStorageService.setItem('token', response.data!.accessToken);

    return await fetchUser(id: response.data!.user!.id);
  }

  Future<User?> signUp({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
  }) async {
    try {
      final response = await supabase.auth.signUp(email, password);

      if (response.error != null) {
        log.e(response.error!.message);
        return null;
      }

      final user = response.data!.user!;
      log.i(user.toJson());
      await _createUser(
        user,
        firstName: firstName,
        lastName: lastName,
      );

      await _localStorageService.setItem('token', response.data!.accessToken);

      return await fetchUser(id: user.id);
    } catch (e) {
      log.e('error "$e"');

      return null;
    }
  }

  Future<void> signOut() async {
    final response = await supabase.auth.signOut();

    if (response.error != null) {
      log.e(response.error!.message);
      return;
    }
    log.i(response.rawData);
    await _localStorageService.removeItem('token');
    _user = null;
    return;
  }

  Future<User?> fetchUser({String? id}) async {
    await Future.delayed(Duration(seconds: 1));

    log.v('id "$id", user "${user?.toJson()}"');

    final response = await supabase
        .from('users')
        .select()
        .eq('id', id ?? user?.id)
        .single()
        .execute();

    log.v('response.toJson() "${response.toJson()}"');

    log.i(
      'Count: ${response.count}, Status: ${response.status}, Data: ${response.data}',
    );
    if (response.error != null) {
      log.e(response.error?.message);
      return null;
    }

    log.i('response.data "${response.data}"');
    final data = User.fromJson(response.data);
    _user = data;

    return data;
  }

  Future<PostgrestResponse> _createUser(
    gotrue.User user, {
    String? firstName,
    String? lastName,
  }) async {
    final response = await supabase
        .from("users")
        .insert(
          User(
            id: user.id,
            email: user.email,
            firstName: firstName,
            lastName: lastName,
          ).toPayload(),
        )
        .execute();

    log.i('response.toJson() "${response.toJson()}"');

    if (response.error != null) {
      log.e(response.error!.toJson());
    }

    return response;
  }

  Future<supa.GotrueUserResponse> changePassword(String password) async {
    return supabase.auth.update(
      supa.UserAttributes(password: password),
    );
  }

  Future<supa.GotrueUserResponse> changeEmail(String email) async {
    return supabase.auth.update(
      supa.UserAttributes(email: email),
    );
  }

  Future<bool> confirmPassword(String password) async {
    final response = await supabase.auth.signIn(
      email: user!.email,
      password: password,
    );

    return response.error == null;
  }
}
