import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/result_entity.dart';

part 'result_model.freezed.dart';
part 'result_model.g.dart';

@freezed
class ResultModel extends ResultEntity with _$ResultModel {
  factory ResultModel({
    int? id,
    String? login,
    String? nodeId,
    String? avatarUrl,
    String? gravatarId,
    String? url,
    String? htmlUrl,
    String? followersUrl,
    String? followingUrl,
    String? gistsUrl,
    String? starredUrl,
    String? subscriptionsUrl,
    String? organizationsUrl,
    String? reposUrl,
    String? eventsUrl,
    String? receivedEventsUrl,
    String? type,
    int? score,
    bool? siteAdmin,
  }) = _ResultModel;

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);
}
