// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoState on AbstractTodoState, Store {
  late final _$titleAtom =
      Atom(name: 'AbstractTodoState.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: 'AbstractTodoState.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$AbstractTodoStateActionController =
      ActionController(name: 'AbstractTodoState', context: context);

  @override
  dynamic setTitle(String entry) {
    final _$actionInfo = _$AbstractTodoStateActionController.startAction(
        name: 'AbstractTodoState.setTitle');
    try {
      return super.setTitle(entry);
    } finally {
      _$AbstractTodoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescription(String entry) {
    final _$actionInfo = _$AbstractTodoStateActionController.startAction(
        name: 'AbstractTodoState.setDescription');
    try {
      return super.setDescription(entry);
    } finally {
      _$AbstractTodoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
description: ${description}
    ''';
  }
}
