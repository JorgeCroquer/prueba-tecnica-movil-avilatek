import '../../../common/services/api.service.dart';
import '../contracts/actor-movies.dto.dart';
import '../contracts/actor.dto.dart';

class ActorProfileService {
  final MoviesApiService _apiService;

  ActorProfileService({required MoviesApiService apiService})
      : _apiService = apiService;

  Future<ActorDto> getActorInfo(final int actorId) async {
    final response = await _apiService.get('/person/$actorId');

    final actorWithoutImage = ActorDto.fromJson(response);

    return await _attachActorImageUrl(actorWithoutImage);
  }

  Future<ActorMoviesDto> getActorMovies(final int actorId) async {
    final response = await _apiService.get('/person/$actorId/movie_credits');

    final castingWithoutPosterImages = ActorMoviesDto.fromJson(response);

    return await _attachMoviePosterImages(castingWithoutPosterImages);
  }

  Future<ActorDto> _attachActorImageUrl(final ActorDto actor) async {
    actor.imageUrl = await _apiService.getImageUrl(actor.profilePath);
    return actor;
  }

  Future<ActorMoviesDto> _attachMoviePosterImages(
      final ActorMoviesDto movies) async {
    for (final cast in movies.cast) {
      if (cast.posterPath != null) {
        cast.imageUrl = await _apiService.getImageUrl(cast.posterPath!);
      }
    }
    return movies;
  }
}
