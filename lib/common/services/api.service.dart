import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:technical_test_avilatek/common/contracts/configuration-details.dto.dart';

enum ImageQuality {
  low,
  medium,
  high,
}

class MoviesApiService {
  final String _baseUrl = dotenv.get('MOVIES_API_URL');
  final String _apiKey = dotenv.get('MOVIES_API_KEY');
  ConfigurationDetailsDto? _apiConfiguration;

  Future<dynamic> get(String endpoint,
      {Map<String, String>? headers,
      Map<String, String>? queryParameters}) async {
    final url = Uri.parse('$_baseUrl$endpoint');
    final response = await http.get(
      url.replace(queryParameters: {
        ...?queryParameters,
        'api_key': _apiKey,
      }),
      headers: {
        ...?headers,
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<String> getImageUrl(String imgPath,
      {Map<String, String>? headers,
      Map<String, String>? queryParameters,
      ImageQuality quality = ImageQuality.low}) async {
    final apiConfig = _apiConfiguration ?? await _getApiConfiguration();
    final endpoint = _getImageSizeForQuality(quality) + imgPath;
    return '${apiConfig.images.secureBaseUrl}$endpoint';
  }

  Future<ConfigurationDetailsDto> _getApiConfiguration() {
    return get('/configuration').then((response) {
      return ConfigurationDetailsDto.fromJson(response);
    });
  }

  //Factory method that initializes the api configuration
  static Future<MoviesApiService> create() async {
    final apiService = MoviesApiService();
    apiService._apiConfiguration = await apiService._getApiConfiguration();
    return apiService;
  }

  String _getImageSizeForQuality(final ImageQuality quality) {
    switch (quality) {
      case ImageQuality.low:
        return _apiConfiguration!.images.posterSizes[3];
      case ImageQuality.medium:
        return _apiConfiguration!.images.posterSizes[4];
      case ImageQuality.high:
        return _apiConfiguration!.images.posterSizes[5];
      default:
        return _apiConfiguration!.images.posterSizes[0];
    }
  }
}
