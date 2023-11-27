import 'package:eliud_core_main/wizards/builders/page_builder.dart';
import 'package:eliud_core_main/model/page_model.dart';
import 'package:eliud_pkg_text/wizards/builders/page/page_with_text.dart';

class WelcomePageBuilder extends PageBuilder {
  WelcomePageBuilder(
    super.uniqueId,
    super.pageId,
    super.app,
    super.memberId,
    super.theHomeMenu,
    super.theAppBar,
    super.leftDrawer,
    super.rightDrawer,
  );

  Future<PageModel> create() async {
    return PageWithTextBuilder(
      uniqueId,
      'Welcome',
      'Welcome',
      'Welcome',
      pageId,
      app,
      memberId,
      theHomeMenu,
      theAppBar,
      leftDrawer,
      rightDrawer,
    ).create();
  }
}
