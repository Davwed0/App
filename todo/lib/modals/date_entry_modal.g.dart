// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_entry_modal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DateEntryAdapter extends TypeAdapter<DateEntry> {
  @override
  final int typeId = 1;

  @override
  DateEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DateEntry(
      date: fields[0] as String,
      status: fields[1] as String,
      toDoList: (fields[2] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, DateEntry obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.toDoList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
