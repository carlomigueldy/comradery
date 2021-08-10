import 'package:comradery/common/supabase/supabase_service.dart';

class ConversationParticipantService extends SupabaseService {
  @override
  String get table => 'conversation_participants';
}
