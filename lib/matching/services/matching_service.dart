import 'package:comradery/app.dart';
import 'package:comradery/auth/services/auth_service.dart';
import 'package:comradery/common/supabase/supabase_client.dart';
import 'package:comradery/common/supabase/supabase_service.dart';
import 'package:postgrest/src/postgrest_response.dart';

class MatchingService extends SupabaseService {
  final _authService = locator<AuthService>();

  @override
  String get table => 'matchings';

  Future<PostgrestResponse> fetchMyMatchings() async {
    return await supabase
        .from(table)
        .select(
          '*, created_by_user: users (id, first_name, last_name, email)',
        )
        .eq('target_user_id', _authService.user!.id!)
        .neq('created_by', _authService.user!.id!)
        .is_('liked', true)
        .is_('deleted_at', null)
        .execute();
  }

  Future<PostgrestResponse> fetchWhoLikedMe() async {
    return await supabase
        .from(table)
        .select(
          '*, created_by_user: users (id, first_name, last_name, email)',
        )
        .neq('target_user_id', _authService.user!.id!)
        .eq('created_by', _authService.user!.id!)
        .is_('liked', true)
        .is_('deleted_at', null)
        .execute();
  }

  Future<PostgrestResponse> fetchMyMatchingSubmissions() async {
    return await supabase
        .from(table)
        .select('*, target_user: users (id, first_name, email)')
        .eq('created_by', _authService.user!.id!)
        .is_('deleted_at', null)
        .execute();
  }
}
