class Variant {
  String? id;
  String? name;
  String? typeId;
  String? value;
  int? priceChange;

  Variant(
    this.id,
    this.name,
    this.typeId,
    this.value,
    this.priceChange,
  );

  factory Variant.fromMapJson(Map<String, dynamic> jsonObject) {
    return Variant(
      jsonObject['id'],
      jsonObject['name'],
      jsonObject['type_id'],
      jsonObject['value'],
      jsonObject['price_change'],
    );
  }
}
