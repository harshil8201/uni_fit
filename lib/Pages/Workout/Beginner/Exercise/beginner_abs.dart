import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uni_fit/Class/color_class.dart';
import 'package:uni_fit/Pages/workout/Beginner/Start%20Exercise/b_abs_start.dart';

class BeginnerAbs extends StatefulWidget {
  const BeginnerAbs({Key key}) : super(key: key);

  @override
  _BeginnerAbsState createState() => _BeginnerAbsState();
}

class _BeginnerAbsState extends State<BeginnerAbs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.29,
            color: Colors.black12,
            child: Hero(
              tag: 'beginner-image-1',
              child: Image.asset(
                'assets/images/beginner/absB.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.29,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('beginnerAbs')
                    .orderBy("no", descending: false)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data.docs[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 25),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => Padding(
                                padding: const EdgeInsets.only(
                                    top: 100, bottom: 120, right: 30, left: 30),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: primaryWhite,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: [
                                        SingleChildScrollView(
                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.025,
                                                ),
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.29,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.639,
                                                  color: shadeWhite
                                                      .withOpacity(0.25),
                                                  child: FadeInImage(
                                                    image: NetworkImage(
                                                      data['img'],
                                                    ),
                                                    placeholder:
                                                        const AssetImage(
                                                      'assets/images/loading.gif',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  child: Text(
                                                    data['name']
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.025,
                                                      fontFamily: 'popBold',
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "Sets : " + data['set'],
                                                  style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.0225,
                                                    fontFamily: 'popMedium',
                                                    color: primaryGreen,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 25,
                                                          left: 25,
                                                          bottom: 30),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        data['step']
                                                            .toString()
                                                            .replaceAll(
                                                                "-", "\n\n- "),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.019,
                                                          fontFamily:
                                                              'popLight',
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.0625,
                                              width: double.infinity,
                                              color: primaryWhite,
                                              child: Center(
                                                child: Text(
                                                  'Okay',
                                                  style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.025,
                                                    fontFamily: 'popBold',
                                                    color: primaryGreen,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: primaryWhite,
                              boxShadow: [
                                BoxShadow(
                                  color: shadowBlack,
                                  offset: const Offset(0, 0),
                                  blurRadius: 20.0,
                                ), //BoxShadow
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.14,
                                    width: MediaQuery.of(context).size.width *
                                        0.306,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: shadeWhite.withOpacity(0.25),
                                    ),
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['name']
                                            .toString()
                                            .toUpperCase()
                                            .replaceAll(" ", '\n'),
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.021,
                                          fontFamily: 'popBold',
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.00625,
                                      ),
                                      Text(
                                        "Sets : " + data['set'],
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.019,
                                          fontFamily: 'popMedium',
                                          color: primaryGreen,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: MediaQuery.of(context).size.height * 0.0375,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 110, left: 20),
            child: Text(
              'beginner\nAbs WorkOut'.toUpperCase(),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'popBold',
                fontSize: MediaQuery.of(context).size.height * 0.03125,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: const BeginnerAbsStart(),
                        ));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.0625,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primaryGreen,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: shadowBlack,
                          offset: const Offset(0, 0),
                          blurRadius: 20.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Ready'.toUpperCase(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'popBold',
                          fontSize: MediaQuery.of(context).size.height * 0.0288,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
