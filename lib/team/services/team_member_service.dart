import 'package:comradery/common/supabase/supabase_service.dart';

class TeamMemberService extends SupabaseService {
  @override
  String get table => 'team_members';
}
