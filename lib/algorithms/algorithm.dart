import 'dart:collection';
import 'dart:math';

/// FileName algorithm
///
/// @Author hugo
/// @Date 2023/12/21 22:02
///
/// @Description TODO
final class Algorithm {
  static double score(double d, double s, double t, double age) {
    double ret = -1.0;
    final checkedArgs = _checkArgs(d, s, t, age);
    if (checkedArgs.isNotEmpty) {
      [d, s, t, age] = checkedArgs;
      ret = _score(d, s, t, age);
    }
    return ret;
  }

  static List<double> _checkArgs(double d, double s, double t, double age) {
    age = limit(age, 0.0, 100.0);
    d = limit(d, 0.0, _osdD(age));
    s = limit(s, 0.0, d);
    t = limit(t, 0.0, d);
    if (s + t > d) {
      return [];
    }
    if (d != 0.0) {
      s /= d;
      t /= d;
    }
    return [d, s, t, age];
  }

  static SplayTreeMap<String, int> randomAccess(
    int n,
    SplayTreeMap<String, int> map,
  ) {
    for (int i = 0; i < n; i++) {
      double age = Algorithm.scale(Random.secure().nextDouble(), 0.0, 100.0);
      double d = Algorithm.scale(Random.secure().nextDouble(), 0.0, _osdD(age));
      double s =
          Algorithm.scale(Random.secure().nextDouble(), 0.0, _deepR(age));
      double t = Algorithm.scale(Random.secure().nextDouble(), 0.0, _remR(age));
      final score = _score(d, s, t, age).toStringAsFixed(0);
      if (map.containsKey(score)) {
        map[score] = 1 + map[score]!;
      } else {
        map[score] = 1;
      }
    }
    return map;
  }

  static double _score(double d, double s, double t, double age) {
    final (w0, w1, w2) = (0.3, 0.4, 0.3);
    return 100.0 *
        min(
          w0 * _osd(d, age) + w1 * _ratioDeep(s, age) + w2 * _ratioRem(t, age),
          1.0,
        );
  }

  static double limit(double val, double low, double high) {
    return max(low, min(val, high));
  }

  static double scale(double val, double low, double high) {
    return (1.0 - val) * low + val * high;
  }

  static double _osd(double d, double age) {
    final dAge = _osdD(age);
    var ret = 0.0;
    if (d < 3.0) {
      ret = 0.0;
    } else if (d < (dAge + 3.0) / 2.0) {
      ret = (2.0 * (d - 3.0)) / (3.0 * (dAge - 3.0));
    } else if (d < dAge) {
      ret = (4.0 * d - dAge - 9.0) / (3.0 * (dAge - 3.0));
    } else {
      ret = 1.0;
    }
    return ret;
  }

  static double _osdD(double age) {
    var ret = 0.0;
    if (age < 18.0) {
      ret = 10.0;
    } else if (age < 65.0) {
      ret = 9.0;
    } else {
      ret = 8.0;
    }
    return ret;
  }

  static double _ratioDeep(double s, double age) {
    final rAge = _deepR(age);
    var ret = 0.0;
    if (s < 0.0) {
      ret = 0.0;
    } else if (s < rAge / 2.0) {
      ret = (2.0 * s) / (3.0 * rAge);
    } else if (s < rAge) {
      ret = (4.0 * s - rAge) / (3.0 * rAge);
    } else {
      ret = 1.0;
    }
    return ret;
  }

  static double _deepR(double age) {
    var ret = 0.0;
    if (age < 18.0) {
      ret = 0.25;
    } else if (age < 65.0) {
      ret = 0.2;
    } else {
      ret = 0.15;
    }
    return ret;
  }

  static double _ratioRem(double t, double age) {
    var rAge = _remR(age);
    var ret = 0.0;
    if (t < 0.0) {
      ret = 0.0;
    } else if (t < rAge / 2.0) {
      ret = (2.0 * t) / (3.0 * rAge);
    } else if (t < rAge) {
      ret = (4.0 * t - rAge) / (3.0 * rAge);
    } else {
      ret = 1.0;
    }
    return ret;
  }

  static double _remR(double age) {
    var ret = 0.0;
    if (age < 18.0) {
      ret = 0.25;
    } else if (age < 65.0) {
      ret = 0.25;
    } else {
      ret = 0.25;
    }
    return ret;
  }
}
