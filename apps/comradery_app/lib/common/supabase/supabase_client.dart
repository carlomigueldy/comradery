import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase/supabase.dart';

final SupabaseClient supabase = SupabaseClient(
  dotenv.env['SUPABASE_URL'] ?? '',
  dotenv.env['SUPABASE_KEY'] ?? '',
);