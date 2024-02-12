import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../models/products.dart';
import 'products_viewmodel.dart';

class ProductsView extends StackedView<ProductsViewModel> {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Oaks Intelligence Products"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<List<Pdf>>(
                future: viewModel.getProducts(),
                builder: (context, snapshot) {
                  Widget? child;
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.data == null) {
                    child = const Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                        strokeWidth: 6,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    child = Container();
                  } else if (snapshot.hasData) {
                    final posts = snapshot.data ?? [];
                    child = ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: posts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () => viewModel
                              .navigateToPdfDisplayView(posts[index].fileUrl),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Card(
                              child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Text(
                                        posts[index].title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        DateFormat.yMMMMd()
                                            .format(posts[index].createdAt!),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Expanded(child: child!);
                })
          ],
        ),
      ),
    );
  }

  @override
  ProductsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductsViewModel();
}
