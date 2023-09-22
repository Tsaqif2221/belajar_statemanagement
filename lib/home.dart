import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Login/login.dart';
import 'home_notifier.dart';
import 'signup/signup.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => HomeNotifier(context),
        child: Consumer<HomeNotifier>(
          builder: (context, value, child) => SafeArea(
            child: Scaffold(
                body: SliderDrawer(
              appBar: SliderAppBar(
                appBarPadding: const EdgeInsets.all(10),
                title: const Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.shopping_basket,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "SportsShop",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontFamily: 'Exo2',
                      ),
                    )
                  ],
                ),
                drawerIconColor: Colors.blue,
                trailing: IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: SearchBar());
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                ),
                appBarColor: Colors.white,
              ),
              slider: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(top: 30),
                child:
                    ListView(scrollDirection: Axis.vertical, children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: Image.network(
                              'data:image/jpeg;base64,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')
                          .image,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) => LoginPage());
                              Navigator.push(context, route);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: 170,
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) => SignupPage());
                              Navigator.push(context, route);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: 170,
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton.icon(
                    onPressed: () => AlertLog(context),
                    icon: const Icon(Icons.notifications),
                    label: const SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Notifikasi",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () => AlertLog(context),
                    icon: const Icon(Icons.shopping_cart),
                    label: const SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Keranjang",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () => AlertLog(context),
                    icon: const Icon(Icons.wechat),
                    label: const SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Chat",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () => AlertLog(context),
                    icon: const Icon(Icons.ballot_outlined),
                    label: const SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Riwayat Pesanan",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () => AlertLog(context),
                    icon: const Icon(Icons.access_time),
                    label: const SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Terakhir Dilihat",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () => AlertLog(context),
                    icon: const Icon(Icons.device_unknown),
                    label: const SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Pusat Bantuan",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () => AlertLog(context),
                    icon: const Icon(Icons.settings),
                    label: const SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Pengaturan",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              child: Scaffold(
                backgroundColor: Colors.white,
                body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      expandedHeight: 250.0,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Image.asset(
                          "assets/pixel.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        Container(
                          margin: const EdgeInsets.only(
                            top: 7,
                            right: 100,
                            left: 100,
                          ),
                          height: 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, blurRadius: 7)
                              ],
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.blue),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.white,
                                ),
                                height: 35,
                                width: 60,
                                child: Center(
                                  child: IconButton(
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.shopping_bag,
                                        color: Colors.blue,
                                      )),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                height: 35,
                                width: 60,
                                child: Center(
                                  child: IconButton(
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onPressed: () => AlertLog(context),
                                      icon: const Icon(
                                        Icons.newspaper,
                                        color: Colors.white,
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                        CarouselSlider(
                          items: [
                            'assets/1.jpg',
                            'assets/2.jpg',
                            'assets/3.jpg',
                            'assets/4.jpg',
                            'assets/5.webp',
                          ].map((item) {
                            return Builder(builder: (BuildContext context) {
                              return InkWell(
                                onTap: () => AlertLog(context),
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      item,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              );
                            });
                          }).toList(),
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, blurRadius: 10)
                              ],
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              const Text(
                                "kategori",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: 'Exo2'),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                  ),
                                  itemCount: value.d.length,
                                  itemBuilder: (context, index) {
                                    return Align(
                                      alignment: Alignment.center,
                                      child: ElevatedButton(
                                        onPressed: () => AlertLog(context),
                                        style: ElevatedButton.styleFrom(
                                            shape: const CircleBorder(),
                                            backgroundColor: Colors.white),
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                            value.d[index],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, blurRadius: 10)
                              ],
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.grid_view_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Rekomendasi",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Exo2",
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.90,
                            ),
                            itemCount: value.a.length,
                            itemBuilder: (context, index) {
                              return Align(
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () => AlertLog(context),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    width: 230,
                                    height: 265,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey, blurRadius: 7)
                                      ],
                                    ),
                                    child: ListView(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(value.a[index]),
                                        ),
                                        Text(
                                          value.b[index],
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        Text(
                                          value.c[index],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ]),
                    )
                  ],
                ),
              ),
            )),
          ),
        ));
  }
}

void AlertLog(BuildContext context) {
  Alert(
      style: const AlertStyle(
          titleStyle: TextStyle(fontFamily: "Exo2", color: Colors.blue),
          descStyle: TextStyle(color: Colors.grey)),
      context: context,
      title: "Ingin lihat???",
      type: AlertType.info,
      desc: "Masuk/daftar dulu!!!!!",
      buttons: [
        DialogButton(
            child: const Text(
              "Masuk",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            }),
        DialogButton(
            child: const Text(
              "Daftar",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupPage()),
              );
            })
      ]).show();
  return;
}

class SearchBar extends SearchDelegate {
  List<String> searchTerms = [
    "Adidas Tabela 23 Men's Jersey - Black",
    "New Balance Fresh Foam Arishi V4 Women's Running- Arctic Grey With Light Arctic Grey",
    "Puma Active Big Logo Men's T-Shirt - Dark Blue",
    "ASTEC GIZA WOMEN' LONGSLEEVE TSHIRT - NAVY",
    "Nike Flex Runner 2 JP Baby/Toddler Shoes - Black",
    "SKECHERS MINI SOCCER BALL Unisex's Football - BLACK WHITE",
    "Skechers GOrun Elevate - Accelerate Men's Running Shoes - Off White",
    "SKECHERS 3PK NO SHOW PRF MEN'S SOCKS - MULTICOLOR",
    "DIADORA GELANG MEN'S T-SHIRT - BLACK",
    "Nike Liverpool FC Strike Soccer Ball - Red",
    "Spalding 2021 Varsity Fiba TF150 Basketball - Orange",
    "Babolat PA Team RAFA Unstrung No Cover - Yellow",
    "ASTEC HENI WOMEN'S BASIC TSHIRT - BLACK",
    "Skechers Twi Lites Star Amazing Girl's Sneakers Shoes - WHITE/SILVER",
    "Reebok Glide Ripple Men Lifestyle Shoes - Black",
    "Diadora Gustavo Women Running Shoes - Purple",
    "Airwalk Shantal Tshirt JR Girls- Black",
    "Adidas Super Sala 2 Indoor Men's Futsal Shoes - Night Grey",
    "Puma Active Big Logo Men's T-Shirt - Dark Blue",
    "Babolat RH12 Pure Aero RAFA Tennis Racket Bag - Orange/Purple",
    "Mikasa Volly-V330W",
    "Tennis ball Dunlop Fort 3",
    "ASTEC HURLEY MEN'S FUTSAL - NAVY",
    "Reebok ANKLE Boy's Socks - Misty71/Dark Grey/Black",
    "Molten H2R - Handball Original",
    "MOLTEN Net Volley VN-003",
    "Specs Original Hyperchaos FG Meta Crush Pack 101990 BNIB",
    "Nassau Bola Volly New Premium",
    "Space Run Eagle Shoes",
    "SPECS ILLUZION II MADA FB TRAINING BALL - WHITE/CYAN/PINK",
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListView(
          children: [
            Text(result),
          ],
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.all(5),
                child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent)),
                  onPressed: () => AlertLog(context),
                  icon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  label: Text(
                    result,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 15, color: Color.fromARGB(255, 91, 91, 91)),
                  ),
                )),
            const Divider(
              thickness: 1,
            ),
          ],
        );
      },
    );
  }
}
