import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:technical_test_avilatek/common/contracts/configuration-details.dto.dart';

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
      Map<String, String>? queryParameters}) async {
    final apiConfig = _apiConfiguration ?? await _getApiConfiguration();
    final endpoint = apiConfig.images.secureBaseUrl +
        apiConfig.images.posterSizes[3] +
        imgPath;
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
}
