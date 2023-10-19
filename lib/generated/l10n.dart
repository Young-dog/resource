// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Resourse`
  String get titleApp {
    return Intl.message(
      'Resourse',
      name: 'titleApp',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get emailLabel {
    return Intl.message(
      'E-mail',
      name: 'emailLabel',
      desc: '',
      args: [],
    );
  }

  /// `forgot your password?`
  String get resetPasswordButtonTitle {
    return Intl.message(
      'forgot your password?',
      name: 'resetPasswordButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordLabel {
    return Intl.message(
      'Password',
      name: 'passwordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get signInButtonTitle {
    return Intl.message(
      'Log in',
      name: 'signInButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUpButtonTitle {
    return Intl.message(
      'Sign up',
      name: 'signUpButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Log in using Google`
  String get signInWithgoogleButtonTitle {
    return Intl.message(
      'Log in using Google',
      name: 'signInWithgoogleButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `username`
  String get usernameLabel {
    return Intl.message(
      'username',
      name: 'usernameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Repeat the password`
  String get confirmPasswordLabel {
    return Intl.message(
      'Repeat the password',
      name: 'confirmPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueButtonTitle {
    return Intl.message(
      'Continue',
      name: 'continueButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get orTitle {
    return Intl.message(
      'or',
      name: 'orTitle',
      desc: '',
      args: [],
    );
  }

  /// `Register with Google`
  String get signUpWithGoogleButtonTitle {
    return Intl.message(
      'Register with Google',
      name: 'signUpWithGoogleButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `The minimum password length is 7 characters\nThe password must contain uppercase and lowercase letters, numbers, or special characters`
  String get passDescription {
    return Intl.message(
      'The minimum password length is 7 characters\nThe password must contain uppercase and lowercase letters, numbers, or special characters',
      name: 'passDescription',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get submitResetPassButtonTitle {
    return Intl.message(
      'Reset Password',
      name: 'submitResetPassButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Write an email. We will send instructions on how to reset your password.`
  String get descriptionResetPassword {
    return Intl.message(
      'Write an email. We will send instructions on how to reset your password.',
      name: 'descriptionResetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Go back`
  String get goBackButtonTitle {
    return Intl.message(
      'Go back',
      name: 'goBackButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `На указанный e-mail была отправлена ссылка для  восстановления. Перейдите по ней и придумайте новый пароль`
  String get successSubmitResetTitle {
    return Intl.message(
      'На указанный e-mail была отправлена ссылка для  восстановления. Перейдите по ней и придумайте новый пароль',
      name: 'successSubmitResetTitle',
      desc: '',
      args: [],
    );
  }

  /// `Изменить пароль`
  String get changePaswordButtonTitle {
    return Intl.message(
      'Изменить пароль',
      name: 'changePaswordButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `На указанный e-mail была отправлена ссылка для подтверждения адреса электронной почты. Перейдите по ней и подтвердите ваши учетные данные`
  String get emailVerifyDescription {
    return Intl.message(
      'На указанный e-mail была отправлена ссылка для подтверждения адреса электронной почты. Перейдите по ней и подтвердите ваши учетные данные',
      name: 'emailVerifyDescription',
      desc: '',
      args: [],
    );
  }

  /// `Отправить повторно`
  String get reSubmitTitle {
    return Intl.message(
      'Отправить повторно',
      name: 'reSubmitTitle',
      desc: '',
      args: [],
    );
  }

  /// `Раннее на указанный e-mail мы отправляли письмо с просьбой подтвердить адрес электронной почты. К сожаленнию подтверждение так и не поступило. Если по какой-то причине вы не получили данное письмо, запросите повторную отправку`
  String get reVerificationDescription {
    return Intl.message(
      'Раннее на указанный e-mail мы отправляли письмо с просьбой подтвердить адрес электронной почты. К сожаленнию подтверждение так и не поступило. Если по какой-то причине вы не получили данное письмо, запросите повторную отправку',
      name: 'reVerificationDescription',
      desc: '',
      args: [],
    );
  }

  /// `Неверный e-mail и/или пароль`
  String get invalidUserCredentialError {
    return Intl.message(
      'Неверный e-mail и/или пароль',
      name: 'invalidUserCredentialError',
      desc: '',
      args: [],
    );
  }

  /// `Некорректный email и/или имя пользователя`
  String get incorrectDataError {
    return Intl.message(
      'Некорректный email и/или имя пользователя',
      name: 'incorrectDataError',
      desc: '',
      args: [],
    );
  }

  /// `Пароли не совпадают и/или не соответсвуют требованиям`
  String get passwordsNotMatchError {
    return Intl.message(
      'Пароли не совпадают и/или не соответсвуют требованиям',
      name: 'passwordsNotMatchError',
      desc: '',
      args: [],
    );
  }

  /// `Отсутсвует сетевое соединение`
  String get missingConnectionError {
    return Intl.message(
      'Отсутсвует сетевое соединение',
      name: 'missingConnectionError',
      desc: '',
      args: [],
    );
  }

  /// `Произошла ошибка`
  String get defaultErrorMessage {
    return Intl.message(
      'Произошла ошибка',
      name: 'defaultErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Учетная запись с данным e-mail уже зарегистрирована в системе`
  String get userAlreadyError {
    return Intl.message(
      'Учетная запись с данным e-mail уже зарегистрирована в системе',
      name: 'userAlreadyError',
      desc: '',
      args: [],
    );
  }

  /// `Подзадача...`
  String get subtaskHintTitle {
    return Intl.message(
      'Подзадача...',
      name: 'subtaskHintTitle',
      desc: '',
      args: [],
    );
  }

  /// `Название задачи...`
  String get taskTitleInput {
    return Intl.message(
      'Название задачи...',
      name: 'taskTitleInput',
      desc: '',
      args: [],
    );
  }

  /// `Критическая`
  String get critical {
    return Intl.message(
      'Критическая',
      name: 'critical',
      desc: '',
      args: [],
    );
  }

  /// `Важная`
  String get important {
    return Intl.message(
      'Важная',
      name: 'important',
      desc: '',
      args: [],
    );
  }

  /// `Средняя`
  String get medium {
    return Intl.message(
      'Средняя',
      name: 'medium',
      desc: '',
      args: [],
    );
  }

  /// `Низкая`
  String get low {
    return Intl.message(
      'Низкая',
      name: 'low',
      desc: '',
      args: [],
    );
  }

  /// `Отложенная`
  String get deferred {
    return Intl.message(
      'Отложенная',
      name: 'deferred',
      desc: '',
      args: [],
    );
  }

  /// `Время +`
  String get timeButtonTitle {
    return Intl.message(
      'Время +',
      name: 'timeButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить`
  String get saveButtonTitle {
    return Intl.message(
      'Сохранить',
      name: 'saveButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Удалить`
  String get deleteButtonTitle {
    return Intl.message(
      'Удалить',
      name: 'deleteButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Добавить`
  String get addButtonTitle {
    return Intl.message(
      'Добавить',
      name: 'addButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Событие`
  String get event {
    return Intl.message(
      'Событие',
      name: 'event',
      desc: '',
      args: [],
    );
  }

  /// `Задача`
  String get task {
    return Intl.message(
      'Задача',
      name: 'task',
      desc: '',
      args: [],
    );
  }

  /// `Цель`
  String get goal {
    return Intl.message(
      'Цель',
      name: 'goal',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
