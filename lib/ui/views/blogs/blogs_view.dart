import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../models/blog_post.dart';
import 'blogs_viewmodel.dart';

class BlogsView extends StackedView<BlogsViewModel> {
  const BlogsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BlogsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Oaks Intelligence Dashboard"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<List<Post>>(
                future: viewModel.getBlogPost(),
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
                        return Padding(
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
                                      posts[index].description,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                )),
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
  BlogsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BlogsViewModel();
}
