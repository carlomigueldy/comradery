import 'package:comradery/common/supabase/supabase_service.dart';

class ConversationMessageService extends SupabaseService {
  @override
  String get table => 'conversation_messages';
}
