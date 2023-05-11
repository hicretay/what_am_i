import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'game_provider.dart';


class ApplicationProvider {
  ApplicationProvider._init();
  static ApplicationProvider? _instance;
  static ApplicationProvider? get instance {
    return _instance ??= ApplicationProvider._init();
  }

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(create: (context) => GameProvider()),
  ];
}