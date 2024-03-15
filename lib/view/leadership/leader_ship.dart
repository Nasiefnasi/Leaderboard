// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, use_key_in_widget_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:leaderboardapp/controller/api_integrat.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({Key? key});

  @override
  Widget build(BuildContext context) {
    dynamic plasce = "";
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: "Leaderboard".text.bold.make(),
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.chevron_left_sharp)),
      ),
      body: Consumer<ApiControler>(builder: (context, value, child) {
        return SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    children: [
                      const Spacer(),
                      "Region:".text.bold.sm.make(),
                      10.widthBox,
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: const BorderSide(
                                    width: 1, color: Colors.black54)),
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.location_on_rounded,
                            color: Colors.blue,
                          ),
                          label: "$plasce".text.blue800.sm.make())
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: mediaquery.width,
                  height: mediaquery.height * .26,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.red,
                  ),
                ),
              ),
              10.heightBox,
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(20)),
                      color: Colors.grey.shade200,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              "Username".text.xl.gray600.make(),
                              "Points".text.xl.gray600.make(),
                            ],
                          ),
                        ),
                        Expanded(
                          child: FutureBuilder(
                            future: Provider.of<ApiControler>(context,
                                    listen: false)
                                .fetchResource(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: "Error ${snapshot.error}".text.make(),
                                );
                              } else {
                                final data = Provider.of<ApiControler>(context,
                                        listen: false)
                                    .data[0];
                                final plasce = data.region;
                                final leaderss = data.leaders;
                                // final leaderss = snapshot.data!;
                                return ListView.builder(
                                  itemCount: leaderss.length,
                                  itemBuilder: (context, index) {
                                    final leader = leaderss[index];
                                    Color color = Colors.primaries[
                                        index * 1 % Colors.primaries.length];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 1, horizontal: 17),
                                      child: Card(
                                        color: Colors.white,
                                        child: Container(
                                          width: mediaquery.width,
                                          height: mediaquery.height * .07,
                                          child: Row(
                                            children: [
                                              15.widthBox,
                                              "${index + 1}.".text.bold.make(),
                                              const SizedBox(width: 10),
                                              CircleAvatar(
                                                backgroundColor: color,
                                              ),
                                              10.widthBox,
                                              "${leader.name}".text.xl.make(),
                                              const Spacer(),
                                              "${leader.points}"
                                                  .text
                                                  .size(10)
                                                  .make(),
                                              15.widthBox,
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                            //   ListView.builder(
                            //     itemCount: 35,
                            //     itemBuilder: (context, index) {
                            //       Color color = Colors
                            //           .primaries[index * 1 % Colors.primaries.length];
                            //       return Padding(
                            //         padding: const EdgeInsets.symmetric(
                            //             vertical: 1, horizontal: 17),
                            //         child: Card(
                            //           color: Colors.white,
                            //           child: Container(
                            //             width: mediaquery.width,
                            //             height: mediaquery.height * .07,
                            //             child: Row(
                            //               children: [
                            //                 15.widthBox,
                            //                 "${index + 1}.".text.bold.make(),
                            //                 const SizedBox(width: 10),
                            //                 CircleAvatar(
                            //                   backgroundColor: color,
                            //                 ),
                            //                 10.widthBox,
                            //                 "name".text.xl.make(),
                            //                 const Spacer(),
                            //                 "000".text.size(10).make(),
                            //                 15.widthBox,
                            //               ],
                            //             ),
                            //           ),
                            //         ),
                            //       );
                            //     },
                            //   ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
