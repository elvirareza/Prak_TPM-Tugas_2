// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountListModelAdapter extends TypeAdapter<AccountListModel> {
  @override
  final int typeId = 0;

  @override
  AccountListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountListModel(
      username: fields[0] as String,
      password: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AccountListModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
