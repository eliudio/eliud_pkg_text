/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_with_platform_medium_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'html_with_platform_medium_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HtmlWithPlatformMediumFormState extends Equatable {
  const HtmlWithPlatformMediumFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class HtmlWithPlatformMediumFormUninitialized extends HtmlWithPlatformMediumFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''HtmlWithPlatformMediumFormState()''';
  }
}

// HtmlWithPlatformMediumModel has been initialised and hence HtmlWithPlatformMediumModel is available
class HtmlWithPlatformMediumFormInitialized extends HtmlWithPlatformMediumFormState {
  final HtmlWithPlatformMediumModel? value;

  @override
  List<Object?> get props => [ value ];

  const HtmlWithPlatformMediumFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class HtmlWithPlatformMediumFormError extends HtmlWithPlatformMediumFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const HtmlWithPlatformMediumFormError({this.message, HtmlWithPlatformMediumModel? value }) : super(value: value);

  @override
  String toString() {
    return '''HtmlWithPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDHtmlWithPlatformMediumFormError extends HtmlWithPlatformMediumFormError { 
  const DocumentIDHtmlWithPlatformMediumFormError({ String? message, HtmlWithPlatformMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDHtmlWithPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdHtmlWithPlatformMediumFormError extends HtmlWithPlatformMediumFormError { 
  const AppIdHtmlWithPlatformMediumFormError({ String? message, HtmlWithPlatformMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdHtmlWithPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DescriptionHtmlWithPlatformMediumFormError extends HtmlWithPlatformMediumFormError { 
  const DescriptionHtmlWithPlatformMediumFormError({ String? message, HtmlWithPlatformMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DescriptionHtmlWithPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class HtmlHtmlWithPlatformMediumFormError extends HtmlWithPlatformMediumFormError { 
  const HtmlHtmlWithPlatformMediumFormError({ String? message, HtmlWithPlatformMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''HtmlHtmlWithPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class HtmlMediaHtmlWithPlatformMediumFormError extends HtmlWithPlatformMediumFormError { 
  const HtmlMediaHtmlWithPlatformMediumFormError({ String? message, HtmlWithPlatformMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''HtmlMediaHtmlWithPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ConditionsHtmlWithPlatformMediumFormError extends HtmlWithPlatformMediumFormError { 
  const ConditionsHtmlWithPlatformMediumFormError({ String? message, HtmlWithPlatformMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ConditionsHtmlWithPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class HtmlWithPlatformMediumFormLoaded extends HtmlWithPlatformMediumFormInitialized { 
  const HtmlWithPlatformMediumFormLoaded({ HtmlWithPlatformMediumModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''HtmlWithPlatformMediumFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableHtmlWithPlatformMediumForm extends HtmlWithPlatformMediumFormInitialized { 
  const SubmittableHtmlWithPlatformMediumForm({ HtmlWithPlatformMediumModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableHtmlWithPlatformMediumForm {
      value: $value,
    }''';
  }
}


