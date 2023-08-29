import 'package:technical_test_avilatek/screens/actor-profile/contracts/cast-of-actor.dto.dart';

class ActorMoviesDto {
  final List<CastingOfActorDto> cast;
  final List<dynamic> crew;
  final int id;

  ActorMoviesDto({
    required this.cast,
    required this.crew,
    required this.id,
  });

  factory ActorMoviesDto.fromJson(Map<String, dynamic> json) => ActorMoviesDto(
        cast: List<CastingOfActorDto>.from(
            json['cast'].map((x) => CastingOfActorDto.fromJson(x))),
        crew: List<dynamic>.from(json['crew'].map((x) => x)),
        id: json['id'],
      );
}
