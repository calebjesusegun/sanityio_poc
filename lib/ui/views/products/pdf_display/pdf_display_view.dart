import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'pdf_display_viewmodel.dart';

class PdfDisplayView extends StackedView<PdfDisplayViewModel> {
  const PdfDisplayView({required this.fileUrl, Key? key}) : super(key: key);

  final String fileUrl;

  @override
  Widget builder(
    BuildContext context,
    PdfDisplayViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eco Tales Issue 1"),
      ),
      body: SfPdfViewer.network(fileUrl),

      // body: (viewModel.documentBytes != null)
      //     ? SfPdfViewer.memory(
      //         viewModel.documentBytes!,
      //       )
      //     : const Center(
      //         child: CircularProgressIndicator(
      //           color: Colors.green,
      //           strokeWidth: 6,
      //         ),
      //       ),
      // body: SfPdfViewer.network(
      //     // "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf"),
      //     "https://cdn.sanity.io/files/ft7xak3z/production/91ad816e7b7d1db3d154078d6db1fb2c751717e6.pdf"),
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       FutureBuilder(
      //           future: viewModel.loadPdf(fileUrl),
      //           builder: (context, snapshot) {
      //             Widget? child;
      //             if (snapshot.connectionState == ConnectionState.waiting ||
      //                 snapshot.data == null) {
      //               child = const Center(
      //                 child: CircularProgressIndicator(
      //                   color: Colors.green,
      //                   strokeWidth: 6,
      //                 ),
      //               );
      //             } else if (snapshot.hasError) {
      //               print(snapshot.error);
      //               child = Container();
      //             } else if (snapshot.hasData) {
      //               final posts = snapshot.data ?? [];
      //               child = ListView.builder(
      //                 padding: const EdgeInsets.all(8),
      //                 itemCount: posts.length,
      //                 itemBuilder: (BuildContext context, int index) {
      //                   return Center(
      //                     child: PDFView(
      //                       filePath: viewModel.Pfile.path,
      //                     ),
      //                   );
      //                 },
      //               );
      //             }
      //             return Expanded(child: child!);
      //           })
      //     ],
      //   ),
      // ),
    );
  }

  @override
  PdfDisplayViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PdfDisplayViewModel();

  @override
  void onViewModelReady(PdfDisplayViewModel viewModel) {
    // TODO: implement onViewModelReady
    viewModel.initialize(
        // "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf");
        fileUrl);
    super.onViewModelReady(viewModel);
  }
}
