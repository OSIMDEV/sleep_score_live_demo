import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sleep_score_live_demo/utils/Utils.dart';
import 'package:sleep_score_live_demo/view_model/chart_page_view_model.dart';

import '../components/buttons.dart';
import '../components/labels.dart';
import '../components/lines.dart';
import '../style/colors.dart';

part 'chart_page.g.dart';

/// FileName chart_page
///
/// @Author hugo
/// @Date 2023/12/21 13:41
///
/// @Description TODO
class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton.filled(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black87,
            ),
          ),
          centerTitle: true,
          title: const Text(
            'Chart',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Color(color_fff5f5dc.value),
        ),
        body: ChartPageViewModel.createBuilder(
          (context, viewModel, child) => (() {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Label(
                      text: 'Input:',
                      size: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Line(
                    text: 'n:',
                    hintText: 'Key in number of random data',
                    size: 18,
                    onValueChanged: (text) {
                      viewModel.n = safeParseInt(text);
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ValueListenableBuilder(
                    valueListenable: viewModel.barChartData,
                    builder: (_, __, ____) => SizedBox(
                      height: 330,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          color: Color(color_fff5f5dc.value),
                        ),
                        child: BarChart(
                          viewModel.charModel.data,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Button(
                    'Press to Draw',
                    size: 18,
                    bgColor: color_ff32cd32,
                    color: Colors.white,
                    onPressed: () async {
                      viewModel.compute();
                    },
                  ),
                ],
              ),
            );
          })(),
        ),
      );
}

@TypedGoRoute<ChartRoute>(path: '/chart')
class ChartRoute extends GoRouteData {
  const ChartRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ChartPage();
}
