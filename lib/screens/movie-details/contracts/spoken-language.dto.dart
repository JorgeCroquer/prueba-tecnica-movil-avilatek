class SpokenLanguageDto {
  SpokenLanguageDto(
      {required this.englishName, required this.iso6391, required this.name});

  final String englishName;
  final String iso6391;
  final String name;

  factory SpokenLanguageDto.fromJson(Map<String, dynamic> json) =>
      SpokenLanguageDto(
          englishName: json["english_name"],
          iso6391: json["iso_639_1"],
          name: json["name"]);
}
