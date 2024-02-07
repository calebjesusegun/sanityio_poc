import 'package:sanityio_poc/app/app.locator.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.logger.dart';
import '../../../models/BlogPost.dart';
import '../../../services/sanityio_service.dart';

class HomeViewModel extends BaseViewModel {
  final _sanityIOService = locator<SanityIOService>();
  final log = getLogger('HomeViewModel');

  Future<List<Post>> getBlogPost() async {
    List<Post> posts = await _sanityIOService.initializeSanityClient();
    return posts;
  }
}
