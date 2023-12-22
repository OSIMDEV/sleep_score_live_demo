import 'package:flutter/widgets.dart';
import 'package:sleep_score_live_demo/algorithms/algorithm.dart';
import 'package:view_model_provider/view_model_provider.dart';

/// FileName HomePageModel
///
/// @Author hugo
/// @Date 2023/12/21 17:42
///
/// @Description TODO
class HomePageViewModel extends ChangeNotifier {
  final score = ValueNotifier<String>('0.0');
  double osd = 0.0;
  double rDeep = 0.0;
  double rRem = 0.0;
  double age = 0.0;

  void compute() {
    score.value = Algorithm.score(osd, rDeep, rRem, age).toStringAsFixed(1);
  }

  static ViewModelProvider<HomePageViewModel> createBuilder(
    ViewModelWidgetBuilder<HomePageViewModel> builder,
  ) =>
      ViewModelProvider<HomePageViewModel>(
        create: (_) => HomePageViewModel(),
        initViewModel: (context, viewModel) {},
        bindViewModel: (context, viewModel) {},
        disposeViewModel: (context, viewModel) {},
        builder: (context, viewModel, child) =>
            builder(context, viewModel, child),
      );

  @override
  String toString() {
    return 'HomePageViewModel{score: $score, osd: $osd, rDeep: $rDeep, rRem: $rRem}';
  }
}
