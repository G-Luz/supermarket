// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupController on SignupControllerBase, Store {
  late final _$nameAtom =
      Atom(name: 'SignupControllerBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'SignupControllerBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'SignupControllerBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$repeatPasswordAtom =
      Atom(name: 'SignupControllerBase.repeatPassword', context: context);

  @override
  String get repeatPassword {
    _$repeatPasswordAtom.reportRead();
    return super.repeatPassword;
  }

  @override
  set repeatPassword(String value) {
    _$repeatPasswordAtom.reportWrite(value, super.repeatPassword, () {
      super.repeatPassword = value;
    });
  }

  late final _$accountTypeAtom =
      Atom(name: 'SignupControllerBase.accountType', context: context);

  @override
  AccountType get accountType {
    _$accountTypeAtom.reportRead();
    return super.accountType;
  }

  @override
  set accountType(AccountType value) {
    _$accountTypeAtom.reportWrite(value, super.accountType, () {
      super.accountType = value;
    });
  }

  late final _$enableButtonAtom =
      Atom(name: 'SignupControllerBase.enableButton', context: context);

  @override
  bool get enableButton {
    _$enableButtonAtom.reportRead();
    return super.enableButton;
  }

  @override
  set enableButton(bool value) {
    _$enableButtonAtom.reportWrite(value, super.enableButton, () {
      super.enableButton = value;
    });
  }

  late final _$SignupControllerBaseActionController =
      ActionController(name: 'SignupControllerBase', context: context);

  @override
  dynamic onNameChanged(String name) {
    final _$actionInfo = _$SignupControllerBaseActionController.startAction(
        name: 'SignupControllerBase.onNameChanged');
    try {
      return super.onNameChanged(name);
    } finally {
      _$SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onEmailChanged(String email) {
    final _$actionInfo = _$SignupControllerBaseActionController.startAction(
        name: 'SignupControllerBase.onEmailChanged');
    try {
      return super.onEmailChanged(email);
    } finally {
      _$SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onPasswordChanged(String password) {
    final _$actionInfo = _$SignupControllerBaseActionController.startAction(
        name: 'SignupControllerBase.onPasswordChanged');
    try {
      return super.onPasswordChanged(password);
    } finally {
      _$SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onRepeatPasswordChanged(String repPassword) {
    final _$actionInfo = _$SignupControllerBaseActionController.startAction(
        name: 'SignupControllerBase.onRepeatPasswordChanged');
    try {
      return super.onRepeatPasswordChanged(repPassword);
    } finally {
      _$SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onChangedTypeAccount(int index) {
    final _$actionInfo = _$SignupControllerBaseActionController.startAction(
        name: 'SignupControllerBase.onChangedTypeAccount');
    try {
      return super.onChangedTypeAccount(index);
    } finally {
      _$SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateFields() {
    final _$actionInfo = _$SignupControllerBaseActionController.startAction(
        name: 'SignupControllerBase.validateFields');
    try {
      return super.validateFields();
    } finally {
      _$SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
password: ${password},
repeatPassword: ${repeatPassword},
accountType: ${accountType},
enableButton: ${enableButton}
    ''';
  }
}
