// ignore_for_file: avoid_unnecessary_containers, unnecessary_string_interpolations, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:leaderboardapp/controller/api_integrat.dart';
import 'package:leaderboardapp/model/storehive/storedata.dart';
import 'package:leaderboardapp/view/leadership/statusbar/leaderbar.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  @override
  void initState() {
    Provider.of<ApiControler>(context, listen: false).fetchResource();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                          label: "${value.regionx}".text.blue800.sm.make())
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  width: mediaquery.width,
                  height: mediaquery.height * .3,
                  child: const StatusBar(),
                ),
              ),
              10.heightBox,
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ValueListenableBuilder(
                    valueListenable:
                        Hive.box<GetModelshive>("hive_box").listenable(),
                    builder: (context, Box<GetModelshive> box, child) {
                      if (box.isEmpty) {
                        return const Center(
                          child: Text("No data available"),
                        );
                      } else {
                        final data = box.get("key") as GetModelshive;
                        final leaderss = data.leaderss;

                        return ListView.builder(
                          itemCount: leaderss.length,
                          itemBuilder: (context, index) {
                            final leader = leaderss[index];
                            Color color = Colors
                                .primaries[index * 1 % Colors.primaries.length];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 17),
                              child: Card(
                                color: Colors.white,
                                child: SizedBox(
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
                                      "${leader.points}".text.size(10).make(),
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
