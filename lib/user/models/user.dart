import 'package:comradery/user/models/user_interest.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  factory User({
    String? id,
    required String email,
    @JsonKey(
      name: 'photo_url',
    )
        String? photoUrl,
    @JsonKey(
      name: 'first_name',
    )
        String? firstName,
    @JsonKey(
      name: 'last_name',
    )
        String? lastName,
    String? bio,
    @JsonKey(
      fromJson: User._interestsFromJson,
      toJson: User._interestsToJson,
    )
        List<UserInterest>? interests,
    @JsonKey(
      name: 'external_links_json',
    )
        Map<String, dynamic>? externalLinksJson,
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
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static List<UserInterest>? _interestsFromJson(List<dynamic>? list) =>
      list == null
          ? []
          : list.map((item) => UserInterest.fromJson(item)).toList();

  static List<dynamic>? _interestsToJson(List<UserInterest>? list) =>
      list == null ? [] : list.map((item) => item.toJson()).toList();
  String get formattedCreatedAt {
    return DateFormat('EEEE M/d/y').format(createdAt!);
  }

  String get formattedUpdatedAt {
    return DateFormat('EEEE M/d/y').format(updatedAt!);
  }

  String get formattedDeletedAt {
    return DateFormat('EEEE M/d/y').format(deletedAt!);
  }

  String get fullName => '$firstName $lastName'.trim();

  bool get hasInterests => interests != null && interests?.isNotEmpty == true;

  bool get hasPhoto => photoUrl != null && photoUrl!.isNotEmpty;

  Map<String, dynamic> toPayload() {
    final json = toJson();
    json.remove('id');
    json.remove('created_at');
    json.remove('updated_at');
    json.remove('deleted_at');
    json.remove('interests');
    return json;
  }
}
