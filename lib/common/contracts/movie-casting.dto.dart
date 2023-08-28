import 'casting.dto.dart';

class MovieCastingDto {
  final int id;
  final List<CastDto> cast;

  MovieCastingDto({
    required this.id,
    required this.cast,
  });

  factory MovieCastingDto.fromJson(Map<String, dynamic> json) =>
      MovieCastingDto(
        id: json['id'],
        cast: List<CastDto>.from(json['cast'].map((x) => CastDto.fromJson(x))),
      );
}
