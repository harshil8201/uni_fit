import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uni_fit/color_class.dart';

class IntermediateLegs extends StatefulWidget {
  const IntermediateLegs({Key key}) : super(key: key);

  @override
  _IntermediateLegsState createState() => _IntermediateLegsState();
}

class _IntermediateLegsState extends State<IntermediateLegs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 230,
            color: Colors.black12,
            child: Hero(
              tag: 'intermediate-image-5',
              child: Image.asset(
                'assets/images/intermediate/legsI.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 230,
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
                    .collection('leg')
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
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  height: 230,
                                                  width: 230,
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
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      fontFamily: 'popBold',
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "Sets : " + data['seti'],
                                                  style: TextStyle(
                                                    fontSize: 18,
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
                                                        style: const TextStyle(
                                                          fontSize: 15,
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
                                              height: 50,
                                              width: double.infinity,
                                              color: primaryWhite,
                                              child: Center(
                                                child: Text(
                                                  'Okay',
                                                  style: TextStyle(
                                                    fontSize: 20,
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
                            height: 120,
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
                                    height: 110,
                                    width: 110,
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
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'popBold',
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Sets : " + data['seti'],
                                        style: TextStyle(
                                          fontSize: 15,
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
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 110, left: 20),
            child: Text(
              'intermediate\nLegs WorkOut'.toUpperCase(),
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontFamily: 'popBold',
                fontSize: 25,
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
                child: Container(
                  height: 50,
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
                      'Start'.toUpperCase(),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontFamily: 'popBold',
                        fontSize: 23,
                        letterSpacing: 2,
                        color: Colors.white,
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
