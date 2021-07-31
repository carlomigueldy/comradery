import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'interest.freezed.dart';
part 'interest.g.dart';

@freezed
class Interest with _$Interest {
  const Interest._();

  factory Interest({
    String? id,
    required String name,
    @JsonKey(
      name: 'created_at',
    )
        DateTime? createdAt,
    @JsonKey(
      name: 'updated_at',
    )
        DateTime? updatedAt,
    @JsonKey(
      name: 'deleted_at',
    )
        DateTime? deletedAt,
  }) = _Interest;

  factory Interest.fromJson(Map<String, dynamic> json) =>
      _$InterestFromJson(json);

  String get formattedCreatedAt {
    return DateFormat('EEEE M/d/y').format(createdAt!);
  }

  String get formattedUpdatedAt {
    return DateFormat('EEEE M/d/y').format(updatedAt!);
  }

  String get formattedDeletedAt {
    return DateFormat('EEEE M/d/y').format(deletedAt!);
  }

  Map<String, dynamic> toPayload() {
    final json = toJson();
    json.remove('id');
    json.remove('created_at');
    json.remove('updated_at');
    json.remove('deleted_at');
    return json;
  }
}
