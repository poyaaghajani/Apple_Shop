class VariantType {
  String? id;
  String? name;
  String? title;
  VarientTypeEnum? type;

  VariantType(
    this.id,
    this.name,
    this.title,
    this.type,
  );

  factory VariantType.fromMapJson(Map<String, dynamic> jsonObject) {
    return VariantType(
      jsonObject['id'],
      jsonObject['name'],
      jsonObject['title'],
      getTypeEnum(jsonObject['type']),
    );
  }
}

VarientTypeEnum getTypeEnum(String type) {
  switch (type) {
    case 'Color':
      return VarientTypeEnum.COLOR;
    case "Storage":
      return VarientTypeEnum.STORAGE;
    case 'Voltage':
      return VarientTypeEnum.VOLTAGE;
    default:
      return VarientTypeEnum.VOLTAGE;
  }
}

enum VarientTypeEnum {
  COLOR,
  STORAGE,
  VOLTAGE,
}
