// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i7;

import '../../domain/notes/note.dart' as _i8;
import '../pages/note_detail_page.dart' as _i5;
import '../pages/note_form/note_form_page.dart' as _i6;
import '../pages/notepage.dart' as _i4;
import '../pages/signIn_page.dart' as _i3;
import '../pages/splashpage.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashPageRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i2.SplashPage());
    },
    SignInPageRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i3.SignInPage());
    },
    NotePageRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i4.NotePage());
    },
    NoteDetailPageRoute.name: (entry) {
      var args = entry.routeData.argsAs<NoteDetailPageRouteArgs>(
          orElse: () => NoteDetailPageRouteArgs());
      return _i1.MaterialPageX(
          entry: entry,
          child: _i5.NoteDetailPage(key: args.key, note: args.note));
    },
    NoteFormPageRoute.name: (entry) {
      var args = entry.routeData.argsAs<NoteFormPageRouteArgs>();
      return _i1.MaterialPageX(
          entry: entry,
          child: _i6.NoteFormPage(key: args.key, editednote: args.editednote));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashPageRoute.name, path: '/'),
        _i1.RouteConfig(SignInPageRoute.name, path: '/sign-in-page'),
        _i1.RouteConfig(NotePageRoute.name, path: '/note-page'),
        _i1.RouteConfig(NoteDetailPageRoute.name, path: '/note-detail-page'),
        _i1.RouteConfig(NoteFormPageRoute.name, path: '/note-form-page')
      ];
}

class SplashPageRoute extends _i1.PageRouteInfo {
  const SplashPageRoute() : super(name, path: '/');

  static const String name = 'SplashPageRoute';
}

class SignInPageRoute extends _i1.PageRouteInfo {
  const SignInPageRoute() : super(name, path: '/sign-in-page');

  static const String name = 'SignInPageRoute';
}

class NotePageRoute extends _i1.PageRouteInfo {
  const NotePageRoute() : super(name, path: '/note-page');

  static const String name = 'NotePageRoute';
}

class NoteDetailPageRoute extends _i1.PageRouteInfo<NoteDetailPageRouteArgs> {
  NoteDetailPageRoute({_i7.Key? key, _i8.Note? note})
      : super(name,
            path: '/note-detail-page',
            args: NoteDetailPageRouteArgs(key: key, note: note));

  static const String name = 'NoteDetailPageRoute';
}

class NoteDetailPageRouteArgs {
  const NoteDetailPageRouteArgs({this.key, this.note});

  final _i7.Key? key;

  final _i8.Note? note;
}

class NoteFormPageRoute extends _i1.PageRouteInfo<NoteFormPageRouteArgs> {
  NoteFormPageRoute({_i7.Key? key, required _i8.Note? editednote})
      : super(name,
            path: '/note-form-page',
            args: NoteFormPageRouteArgs(key: key, editednote: editednote));

  static const String name = 'NoteFormPageRoute';
}

class NoteFormPageRouteArgs {
  const NoteFormPageRouteArgs({this.key, required this.editednote});

  final _i7.Key? key;

  final _i8.Note? editednote;
}
