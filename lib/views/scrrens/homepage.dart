import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrpper_app/controller/helpers/watherhelper.dart';

import '../../controller/wathercontroller.dart';

class homepage extends StatelessWidget {
  homepage({Key? key}) : super(key: key);

  double i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wather App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.network(
              "https://i.pinimg.com/originals/3a/76/20/3a762091c6d9fb10d75ed9793d3beb29.gif",
              fit: BoxFit.fill,
              height: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Consumer<wathercontroller>(
              builder: (context, pro, _) {
                if (pro.data != null) {
                  double i = (pro.data!['main']['feels_like'] - 273.15);
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextField(
                          onSubmitted: (val) {
                            pro.searchData(q: val);
                          },
                          decoration:  InputDecoration(
                            hintText: "Surat City",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$i ".substring(0, 5),
                              style: const TextStyle(fontSize: 40),
                            ),
                            const Text(
                              "°C",
                              style: TextStyle(fontSize: 40),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Wind Speed :-  ",
                              style: TextStyle(fontSize: 22),
                            ),
                            Text(
                              "${pro.data!['wind']['speed']} ",
                              style: const TextStyle(fontSize: 22),
                            ),
                            const Text(
                              "Mph",
                              style: TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Weather & nature :-  ",
                              style: TextStyle(fontSize: 22),
                            ),
                            Text(
                              "${pro.data!['weather'][0]['description']} ",
                              style: const TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Atospheric Pressure :-  ",
                              style: TextStyle(fontSize: 22),
                            ),
                            Text(
                              "${pro.data!['main']['pressure']} ",
                              style: const TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: Text("No Wather details"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
