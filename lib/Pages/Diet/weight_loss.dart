import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uni_fit/color_class.dart';

class WeightLoss extends StatefulWidget {
  const WeightLoss({Key key}) : super(key: key);

  @override
  _WeightLossState createState() => _WeightLossState();
}

class _WeightLossState extends State<WeightLoss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover)),
        child: Stack(
          children: [
            //-------appbar--------
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0562,
                      width: MediaQuery.of(context).size.width * 0.125,
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: superDarkGreen,
                        size: MediaQuery.of(context).size.height * 0.0375,
                      ),
                    ),
                  ),
                  Text(
                    'WEIGHT LOSS',
                    style: TextStyle(
                      color: superDarkGreen,
                      fontSize: MediaQuery.of(context).size.height * 0.0375,
                      fontFamily: 'popBold',
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0562,
                    width: MediaQuery.of(context).size.width * 0.125,
                  ),
                ],
              ),
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('weightLoss')
                  .orderBy("no", descending: false)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data.docs[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 20, left: 25, right: 25),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => Container(
                                height: double.infinity,
                                width: double.infinity,
                                color: primaryWhite,
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.375,
                                      width: double.infinity,
                                      // color: Colors.blue,
                                      child: FadeInImage(
                                        image: NetworkImage(
                                          data['img'],
                                        ),
                                        placeholder: const AssetImage(
                                          'assets/images/loading.gif',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.0562,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.125,
                                          child: Icon(
                                            Icons.arrow_back_rounded,
                                            color: primaryWhite,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.0437,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 250),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: primaryWhite,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(40),
                                            topRight: Radius.circular(40),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 20,
                                            left: 30,
                                            right: 30,
                                          ),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data['name'].toUpperCase(),
                                                  style: TextStyle(
                                                    color: darkGreen,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.0312,
                                                    fontFamily: 'popBold',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.0125,
                                                ),
                                                Text(
                                                  "Calories : " +
                                                      data['cal'] +
                                                      "Cal",
                                                  style: TextStyle(
                                                    color: primaryBlack,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.0187,
                                                    fontFamily: 'popLight',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "Type : " +
                                                      data['type']
                                                          .toString()
                                                          .toLowerCase(),
                                                  style: TextStyle(
                                                    color: primaryBlack,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.0187,
                                                    fontFamily: 'popLight',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.025,
                                                ),
                                                Text(
                                                  'Ingredients: ',
                                                  style: TextStyle(
                                                    color: darkGreen,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.0225,
                                                    fontFamily: 'popLight',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  data['ing']
                                                      .toString()
                                                      .toLowerCase()
                                                      .replaceAll("-", "\n- "),
                                                  style: TextStyle(
                                                    color: primaryBlack,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.0187,
                                                    fontFamily: 'popLight',
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.0375,
                                                ),
                                                Text(
                                                  'Making Process: ',
                                                  style: TextStyle(
                                                    color: darkGreen,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.0225,
                                                    fontFamily: 'popLight',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  data['pro']
                                                      .toString()
                                                      .toLowerCase()
                                                      .replaceAll("-", "\n- "),
                                                  style: TextStyle(
                                                    color: primaryBlack,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.0187,
                                                    fontFamily: 'popLight',
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.0375,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.187,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: primaryGreen,
                              image: DecorationImage(
                                image: NetworkImage(
                                  data['img'],
                                ),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.25),
                                  BlendMode.darken,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, top: 5, bottom: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data['name'].toUpperCase(),
                                    style: TextStyle(
                                      color: primaryWhite,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.0313,
                                      fontFamily: 'popBold',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.025,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Calories : " + data['cal'] + " cal",
                                        style: TextStyle(
                                          color: primaryWhite,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.0188,
                                          fontFamily: 'popLight',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Type : " +
                                            data['type']
                                                .toString()
                                                .toUpperCase(),
                                        style: TextStyle(
                                          color: primaryWhite,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.0188,
                                          fontFamily: 'popLight',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
