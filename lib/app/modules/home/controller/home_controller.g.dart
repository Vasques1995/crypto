// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<String> _$cypherTitleComputed;

  @override
  String get cypherTitle =>
      (_$cypherTitleComputed ??= Computed<String>(() => super.cypherTitle,
              name: '_HomeControllerBase.cypherTitle'))
          .value;
  Computed<CryptTitle> _$cypherTitleWidgetComputed;

  @override
  CryptTitle get cypherTitleWidget => (_$cypherTitleWidgetComputed ??=
          Computed<CryptTitle>(() => super.cypherTitleWidget,
              name: '_HomeControllerBase.cypherTitleWidget'))
      .value;

  final _$cypherEnumAtom = Atom(name: '_HomeControllerBase.cypherEnum');

  @override
  Cypher get cypherEnum {
    _$cypherEnumAtom.reportRead();
    return super.cypherEnum;
  }

  @override
  set cypherEnum(Cypher value) {
    _$cypherEnumAtom.reportWrite(value, super.cypherEnum, () {
      super.cypherEnum = value;
    });
  }

  final _$cryptsAtom = Atom(name: '_HomeControllerBase.crypts');

  @override
  ObservableList<CryptModel> get crypts {
    _$cryptsAtom.reportRead();
    return super.crypts;
  }

  @override
  set crypts(ObservableList<CryptModel> value) {
    _$cryptsAtom.reportWrite(value, super.crypts, () {
      super.crypts = value;
    });
  }

  final _$encryptAsyncAction = AsyncAction('_HomeControllerBase.encrypt');

  @override
  Future encrypt() {
    return _$encryptAsyncAction.run(() => super.encrypt());
  }

  final _$decryptAsyncAction = AsyncAction('_HomeControllerBase.decrypt');

  @override
  Future decrypt() {
    return _$decryptAsyncAction.run(() => super.decrypt());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic changeCypher(Cypher cypherSelected) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeCypher');
    try {
      return super.changeCypher(cypherSelected);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cypherEnum: ${cypherEnum},
crypts: ${crypts},
cypherTitle: ${cypherTitle},
cypherTitleWidget: ${cypherTitleWidget}
    ''';
  }
}
