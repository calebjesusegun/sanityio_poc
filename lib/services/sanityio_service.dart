import 'package:sanityio_poc/services/api_service.dart';

import '../app/app.locator.dart';
import '../app/app.logger.dart';
import '../models/blog_post.dart';
import '../models/products.dart';

class SanityIOService {
  final log = getLogger('SanityIOService');
  final _apiService = locator<ApiService>();

  Future<List<Post>> getBlogPosts() async {
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

    var data = await _apiService.getData(queryParameter: queryParameters);

    final result = BlogPost.fromJson(data);
    log.i("Response Result $result");
    return result.result!.posts;
  }

  Future<List<Pdf>> getProducts() async {
    const String query = """
     {
     "pdfs": *[_type=='eco-tales'] |order(_createdAt desc) {
     ..., 
     "fileURL": file.asset->url
     },
     "total": count(*[_type == "eco-tales"])
     }
        """;

    final Map<String, dynamic> queryParameters = <String, dynamic>{
      'query': query
    };

    var data = await _apiService.getData(queryParameter: queryParameters);

    final result = Products.fromJson(data);
    log.i("Response Result $result");
    return result.result!.pdfs;
  }
}
