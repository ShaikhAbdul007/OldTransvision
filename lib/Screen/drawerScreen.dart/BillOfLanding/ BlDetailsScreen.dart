import 'package:flutter/material.dart';

import 'package:transvision_app1/MyComponent/sizedbox.dart';

class BlDetailScreen extends StatefulWidget {
  const BlDetailScreen({Key? key}) : super(key: key);

  @override
  State<BlDetailScreen> createState() => _BlDetailScreenState();
}

class _BlDetailScreenState extends State<BlDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ExpansionTile(
        title: const Text('Enter Shipper/Consignee details'),
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Shipper",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          // keyboardType: TextInputType.multiline,
                          // maxLines: 5,
                          // minLines: 1,
                          decoration: InputDecoration(
                        hintText: "Enter Shipper",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                      const CustomHeight(),
                      TextField(
                          // keyboardType: TextInputType.multiline,
                          // maxLines: 5,
                          // minLines: 1,
                          decoration: InputDecoration(
                        hintText: "Enter Address",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      ))
                    ],
                  ),
                ),
                const CustomWidth(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Consignee",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          // keyboardType: TextInputType.multiline,
                          // maxLines: 5,
                          // minLines: 1,
                          decoration: InputDecoration(
                        hintText: "Enter Consignee",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                      const CustomHeight(),
                      TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 1,
                          decoration: InputDecoration(
                            hintText: "Enter Address",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9)),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 10.0,
      ),
      ExpansionTile(
          title: const Text('Enter the Notify/Marks No Details'),
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Notify",
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                        ),
                        const CustomHeight(),
                        TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 2,
                            minLines: 1,
                            decoration: InputDecoration(
                              hintText: "Enter Notify",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9)),
                            )),
                      ],
                    ),
                  ),
                  const CustomWidth(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Marks No",
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                        ),
                        const CustomHeight(),
                        TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                              hintText: "Enter Marks No",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9)),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
      const SizedBox(
        height: 10.0,
      ),
      ExpansionTile(
        title: const Text("Enter the Emails of Shipper/Notify"),
        iconColor: Colors.blueAccent,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Consignee Email",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 2,
                          minLines: 1,
                          decoration: InputDecoration(
                            hintText: "Consignee Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9)),
                          )),
                    ],
                  ),
                ),
                const CustomWidth(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Notify Email",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 2,
                          minLines: 1,
                          decoration: InputDecoration(
                            hintText: "Notify Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9)),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 10.0,
      ),
      ExpansionTile(
        title: const Text("Enter the Details of Port/Place"),
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Place Of Acceptance",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Place Of Acceptance",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                    ],
                  ),
                ),
                const CustomWidth(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Place Of Discharge",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Place Of Discharge",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Port Of Loading",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Port Of Loading",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                    ],
                  ),
                ),
                const CustomWidth(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Port Of Delivery",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Port Of Delivery",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 10.0,
      ),
      ExpansionTile(
        title: const Text("Enter the Details of Vessel/Routes"),
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Vessel & Voyage",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Vessel & Voyage",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                    ],
                  ),
                ),
                const CustomWidth(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Route/Transhipment",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Route/Place Of Transhipment",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 10.0,
      ),
      ExpansionTile(
        title: const Text("Enter the Details of Mode/Package/Weight"),
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Mode/Means Of",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Mode/Means Of",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                    ],
                  ),
                ),
                const CustomWidth(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Packages",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Packages",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Net Weight",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Net Weight",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                    ],
                  ),
                ),
                const CustomWidth(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Gross Weight",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Gross Weight",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      ExpansionTile(
        title: const Text("Enter the Details of Measurement"),
        subtitle: const Text("BL's Qty/Freight Payable"),
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Measurement",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Measurement",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                    ],
                  ),
                ),
                const CustomWidth(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Freight Pay",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Freight",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                    ],
                  ),
                ),
                const CustomWidth(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "BL's Qty",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "BL's Qty.",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      ExpansionTile(
        title: const Text("Enter the Details of FreeDay"),
        subtitle: const Text("Place/Freight Amount"),
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "FreeDays Agree",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Free Days Agreed",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                    ],
                  ),
                ),
                const CustomWidth(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Freight Amount",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Freight Amount",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                    ],
                  ),
                ),
                const CustomWidth(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Place\n",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Place",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      ExpansionTile(
        title: const Text("Enter the Details of Date of Issue"),
        subtitle: const Text("Date/Type"),
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Date",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Date",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                    ],
                  ),
                ),
                const CustomWidth(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Date Of Issue",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Date Of Issue",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                    ],
                  ),
                ),
                const CustomWidth(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Type",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Type",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ]);
  }
}
