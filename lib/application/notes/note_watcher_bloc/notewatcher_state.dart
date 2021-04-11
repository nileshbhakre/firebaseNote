part of 'notewatcher_bloc.dart';

@freezed
class NotewatcherState with _$NotewatcherState {
  const factory NotewatcherState.initial() = _Initial;
  const factory NotewatcherState.loadInProgress() = DataTransferInProgress;
  const factory NotewatcherState.loadSuccess(KtList<Note?> notes) = LoadSuccess;
  const factory NotewatcherState.loadFailure(NoteFailure noteFailure) =
      LoadFailure;
}
