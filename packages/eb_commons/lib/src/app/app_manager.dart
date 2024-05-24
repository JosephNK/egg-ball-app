part of '../../eb_commons.dart';

class EBAppManager extends LFAppManager {
  static final EBAppManager _instance = EBAppManager._internal();
  static EBAppManager get shared => _instance;
  EBAppManager._internal();
}
