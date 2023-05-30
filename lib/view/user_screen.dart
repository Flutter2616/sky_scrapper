import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/model/user_model.dart';
import 'package:sky_scrapper/provider/user_provider.dart';
import 'package:sky_scrapper/utils/api_helper.dart';

class Userscreen extends StatefulWidget {
  const Userscreen({Key? key}) : super(key: key);

  @override
  State<Userscreen> createState() => _UserscreenState();
}

class _UserscreenState extends State<Userscreen> {
  Userprovider? uf;
  Userprovider? ut;

  @override
  Widget build(BuildContext context) {
    uf = Provider.of<Userprovider>(context, listen: false);
    ut = Provider.of<Userprovider>(context, listen: true);
    return SafeArea(
      child: Scaffold(floatingActionButton: FloatingActionButton(onPressed: () async {
        uf!.rendomuser(
            await Apihelper.apihelper.user_api());
      },child: Icon(Icons.refresh,color: Colors.white,size: 25),backgroundColor: Colors.red.shade900),
          appBar: AppBar(
              backgroundColor: Colors.red.shade900,
              centerTitle: true,
              title: Text("User data")),
          body: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              } else if (snapshot.hasData) {
                // uf!.rendomuser(snapshot.data);
                Usermodel user = snapshot.data!;
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: double.infinity,height: 600,
                      decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          border: Border.all(color: Colors.black, width: 2)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                  radius: 70,
                                  backgroundImage: NetworkImage(
                                      "${user.results![0].picture!.large}")),
                              SizedBox(width: 10),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 200,
                                    child: Text(
                                        "Name: ${user.results![0].name!.title}.${user.results![0].name!.first} ${user.results![0].name!.last}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  Text("Gender: ${user.results![0].gender}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                      "Country: ${user.results![0].location!.country}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                                "Date of Birth: ${user.results![0].dob!.date}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.black)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("Email: ${user.results![0].email}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.black)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("Phone: ${user.results![0].phone}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.black)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("Id: ${user.results![0].id!.value}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.black)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                                "registered Date: ${user.results![0].registered!.date}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.black)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                                "username: ${user.results![0].login!.username}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.black)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                                "password: ${user.results![0].login!.password}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.black)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                                "postcode: ${user.results![0].location!.postcode}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Center(
                  child: CircularProgressIndicator(color: Colors.red.shade900));
            },
            future: uf!.user_api_calling(),
          )),
    );
  }
}
