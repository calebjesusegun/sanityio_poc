import 'package:sanityio_poc/services/api_service.dart';
import 'package:sanityio_poc/services/sanityio_service.dart';
import 'package:sanityio_poc/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:sanityio_poc/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:sanityio_poc/ui/views/blogs/blogs_view.dart';
import 'package:sanityio_poc/ui/views/dashboard/dashboard_view.dart';
import 'package:sanityio_poc/ui/views/home/home_view.dart';
import 'package:sanityio_poc/ui/views/products/products_view.dart';
import 'package:sanityio_poc/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sanityio_poc/ui/views/products/pdf_display/pdf_display_view.dart';
// @stacked-import

@StackedApp(
  logger: StackedLogger(),
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: ProductsView),
    MaterialRoute(page: BlogsView),
    MaterialRoute(page: PdfDisplayView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SanityIOService),
    LazySingleton(classType: ApiService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
