import 'package:comradery/common/supabase/supabase_service.dart';

class UserService extends SupabaseService {
  @override
  String get table => 'users';
}
