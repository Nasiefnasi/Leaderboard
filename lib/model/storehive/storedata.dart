import 'package:hive/hive.dart';

part 'storedata.g.dart';

@HiveType(typeId: 0)
class GetModelshive extends HiveObject {
  @HiveField(0)
  late String region;

  @HiveField(1)
  late List<Leaders> leaderss;

  GetModelshive({required this.region, required this.leaderss});
}

@HiveType(typeId: 1)
class Leaders extends HiveObject {
  @HiveField(0)
  late String userId;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String profilePic;

  @HiveField(3)
  late int points;

  Leaders({
    required this.userId,
    required this.name,
    required this.profilePic,
    required this.points,
  });
}
