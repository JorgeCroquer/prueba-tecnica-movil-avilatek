class ConfigurationDetailsDto {
  final ImagesDto images;
  final List<String> changeKeys;

  ConfigurationDetailsDto({
    required this.images,
    required this.changeKeys,
  });

  factory ConfigurationDetailsDto.fromJson(Map<String, dynamic> json) =>
      ConfigurationDetailsDto(
        images: ImagesDto.fromJson(json['images']),
        changeKeys: List<String>.from(json['change_keys'].map((x) => x)),
      );
}

class ImagesDto {
  final String baseUrl;
  final String secureBaseUrl;
  final List<String> backdropSizes;
  final List<String> logoSizes;
  final List<String> posterSizes;
  final List<String> profileSizes;
  final List<String> stillSizes;

  ImagesDto({
    required this.baseUrl,
    required this.secureBaseUrl,
    required this.backdropSizes,
    required this.logoSizes,
    required this.posterSizes,
    required this.profileSizes,
    required this.stillSizes,
  });

  factory ImagesDto.fromJson(Map<String, dynamic> json) => ImagesDto(
        baseUrl: json['base_url'],
        secureBaseUrl: json['secure_base_url'],
        backdropSizes: List<String>.from(json['backdrop_sizes'].map((x) => x)),
        logoSizes: List<String>.from(json['logo_sizes'].map((x) => x)),
        posterSizes: List<String>.from(json['poster_sizes'].map((x) => x)),
        profileSizes: List<String>.from(json['profile_sizes'].map((x) => x)),
        stillSizes: List<String>.from(json['still_sizes'].map((x) => x)),
      );
}
