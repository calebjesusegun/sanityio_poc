import 'dart:convert';

import 'package:http/http.dart' as http;

import '../app/app.logger.dart';
import '../models/BlogPost.dart';

class SanityIOService {
  final log = getLogger('SanityIOService');

  Future initializeSanityClient() async {
    const projectId = 'ft7xak3z';
    const dataset = 'production';
    const String query = """
     {
      "posts": *[_type=='post'] {
        ...,
      author->,
      categories[]->
      },
      "total": count(*[_type == "post"]) 
    }
        """;

    final Map<String, dynamic> queryParameters = <String, dynamic>{
      'query': query
    };

    final uri = Uri(
      scheme: 'https',
      host: '$projectId.api.sanity.io',
      path: '/v2024-02-06/data/query/$dataset',
      queryParameters: queryParameters,
    );

    final http.Client client = http.Client();
    final http.Response response = await client.get(uri);
    final body = jsonDecode(response.body);
    final result = BlogPost.fromJson(body);
    log.i("Response Result $result");
    return result.result!.posts;
  }
}
