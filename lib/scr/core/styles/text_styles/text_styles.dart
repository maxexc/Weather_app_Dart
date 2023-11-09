import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_dart/scr/core/styles/colors/colors.dart';
import 'package:weather_app_dart/scr/core/styles/text_styles/font_size.dart';
import 'package:weather_app_dart/scr/core/styles/text_styles/font_weight.dart';

class AppTextStyles {
  get title => GoogleFonts.kanit(
        fontSize: AppFontSizes.title,
        fontWeight: AppFontWeight.semyBold,
        color: AppColors.main,
      );
  get subTitle => GoogleFonts.roboto(
        fontSize: AppFontSizes.subTitle,
        fontWeight: AppFontWeight.semyBold,
        color: AppColors.main,
      );
  get body => GoogleFonts.kanit(
        fontSize: AppFontSizes.body,
        fontWeight: AppFontWeight.normal,
        color: AppColors.main,
      );
  get hintText => GoogleFonts.kanit(
        fontSize: AppFontSizes.hint,
        fontWeight: AppFontWeight.normal,
        color: AppColors.hint,
      );
}
