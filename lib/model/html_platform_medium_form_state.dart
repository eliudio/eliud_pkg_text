/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_platform_medium_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'html_platform_medium_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HtmlPlatformMediumFormState extends Equatable {
  const HtmlPlatformMediumFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class HtmlPlatformMediumFormUninitialized extends HtmlPlatformMediumFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''HtmlPlatformMediumFormState()''';
  }
}

// HtmlPlatformMediumModel has been initialised and hence HtmlPlatformMediumModel is available
class HtmlPlatformMediumFormInitialized extends HtmlPlatformMediumFormState {
  final HtmlPlatformMediumModel? value;

  @override
  List<Object?> get props => [ value ];

  const HtmlPlatformMediumFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class HtmlPlatformMediumFormError extends HtmlPlatformMediumFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const HtmlPlatformMediumFormError({this.message, HtmlPlatformMediumModel? value }) : super(value: value);

  @override
  String toString() {
    return '''HtmlPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDHtmlPlatformMediumFormError extends HtmlPlatformMediumFormError { 
  const DocumentIDHtmlPlatformMediumFormError({ String? message, HtmlPlatformMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDHtmlPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class HtmlReferenceHtmlPlatformMediumFormError extends HtmlPlatformMediumFormError { 
  const HtmlReferenceHtmlPlatformMediumFormError({ String? message, HtmlPlatformMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''HtmlReferenceHtmlPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class MediumHtmlPlatformMediumFormError extends HtmlPlatformMediumFormError { 
  const MediumHtmlPlatformMediumFormError({ String? message, HtmlPlatformMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''MediumHtmlPlatformMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class HtmlPlatformMediumFormLoaded extends HtmlPlatformMediumFormInitialized { 
  const HtmlPlatformMediumFormLoaded({ HtmlPlatformMediumModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''HtmlPlatformMediumFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableHtmlPlatformMediumForm extends HtmlPlatformMediumFormInitialized { 
  const SubmittableHtmlPlatformMediumForm({ HtmlPlatformMediumModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableHtmlPlatformMediumForm {
      value: $value,
    }''';
  }
}


