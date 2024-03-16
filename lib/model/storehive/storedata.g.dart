// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storedata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetModelshiveAdapter extends TypeAdapter<GetModelshive> {
  @override
  final int typeId = 0;

  @override
  GetModelshive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetModelshive(
      region: fields[0] as String,
      leaderss: (fields[1] as List).cast<Leaders>(),
    );
  }

  @override
  void write(BinaryWriter writer, GetModelshive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.region)
      ..writeByte(1)
      ..write(obj.leaderss);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetModelshiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LeaderAdapter extends TypeAdapter<Leaders> {
  @override
  final int typeId = 1;

  @override
  Leaders read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Leaders(
      userId: fields[0] as String,
      name: fields[1] as String,
      profilePic: fields[2] as String,
      points: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Leaders obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.profilePic)
      ..writeByte(3)
      ..write(obj.points);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LeaderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
