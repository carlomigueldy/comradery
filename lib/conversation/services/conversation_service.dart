import 'package:comradery/common/supabase/supabase_service.dart';

class ConversationService extends SupabaseService {
  @override
  String get table => 'conversations';
}
