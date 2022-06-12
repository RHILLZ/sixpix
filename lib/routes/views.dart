import 'package:get/get.dart';
import 'package:sixpix/bindings/initial_binding.dart';
import 'package:sixpix/views/search_view.dart';

part 'routes.dart';

class Views {
  Views._();

  static const searchView = Routes.searchViewRoute;

  static final routes = [
    GetPage<SearchView>(
        name: Routes.searchViewRoute,
        page: () => const SearchView(),
        binding: InitialBinding()),
    // GetPage<ShowcaseView>(
    //     name: Routes.showcaseViewRoute,
    //     page: () => const ShowcaseView(),
    //     binding: InitialBinding()),
  ];
}
