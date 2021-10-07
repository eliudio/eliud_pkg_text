/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_medium_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'html_medium_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HtmlMediumFormState extends Equatable {
  const HtmlMediumFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class HtmlMediumFormUninitialized extends HtmlMediumFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''HtmlMediumFormState()''';
  }
}

// HtmlMediumModel has been initialised and hence HtmlMediumModel is available
class HtmlMediumFormInitialized extends HtmlMediumFormState {
  final HtmlMediumModel? value;

  @override
  List<Object?> get props => [ value ];

  const HtmlMediumFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class HtmlMediumFormError extends HtmlMediumFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const HtmlMediumFormError({this.message, HtmlMediumModel? value }) : super(value: value);

  @override
  String toString() {
    return '''HtmlMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDHtmlMediumFormError extends HtmlMediumFormError { 
  const DocumentIDHtmlMediumFormError({ String? message, HtmlMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDHtmlMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class MediumHtmlMediumFormError extends HtmlMediumFormError { 
  const MediumHtmlMediumFormError({ String? message, HtmlMediumModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''MediumHtmlMediumFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class HtmlMediumFormLoaded extends HtmlMediumFormInitialized { 
  const HtmlMediumFormLoaded({ HtmlMediumModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''HtmlMediumFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableHtmlMediumForm extends HtmlMediumFormInitialized { 
  const SubmittableHtmlMediumForm({ HtmlMediumModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableHtmlMediumForm {
      value: $value,
    }''';
  }
}


