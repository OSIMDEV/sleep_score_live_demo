/// FileName Utils
///
/// @Author hugo
/// @Date 2023/12/22 06:59
///
/// @Description TODO
int safeParseInt(String? text) => int.tryParse(text ?? '') ?? 0;
double safeParseDouble(String? text) => double.tryParse(text ?? '') ?? 0.0;
