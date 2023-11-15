import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_dart/scr/core/styles/colors/colors.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  static const _loaderSize = 100.0;
  static const _strokeWidth = 8.0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: _loaderSize,
        width: _loaderSize,
        child: CircularProgressIndicator(
          color: AppColors.main,
          backgroundColor: AppColors.hint,
          strokeWidth: _strokeWidth,
        ),
      ),
    );
  }
}
