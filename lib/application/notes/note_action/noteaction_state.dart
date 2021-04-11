part of 'noteaction_bloc.dart';

@freezed
class NoteactionState with _$NoteactionState {
  const factory NoteactionState.initial() = _Initial;
  const factory NoteactionState.loadingAction() = _LoadingAction;
  const factory NoteactionState.deleteSuccess() = _DeleteSuccess;
  const factory NoteactionState.deleteFailure(NoteFailure failure) =
      _DeleteFailure;
}
