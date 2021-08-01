import 'package:logger/logger.dart';
import 'package:postgrest/postgrest.dart';

import 'supabase_client.dart';

abstract class SupabaseService {
  Logger get log => Logger();

  String get table;

  Future<PostgrestResponse> all({
    String columns = '*',
    int limit = 100,
  }) async {
    log.i('table "$table"');
    final response = await supabase
        .from(table)
        .select(columns)
        .is_('deleted_at', null)
        .limit(limit)
        .execute();
    return response;
  }

  Future<PostgrestResponse> find(
    String id, {
    String columns = '*',
  }) async {
    log.i('table "$table", id "$id"');
    final response = await supabase
        .from(table)
        .select(columns)
        .is_('deleted_at', null)
        .eq('id', id)
        .single()
        .execute();
    return response;
  }

  Future<PostgrestResponse> create(Map<String, dynamic> json) async {
    log.i('table "$table", json "$json"');
    final response = await supabase.from(table).insert(json).execute();
    return response;
  }

  Future<PostgrestResponse> update({
    required String id,
    required Map<String, dynamic> json,
  }) async {
    log.i('table "$table", json "$json"');
    final response = await supabase
        .from(table)
        .update(json)
        .is_('deleted_at', null)
        .eq('id', id)
        .execute();
    return response;
  }

  Future<PostgrestResponse> delete(String id) async {
    log.i('table "$table", id "$id"');
    final response = await supabase
        .from(table)
        .update({
          'deleted_at': DateTime.now().toIso8601String(),
        })
        .is_('deleted_at', null)
        .eq('id', id)
        .execute();
    return response;
  }

  // Future<PostgrestResponse> forceDelete(String id) async {
  //   log.i('table "$table", id "$id"');
  //   final response = await supabase.from(table).delete().eq('id', id).execute();
  //   return response;
  // }
}
