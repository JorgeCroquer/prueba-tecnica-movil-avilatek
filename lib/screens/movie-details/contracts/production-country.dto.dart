class ProductionCountryDto {
  ProductionCountryDto({required this.iso31661, required this.name});

  final String iso31661;
  final String name;

  factory ProductionCountryDto.fromJson(Map<String, dynamic> json) =>
      ProductionCountryDto(iso31661: json["iso_3166_1"], name: json["name"]);
}
