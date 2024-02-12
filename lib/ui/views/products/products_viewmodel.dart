import 'package:sanityio_poc/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../models/products.dart';
import '../../../services/sanityio_service.dart';

class ProductsViewModel extends BaseViewModel {
  final _sanityIOService = locator<SanityIOService>();
  final _navigationService = locator<NavigationService>();
  final log = getLogger('ProductsViewModel');

  Future<List<Pdf>> getProducts() async {
    List<Pdf> posts = await _sanityIOService.getProducts();
    return posts;
  }

  void navigateToPdfDisplayView(String url) {
    _navigationService.navigateToPdfDisplayView(fileUrl: url);
  }
}
