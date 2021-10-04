/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 html_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'html_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HtmlFormState extends Equatable {
  const HtmlFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class HtmlFormUninitialized extends HtmlFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''HtmlFormState()''';
  }
}

// HtmlModel has been initialised and hence HtmlModel is available
class HtmlFormInitialized extends HtmlFormState {
  final HtmlModel? value;

  @override
  List<Object?> get props => [ value ];

  const HtmlFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class HtmlFormError extends HtmlFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const HtmlFormError({this.message, HtmlModel? value }) : super(value: value);

  @override
  String toString() {
    return '''HtmlFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDHtmlFormError extends HtmlFormError { 
  const DocumentIDHtmlFormError({ String? message, HtmlModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDHtmlFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdHtmlFormError extends HtmlFormError { 
  const AppIdHtmlFormError({ String? message, HtmlModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdHtmlFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class NameHtmlFormError extends HtmlFormError { 
  const NameHtmlFormError({ String? message, HtmlModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''NameHtmlFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class HtmlHtmlFormError extends HtmlFormError { 
  const HtmlHtmlFormError({ String? message, HtmlModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''HtmlHtmlFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ConditionsHtmlFormError extends HtmlFormError { 
  const ConditionsHtmlFormError({ String? message, HtmlModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ConditionsHtmlFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class HtmlFormLoaded extends HtmlFormInitialized { 
  const HtmlFormLoaded({ HtmlModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''HtmlFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableHtmlForm extends HtmlFormInitialized { 
  const SubmittableHtmlForm({ HtmlModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableHtmlForm {
      value: $value,
    }''';
  }
}


