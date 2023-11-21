import 'package:flutter/material.dart';

import 'package:weather_app_dart/scr/core/assets/app_images.dart';
import 'package:weather_app_dart/scr/core/data/data_source/cities_data_source.dart';
import 'package:weather_app_dart/scr/core/data/models/data_cities_model.dart';
import 'package:weather_app_dart/scr/core/di/cities_injection_container.dart';

import 'package:weather_app_dart/scr/core/styles/colors/colors.dart';
import 'package:weather_app_dart/scr/core/styles/paddings.dart';
import 'package:weather_app_dart/scr/core/styles/text_styles/text_styles.dart';
import 'package:weather_app_dart/scr/core/utils/logger.dart';
import 'package:weather_app_dart/scr/core/widgets/background_widget.dart';
import 'package:weather_app_dart/scr/core/widgets/loader_widget.dart';

class CitySearchPage extends StatefulWidget {
  const CitySearchPage({super.key});

  @override
  State<CitySearchPage> createState() => _CitySearchPageState();
}

class _CitySearchPageState extends State<CitySearchPage> {
  var _inputCity = '';
  var _listData = <DataCityModel>[];
  static const _hintText = 'Enter the city';
  var _isLoaded = true;

  @override
  void initState() {
    _inputCity = '';
    _listData = <DataCityModel>[];
    super.initState();
  }

  void _onChachedTextField(newInput) async {
    _inputCity = newInput;
    _isLoaded = false;
    setState(() {});
    if (_inputCity.length > 2) {
      _isLoaded = false;
      final citySearcDataSource = slCities<CitySearchDataSource>();
      _listData = (await citySearcDataSource
              .fetchData(additionalQueryParams: {'q': _inputCity}))
          .listCitiesDataModel;

      logDebug(_listData);
    } else {
      _listData = [];
    }
    _isLoaded = true;
    setState(() {});
  }

  Widget _buildCityButton(DataCityModel dataCityModel) {
    return ListTile(
      onTap: () {
        logDebug(
            'country =${dataCityModel.country}, city= ${dataCityModel.cityName}, location code = ${dataCityModel.key}');
        Navigator.pop(context, dataCityModel);
      },
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.border),
        color: AppColors.transparent,
        child: Text(
          dataCityModel.cityName,
          style: AppTextStyles().body,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      assetBackGroundImage: AppImages.cityBackground,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: AppBar(
              backgroundColor: AppColors.transparent,
              title: TextField(
                onChanged: _onChachedTextField,
                style: AppTextStyles().body,
                decoration: InputDecoration(
                    hintText: _hintText, hintStyle: AppTextStyles().hintText),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          body: _isLoaded ? _buildBody() : const LoaderWidget(),
        ),
      ),
    );
  }

  ListView _buildBody() {
    return ListView(
      children: [
        ..._listData
            .map(
              (e) => _buildCityButton(e),
            )
            .toList(),
      ],
    );
  }
}
