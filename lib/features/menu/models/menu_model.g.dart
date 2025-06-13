// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MenuModelAdapter extends TypeAdapter<MenuModel> {
  @override
  final int typeId = 0;

  @override
  MenuModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenuModel(
      image: fields[0] as String?,
      title: fields[1] as String?,
      description: fields[2] as String?,
      price: fields[3] as double?,
      quantity: fields[4] as String?,
      menuId: fields[5] as String,
      ingredients: (fields[6] as List?)?.cast<IngredientModel>(),
      categoryId: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MenuModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.menuId)
      ..writeByte(6)
      ..write(obj.ingredients)
      ..writeByte(7)
      ..write(obj.categoryId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuModelImpl _$$MenuModelImplFromJson(Map<String, dynamic> json) =>
    _$MenuModelImpl(
      image: json['image'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      quantity: json['quantity'] as String?,
      menuId: json['menuId'] as String,
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoryId: json['categoryId'] as String?,
    );

Map<String, dynamic> _$$MenuModelImplToJson(_$MenuModelImpl instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'quantity': instance.quantity,
      'menuId': instance.menuId,
      'ingredients': instance.ingredients,
      'categoryId': instance.categoryId,
    };
