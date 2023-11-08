import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:weather_app_dart/scr/core/assets/app_images.dart';
import 'package:weather_app_dart/scr/core/data_source/data_cities_entity.dart';
import 'package:weather_app_dart/scr/core/styles/colors/colors.dart';
import 'package:weather_app_dart/scr/core/styles/text_styles/text_styles.dart';

class CitySearchPage extends StatefulWidget {
  const CitySearchPage({super.key});

  @override
  State<CitySearchPage> createState() => _CitySearchPageState();
}

var inputCity = '';
var listData = <DataCitiesEntity>[]; //ирндесб название города

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
                  if (kDebugMode) {
                    print(inputCity);
                  }
                  if (inputCity.length > 2) {
                    //new request
                    final url = Uri.http('dataservice.accuweather.com',
                        'locations/v1/cities/autocomplete', {
                      'apikey': 'rYV6RIu503f0dI4vSwuX8QfoygoNZrYq',
                      'q': inputCity
                    });
                    try {
                      var response = await http.get(url);
                      if (kDebugMode) {
                        print('get data');
                      }
                      if (kDebugMode) {
                        print(response.statusCode);
                      }
                      if (response.statusCode == 200) {
                        final List jsonArray =
                            convert.jsonDecode(response.body);
                        listData.clear();
                        for (var element in jsonArray) {
                          print(element);
                          listData.add(DataCitiesEntity.fromJson(element));
                        }
                        if (kDebugMode) {
                          print(jsonArray);
                        }
                        if (kDebugMode) {
                          print(listData);
                        }
                      }
                    } catch (error) {
                      if (kDebugMode) {
                        print(error);
                      }
                    }
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


//http://dataservice.accuweather.com/locations/v1/cities/autocomplete?
// apikey=rYV6RIu503f0dI4vSwuX8QfoygoNZrYq&
// q=Lon
