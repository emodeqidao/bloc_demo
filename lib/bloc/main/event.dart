abstract class MainEvent {}

class InitEvent extends MainEvent {}



class SelectEvent extends MainEvent {
  final int selectIndex;

  SelectEvent(this.selectIndex);

}