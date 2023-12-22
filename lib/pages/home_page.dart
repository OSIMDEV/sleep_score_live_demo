import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sleep_score_live_demo/components/buttons.dart';
import 'package:sleep_score_live_demo/components/labels.dart';
import 'package:sleep_score_live_demo/pages/chart_page.dart';
import 'package:sleep_score_live_demo/style/colors.dart';
import 'package:sleep_score_live_demo/utils/Utils.dart';
import 'package:sleep_score_live_demo/view_model/home_page_view_model.dart';

import '../components/lines.dart';

part 'home_page.g.dart';

/// FileName home_page
///
/// @Author hugo
/// @Date 2023/12/21 13:41
///
/// @Description TODO
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'Home',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton.filled(
              onPressed: () {
                const ChartRoute().push(context);
              },
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.black87,
              ),
            ),
          ],
          centerTitle: true,
          backgroundColor: Color(color_fff5f5dc.value),
        ),
        body: HomePageViewModel.createBuilder(
          (context, viewModel, child) => (() {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Label(
                      text: 'Your sleep score:',
                      size: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ValueListenableBuilder(
                    valueListenable: viewModel.score,
                    builder: (_, __, ____) => DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: const Color(0xfff5f5dc),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Center(
                            child: Label(
                              text: viewModel.score.value,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Label(
                      text: 'Input:',
                      size: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Line(
                    text: 'Total(hours):',
                    hintText: 'Total sleep duration',
                    size: 18,
                    onValueChanged: (text) {
                      viewModel.osd = safeParseDouble(text);
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Line(
                    text: 'DEEP(hours):',
                    hintText: 'Deep sleep duration',
                    size: 18,
                    onValueChanged: (text) {
                      viewModel.rDeep = safeParseDouble(text);
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Line(
                    text: 'REM(hours):',
                    hintText: 'Rapid eyes moving duration',
                    size: 18,
                    onValueChanged: (text) {
                      viewModel.rRem = safeParseDouble(text);
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Line(
                    text: 'Age:(years)',
                    hintText: 'Age of mortals(0~100)',
                    size: 18,
                    onValueChanged: (text) {
                      viewModel.age = safeParseDouble(text);
                    },
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Button(
                    'Press to Compute',
                    size: 18,
                    bgColor: color_ff32cd32,
                    color: Colors.white,
                    onPressed: () {
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

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}
