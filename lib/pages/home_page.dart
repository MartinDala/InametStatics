import "package:flutter/material.dart";
import 'package:inametstatics/model/provincias_list.dart';
import 'package:inametstatics/pages/detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Provincias _provincias = Provincias();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("INAMET"),
          centerTitle: true,
          backgroundColor: Color(0xFF444444)),
      backgroundColor: Color(0xFF161414),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "images/nuvem.png",
                width: 150,
              ),
            ),
            Center(
              child: Text(
                "INAMET STATICS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.shortestSide,
              child: ListView.builder(
                  itemCount: _provincias.todasProvincias().length,
                  itemBuilder: (context, index) {
                    Provincias provincia = _provincias.todasProvincias()[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(color: Color(0xFF212121)),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => DetailPage(
                                  provincia: provincia.value,
                                ),
                              ),
                            ),
                            child: ListTile(
                              title: Text(
                                "${provincia.nome}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
