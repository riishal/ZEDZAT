import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tequevia/controller/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, getdata, child) {
      getdata.fetchData();
      return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.assistant_sharp,
                    color: Colors.blue,
                    size: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "ZEDZAT",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 24,
                  ),
                  Icon(Icons.location_on),
                  Text('Karuvambram, Manjeri, india')
                ],
              ),
              Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.white,
                  child: CarouselSlider(
                    options: CarouselOptions(
                        height: 170,
                        aspectRatio: 1 / 2,
                        viewportFraction: 1.0,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        reverse: false,
                        scrollDirection: Axis.horizontal),
                    items: [
                      Container(
                        height: 100,
                        width: 300,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://tse2.mm.bing.net/th?id=OIP.cFYxgvd7hEk7kf66JcaDWQHaEK&pid=Api&P=0'))),
                      ),
                      Container(
                        height: 100,
                        width: 300,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://tse2.mm.bing.net/th?id=OIP.rbBelJqxGvtxenJZfPp5PAHaEK&pid=Api&P=0'))),
                      ),
                      Container(
                        height: 100,
                        width: 300,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://static.wixstatic.com/media/4c4ad3_778d73ddff7b47b48ecbfd7088ba9aea~mv2_d_1200_1200_s_2.jpg/v1/fill/w_1200,h_1200,al_c,q_85/4c4ad3_778d73ddff7b47b48ecbfd7088ba9aea~mv2_d_1200_1200_s_2.jpg'))),
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'product',
                              style: TextStyle(color: Colors.white),
                            ))),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Container(
                    height: 40,
                    width: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.blue)),
                    child: Center(
                        child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'service',
                        style: TextStyle(color: Colors.blue),
                      ),
                    )),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 600,
                child:
                    Consumer<DataProvider>(builder: (context, getdata, child) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 150,
                            childAspectRatio: 2 / 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 20),
                    itemCount: getdata.Data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40,
                              backgroundImage: NetworkImage(
                                  getdata.Data[index].categoryImage)),
                          Text(
                            getdata.Data[index].categoryName,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    },
                  );
                }),
              ),
            ],
          )),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          selectedFontSize: 13,
          unselectedFontSize: 13,
          iconSize: 30,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Offers",
              icon: Icon(Icons.percent_rounded),
            ),
            BottomNavigationBarItem(
              label: "Rewards",
              icon: Icon(Icons.gif_box),
            ),
            BottomNavigationBarItem(
              label: "cart",
              icon: Icon(Icons.card_travel_outlined),
            ),
            BottomNavigationBarItem(
              label: "profile",
              icon: Icon(Icons.account_circle_outlined),
            ),
          ],
        ),
      );
    });
  }
}
