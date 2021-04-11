import 'package:auto_route/annotations.dart';
import 'package:noteapp2/presentation/pages/note_detail_page.dart';
import 'package:noteapp2/presentation/pages/note_form/note_form_page.dart';
import 'package:noteapp2/presentation/pages/notepage.dart';
import 'package:noteapp2/presentation/pages/signIn_page.dart';
import 'package:noteapp2/presentation/pages/splashpage.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: SplashPage, initial: true),
  AutoRoute(page: SignInPage),
  AutoRoute(page: NotePage),
  AutoRoute(page: NoteDetailPage),
  AutoRoute(page: NoteFormPage),
])
class $AppRouter {}
