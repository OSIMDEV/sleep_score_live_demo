import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';
import 'package:sleep_score_live_demo/model/chart_model.dart';
import 'package:view_model_provider/view_model_provider.dart';

/// FileName ChartPageModel
///
/// @Author hugo
/// @Date 2023/12/21 17:42
///
/// @Description TODO
class ChartPageViewModel extends ChangeNotifier {
  int n = 0;
  final charModel = ChartModel();
  var barChartData = ValueNotifier<BarChartData>(BarChartData());

  BarChartData get data => charModel.data;

  void compute() async {
    await charModel.toBarCharData(n);
    barChartData.value = data;
  }

  static ViewModelProvider<ChartPageViewModel> createBuilder(
    ViewModelWidgetBuilder<ChartPageViewModel> builder,
  ) =>
      ViewModelProvider<ChartPageViewModel>(
        create: (_) => ChartPageViewModel(),
        initViewModel: (context, viewModel) {},
        bindViewModel: (context, viewModel) {},
        disposeViewModel: (context, viewModel) {},
        builder: (context, viewModel, child) =>
            builder(context, viewModel, child),
      );
}
