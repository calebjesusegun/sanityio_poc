import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../models/blog_post.dart';
import '../../../services/sanityio_service.dart';

class BlogsViewModel extends BaseViewModel {
  final _sanityIOService = locator<SanityIOService>();
  final log = getLogger('BlogsViewModel');

  Future<List<Post>> getBlogPost() async {
    List<Post> posts = await _sanityIOService.getBlogPosts();
    return posts;
  }
}
