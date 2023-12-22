import 'dart:collection';

import 'package:fl_chart/fl_chart.dart';
import 'package:sleep_score_live_demo/algorithms/algorithm.dart';
import 'package:sleep_score_live_demo/utils/Utils.dart';

/// FileName chart_model
///
/// @Author hugo
/// @Date 2023/12/22 01:21
///
/// @Description TODO
final class ChartModel {
  var _data = BarChartData();

  BarChartData get data => _data;

  Future<void> toBarCharData(n) async {
    final scores = Algorithm.randomAccess(n, SplayTreeMap<String, int>((
      String left,
      String right,
    ) {
      double vLeft = safeParseDouble(left);
      double vRight = safeParseDouble(right);
      if (vLeft == vRight) {
        return 0;
      } else if (vLeft < vRight) {
        return -1;
      } else {
        return 1;
      }
    }));
    final barGroups = <BarChartGroupData>[];
    var keys = scores.keys, max = 1.0;
    for (var index = 0, sz = keys.length; index < sz; ++index) {
      final key = keys.elementAt(index);
      final value = scores[key]!.toDouble();
      if (max < value) {
        max = value;
      }
    }
    for (var index = 0, sz = keys.length; index < sz; ++index) {
      final key = keys.elementAt(index);
      final value = scores[key]!.toDouble();
      final barGroup = BarChartGroupData(
        x: int.parse(key),
        barRods: [
          BarChartRodData(
            fromY: 0.0,
            toY: value / max,
            width: 1.0,
          ),
        ],
      );
      barGroups.add(barGroup);
    }
    _data = BarChartData(
      barGroups: barGroups,
      minY: 0.0,
      maxY: 1.0,
      groupsSpace: 1.0,
      titlesData: FlTitlesData(
        topTitles: AxisTitles(),
        rightTitles: AxisTitles(),
        bottomTitles: AxisTitles(),
      ),
    );
  }
}
