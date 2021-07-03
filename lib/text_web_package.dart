import 'package:eliud_pkg_text/platform/text_platform.dart';
import 'package:eliud_pkg_text/platform/web_text_platform.dart';
import 'package:eliud_pkg_text/text_package.dart';

class TextWebPackage extends TextPackage {
  @override
  void init() {
    super.init();
    // initialise the platform
    AbstractTextPlatform.platform = WebTextPlatform();
  }

  @override
  List<Object?> get props => [
  ];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is TextWebPackage &&
              runtimeType == other.runtimeType;
}
