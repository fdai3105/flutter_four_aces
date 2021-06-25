// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_controller.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameCardAdapter extends TypeAdapter<GameCard> {
  @override
  final int typeId = 2;

  @override
  GameCard read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GameCard.spadeAce;
      case 1:
        return GameCard.heartAce;
      case 2:
        return GameCard.diamondAce;
      case 3:
        return GameCard.clubAce;
      case 4:
        return GameCard.redKing;
      case 5:
        return GameCard.none;
      default:
        return GameCard.spadeAce;
    }
  }

  @override
  void write(BinaryWriter writer, GameCard obj) {
    switch (obj) {
      case GameCard.spadeAce:
        writer.writeByte(0);
        break;
      case GameCard.heartAce:
        writer.writeByte(1);
        break;
      case GameCard.diamondAce:
        writer.writeByte(2);
        break;
      case GameCard.clubAce:
        writer.writeByte(3);
        break;
      case GameCard.redKing:
        writer.writeByte(4);
        break;
      case GameCard.none:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
