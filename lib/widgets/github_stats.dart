import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:get_it/get_it.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

import '../services/services.dart';

class GithubStats extends StatelessWidget {
  const GithubStats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.colorScheme.onSecondary,
      height: 800,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Container(
              padding: EdgeInsets.symmetric(horizontal: context.width / 18),
              width: double.infinity,
              child: Text("GitHub Stat",
                  style: context.theme.textTheme.displaySmall)),
          15.height,
          Flexible(
              child: Center(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  child: FutureBuilder<Map<DateTime, int>?>(
                      future: GetIt.instance<Services>().getGitHubStats(),
                      builder: (cx, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          print(snapshot.data);
                          return Container(
                            child: HeatMap(
                              scrollable: true,
                              datasets: snapshot.data,
                              colorsets: {
                                1: Colors.green[100]!,
                                2: Colors.green[300]!,
                                3: Colors.green[500]!,
                                4: Colors.green[700]!,
                                5: Colors.green[900]!,
                              },
                              // weekDaysLabels: [
                              //   'Mon',
                              //   'Tue',
                              //   'Wed',
                              //   'Thu',
                              //   'Fri',
                              //   'Sat',
                              //   'Sun'
                              // ],
                              // monthsLabels: [
                              //   "",
                              //   "Jan",
                              //   "Feb",
                              //   "Mar",
                              //   "Apr",
                              //   "May",
                              //   "Jun",
                              //   "Jul",
                              //   "Aug",
                              //   "Sep",
                              //   "Oct",
                              //   "Nov",
                              //   "Dec"
                              // ],
                              // squareSize: 14.0,
                              // textOpacity: 0.3,
                              // labelTextColor: Colors.grey[700],
                              // dayTextColor: Colors.grey[800],
                              // locale: 'en',
                            ),
                          );

                          return Text(snapshot.data.toString());
                        }
                        return const LinearProgressIndicator();
                      }))),
          const Spacer(),
        ],
      ),
    );
  }
}
