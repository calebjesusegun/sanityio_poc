import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';

class PdfDisplayViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final log = getLogger('PdfDisplayViewModel');

  void navigateBack() {
    _navigationService.back();
  }

  late File Pfile;

  bool isLoading = false;

  Uint8List? _documentBytes;
  Uint8List? get documentBytes => _documentBytes;

  ///Get the PDF document as bytes
  Future getPdfBytes(String fileUrl) async {
    final client = RetryClient(http.Client());
    _documentBytes = await client.readBytes(Uri.parse(fileUrl), headers: {
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'Keep-Alive'
    });
    rebuildUi();
  }

  // Method that executes on entry of the UI view
  Future initialize(String fileUrl) async {
    await getPdfBytes(fileUrl);
  }

  Future loadPdf(String url) async {
    log.i("Here");
    final client = RetryClient(http.Client());
    var url = 'http://www.pdf995.com/samples/pdf.pdf';
    final response = await client.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    log.i("Yes");
    final filename = basename(url);
    final dir = await getTemporaryDirectory();
    // final dir = await getApplicationDocumentsDirectory();
    var file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    Pfile = file;

    log.i("Pdf file: $Pfile");
    rebuildUi();
  }
}
