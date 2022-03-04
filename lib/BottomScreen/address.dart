import 'package:flutter/material.dart';
import 'package:transvision_app1/utils/routes.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget addTextField(String label, String hint) {
      return TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            )),
      );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: const Text("Address"),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
          child: SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    addTextField("House/Flat No", "House/Flat No"),
                    const SizedBox(
                      height: 15.0,
                    ),
                    addTextField(
                      "LandMark",
                      "LandMark",
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: addTextField("City", "Enter Your City")),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                            child: addTextField("State", "Ebter Your State")),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: addTextField("Country", "Enter Your Country")),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                        child: addTextField("Pin Code", "Enter Your Pin-Code")),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: addTextField("PAN NO", "Enter Your Pan-No")),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child:
                            addTextField("Mobile No", "Enter Your Mobile No")),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                        child: addTextField(
                            "Contact No", "Enter Your Contact No")),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: addTextField(
                            "Primary E-mail", "Enter Your Primary E-mail")),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: addTextField(
                            "Secondary E-mail", "Enter Your Secondary E-mail")),
                  ],
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, MyRoutes.bookingDetailsRoute);
                      },
                      child: Center(
                        child: Container(
                          height: 50.0,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.orange[400],
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.save_sharp,
                                size: 25.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "Save",
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, MyRoutes.bookingDetailsRoute);
                      },
                      child: Center(
                        child: Container(
                          height: 50.0,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.green[200],
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.edit_outlined,
                                size: 25.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "Edit",
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
