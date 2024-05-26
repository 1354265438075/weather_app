import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:sd/models/current_weather_data.dart';
import 'package:sd/models/five_days_data.dart';
import 'package:sd/ui/home_controller.dart';
String ?weatherImagePath;
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GetBuilder<HomeController>(
          builder: (controller) =>
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.black],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),),


                  child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 20, top: 20, right: 20),
                      child: TextField(
                        onChanged: (value) => controller.city = value,
                        style: TextStyle(
                          color: Colors.white,
                        ),

                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) => controller.updateWeather(),
                        decoration: InputDecoration(

                          suffix: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintStyle: TextStyle(color: Colors.blue),
                          hintText: 'Search'.toUpperCase(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Have a nice day!",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 20),),
                      Icon(Icons.emoji_emotions,color: Colors.white,)
                      ],
                    )),
                   
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0x66ffffff)
                        ),

                        child:
                        Column(



                                children: [
                                  Image.asset(controller.currentWeatherData.weather![0].main=="Rain"?"assets/heavy-rain.png"
                                      :controller.currentWeatherData.weather![0].main=="Clear"?"assets/full-moon.png":
                        controller.currentWeatherData.weather![0].main=="Clouds"?"assets/clouds2.png":
                        controller.currentWeatherData.weather![0].main=="Snow"?"assets/snowflake.png":
                        controller.currentWeatherData.weather![0].main=="Mist"?"assets/cloud.png":
                        controller.currentWeatherData.weather![0].main=="Drizzle"?"assets/drizzle.png":
                        controller.currentWeatherData.weather![0].main=="Thunderstorm"?"assets/thunderstorm.png":
                                    '',height: 100,width: 100,),

                                  Text(
                                    (controller.currentWeatherData !=
                                        null)
                                        ? '${controller.currentWeatherData.name}'
                                        .toUpperCase()
                                        : '',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .caption
                                        ?.copyWith(
                                      color: Colors.blue,
                                      fontSize: 24,
                                      fontWeight:
                                      FontWeight.bold,
                                      fontFamily:
                                      'flutterfonts',
                                    ),
                                  ),


                            Center(
                              child: Text(
                                DateFormat()
                                    .add_MMMMEEEEd()
                                    .format(DateTime.now()),
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily:
                                  'flutterfonts',
                                ),
                              ),
                            ),
                          Text(
                            (controller.currentWeatherData
                                .weather !=
                                null)
                                ? '${controller.currentWeatherData.weather![0]
                                .main}'
                                : '',
                            style: Theme
                                .of(context)
                                .textTheme
                                .caption
                                ?.copyWith(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily:
                              'flutterfonts',
                            ),
                          ),
                         Text(
                              (controller.currentWeatherData
                                  .weather !=
                                  null)
                                  ? '${controller.currentWeatherData.weather![0]
                                  .description}'
                                  : '',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily:
                                'flutterfonts',
                              ),
                            ),
                            Text(
                              (controller.currentWeatherData
                                  .main !=
                                  null)
                                  ? '${(controller.currentWeatherData.main!
                                  .temp! - 273.15).round().toString()}\u2103'
                                  : '',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(
                                  color: Colors.white,
                                  fontFamily:
                                  'flutterfonts'),
                            ),
                            Text(
                              (controller.currentWeatherData
                                  .main !=
                                  null)
                                  ? 'min: ${(controller.currentWeatherData.main!
                                  .tempMin! - 273.15)
                                  .round()
                                  .toString()}\u2103 / max: ${(controller
                                  .currentWeatherData.main!.tempMax! - 273.15)
                                  .round()
                                  .toString()}\u2103'
                                  : '',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight:
                                FontWeight.bold,
                                fontFamily:
                                'flutterfonts',
                              ),
                            ),
                          ],
                        ),

                      ),
                    ),
                    SizedBox(height: 2,),
                    Container(

                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              (controller.currentWeatherData
                                  .wind !=
                                  null)
                                  ? 'wind ${controller.currentWeatherData.wind!
                                  .speed} m/s'
                                  : '',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight:
                                FontWeight.bold,
                                fontFamily:
                                'flutterfonts',
                              ),
                            ),
                            Icon(Icons.wind_power_outlined,color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),

                        Row(
                          children: [
                            Text(

                              ' Five Top Cities'.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(
                                fontSize: 16,
                                fontFamily: 'flutterfonts',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,

                              ),
                                                ),
                            Icon(
                              Icons.sunny_snowing,
                              color: Colors.white,
                            ),
                          ],
                        ),
                    Container(
                      height: 150,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            VerticalDivider(
                              color: Colors.transparent,
                              width: 5,
                            ),
                        itemCount: controller.dataList.length,
                        itemBuilder: (context, index) {
                          CurrentWeatherData? data;
                          (controller.dataList.length > 0)
                              ? data = controller.dataList[index]
                              : data = null;
                          return Container(
                            width: 130,
                            height: 150,

                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),

                              ),

                              child: Container(
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      (data != null)
                                          ? '${data.name}'
                                          : '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                        fontFamily: 'flutterfonts',
                                      ),
                                    ),
                                    Text(
                                      (data != null)
                                          ? '${(data.main!.temp! - 273.15).round().toString()}\u2103'
                                          : '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                        fontFamily: 'flutterfonts',
                                      ),
                                    ),
                                    Container(
                                      child:         Image.asset(data?.weather![0].main=="Rain"?"assets/heavy-rain.png"
                                          :data?.weather![0].main=="Clear"?"assets/full-moon.png":
                                      data?.weather![0].main=="Clouds"?"assets/clouds2.png":
                                      data?.weather![0].main=="Snow"?"assets/snowflake.png":
                                      data?.weather![0].main=="Mist"?"assets/clouds2.png":
                                      data?.weather![0].main=="Fog"?"assets/clouds2.png":
                                      data?.weather![0].main=="Smoke"?"assets/clouds2.png":
                                      data?.weather![0].main=="Drizzle"?"assets/drizzle.png":
                                      data?.weather![0].main=="Thunderstorm"?"assets/drizzle.png":
                                      '',height: 50,width: 50,),
                                    ),
                                    Text(
                                      (data != null)
                                          ? '${data.weather![0].description}'
                                          : '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.copyWith(
                                        color: Colors.black45,
                                        fontFamily: 'flutterfonts',
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),



                  ],
                ),
              ),

        )

    );
  }
}