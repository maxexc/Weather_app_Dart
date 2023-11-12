import 'package:flutter/material.dart';

import 'package:weather_app_dart/scr/core/assets/app_images.dart';
import 'package:weather_app_dart/scr/core/data/data_source/cities_data_source.dart';
import 'package:weather_app_dart/scr/core/data/models/data_cities_model.dart';
import 'package:weather_app_dart/scr/core/di/cities_injection_container.dart';

import 'package:weather_app_dart/scr/core/styles/colors/colors.dart';
import 'package:weather_app_dart/scr/core/styles/text_styles/text_styles.dart';

class CitySearchPage extends StatefulWidget {
  const CitySearchPage({super.key});

  @override
  State<CitySearchPage> createState() => _CitySearchPageState();
}

var inputCity = '';
var listData = <DataCityModel>[];

class _CitySearchPageState extends State<CitySearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(AppImages.cityBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: AppBar(
              backgroundColor: AppColors.transparent,
              title: TextField(
                onChanged: (newInput) async {
                  inputCity = newInput;
                  if (inputCity.length > 2) {
                    final citySearcDataSource = slCities<CitySearcDataSource>();
                    listData = (await citySearcDataSource
                            .fetchData(additionalQueryParams: {'q': inputCity}))
                        .listCitiesDataModel;
                    setState(() {});
                  }
                },
                style: AppTextStyles().body,
                decoration: InputDecoration(
                    hintText: 'Enter the city',
                    hintStyle: AppTextStyles().hintText),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          body: ListView(
            children: [
              const Text(''),
              ...listData
                  .map(
                    (e) => Text(
                      e.cityName,
                      style: AppTextStyles().body,
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
