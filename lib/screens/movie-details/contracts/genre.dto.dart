class GenreDto {
  GenreDto({required this.id, required this.name});

  final int id;
  final String name;

  factory GenreDto.fromJson(Map<String, dynamic> json) =>
      GenreDto(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
