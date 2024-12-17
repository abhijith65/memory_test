import 'package:memorymaze/views/screens/memorymaze/view.dart';
import 'package:stacked/stacked_annotations.dart';


@StackedApp(
  routes: [
    MaterialRoute(page: MemoryMazeView, initial: true),
  ],
)
class AppSetup{}