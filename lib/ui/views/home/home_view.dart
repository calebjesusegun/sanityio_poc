import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../blogs/blogs_view.dart';
import '../dashboard/dashboard_view.dart';
import '../products/products_view.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: getViewForIndex(viewModel.currentIndex),
      bottomNavigationBar: SizedBox(
        //height: 70,
        child: BottomNavigationBar(
          elevation: 5,
          selectedItemColor: kcPrimaryColor,
          unselectedItemColor: kcGray30,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: viewModel.currentIndex,
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          unselectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.w500, color: kcGray30),
          onTap: viewModel.setIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Iconsax.home_1,
              ),
              activeIcon: Icon(
                Iconsax.home5,
              ),
              label: 'Blogs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.wallet_3),
              activeIcon: Icon(
                Iconsax.activity,
              ),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.category),
              activeIcon: Icon(
                Iconsax.category5,
              ),
              label: 'Dashboard',
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

Widget getViewForIndex(int index) {
  switch (index) {
    case 0:
      return const BlogsView();
    case 1:
      return const ProductsView();
    case 2:
      return const DashboardView();
    default:
      return const BlogsView();
  }
}
