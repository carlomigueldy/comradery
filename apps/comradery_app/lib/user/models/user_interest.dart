import 'package:comradery/interest/models/interest.dart';
import 'package:comradery/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'user_interest.freezed.dart';
part 'user_interest.g.dart';

@freezed
class UserInterest with _$UserInterest {
  const UserInterest._();

  factory UserInterest({
    String? id,
    @JsonKey(
      name: 'interest_id',
    )
        required String interestId,
    Interest? interest,
    @JsonKey(
      name: 'user_id',
    )
        required String userId,
    User? user,
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
  }) = _UserInterest;

  factory UserInterest.fromJson(Map<String, dynamic> json) =>
      _$UserInterestFromJson(json);

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
    json.remove('interest');
    json.remove('user');
    return json;
  }
}
