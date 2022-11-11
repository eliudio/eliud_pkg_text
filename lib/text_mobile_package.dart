import 'package:eliud_pkg_text/platform/mobile_text_platform.dart';
import 'package:eliud_pkg_text/platform/text_platform.dart';
import 'package:eliud_pkg_text/text_package.dart';

TextPackage getTextPackage() => TextMobilePackage();

class TextMobilePackage extends TextPackage {
  @override
  void init() {
    super.init();
    // initialise the platform
    AbstractTextPlatform.platform = MobileTextPlatform();
  }

  @override
  List<Object?> get props => [
  ];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is TextMobilePackage &&
              runtimeType == other.runtimeType;


}
