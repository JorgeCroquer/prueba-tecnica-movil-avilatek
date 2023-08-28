class ProductionCompanyDto {
  ProductionCompanyDto(
      {required this.id,
      required this.logoPath,
      required this.name,
      required this.originCountry});

  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  factory ProductionCompanyDto.fromJson(Map<String, dynamic> json) =>
      ProductionCompanyDto(
          id: json["id"],
          logoPath: json["logo_path"],
          name: json["name"],
          originCountry: json["origin_country"]);
}
