import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:transvision_app1/MyComponent/sizedbox.dart';
import 'package:transvision_app1/MyComponent/text.dart';

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
        title: const NormalText(
            text: "Enter Shipper/Consignee details",
            size: 18.0,
            color: Colors.black),
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
      ExpansionTile(
          title: const NormalText(
              text: "Enter the Notify/Marks No Details",
              size: 18.0,
              color: Colors.black),
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
      ExpansionTile(
        title: const NormalText(
            text: "Enter the Emails of Shipper/Notify",
            size: 18.0,
            color: Colors.black),
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
      ExpansionTile(
        title: const NormalText(
            text: "Enter the Details of Port/Place",
            size: 18.0,
            color: Colors.black),
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
      ExpansionTile(
        title: const NormalText(
            text: "Enter the Details of Vessel/Routes",
            size: 18.0,
            color: Colors.black),
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
      ExpansionTile(
        title: const NormalText(
            text: "Enter the Details of Mode/Package/Weight",
            size: 18.0,
            color: Colors.black),
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
        title: const NormalText(
            text: "Enter the Details of Measurement",
            size: 18.0,
            color: Colors.black),
        subtitle: const NormalText(
            text: "BL's Qty/Freight Payable", size: 15.0, color: Colors.black),
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
        title: const NormalText(
            text: "Enter the Details of FreeDay",
            size: 18.0,
            color: Colors.black),
        subtitle: const NormalText(
            text: "Place/Freight Amount", size: 15.0, color: Colors.black),
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
        title: const NormalText(
            text: "Enter the Details of Date of Issue",
            size: 18.0,
            color: Colors.black),
        subtitle: const NormalText(
            text: "Date/Type", size: 15.0, color: Colors.black),
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
      ExpansionTile(
        title: const NormalText(
            text: "Enter the Description of Good",
            size: 18.0,
            color: Colors.black),
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
                        "Description of Good",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      const CustomHeight(),
                      TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 7,
                          minLines: 1,
                          decoration: InputDecoration(
                            hintText: "Enter Description of Good",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9)),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            NormalText(
                text: "Documents Upload", size: 25.0, color: Colors.blueGrey)
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 10.0, top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const NormalText(
                    text: "VGM", size: 20.0, color: Colors.blueGrey),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        pickFile();
                      },
                      child: const NormalText(
                          text: "Choose File", size: 12.0, color: Colors.black),
                    )),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const NormalText(
                                text: "Save",
                                size: 12.0,
                                color: Colors.black))),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const NormalText(
                                text: "Download",
                                size: 12.0,
                                color: Colors.black))),
                  ],
                ),
                const NormalText(
                    text: "Shipping Instruction (SI)",
                    size: 20.0,
                    color: Colors.blueGrey),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        pickFile();
                      },
                      child: const NormalText(
                          text: "Choose File", size: 12.0, color: Colors.black),
                    )),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const NormalText(
                                text: "Save",
                                size: 12.0,
                                color: Colors.black))),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const NormalText(
                                text: "Download",
                                size: 12.0,
                                color: Colors.black))),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const NormalText(
                          text: "Save", size: 18.0, color: Colors.black),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      )
    ]);
  }

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, dialogTitle: "FilePath");
    if (result == null) return;

    // PlatformFile file = result.files.first;
    // viewFile(file);
  }

  // void viewFile(PlatformFile file) {
  //   OpenFile.open(file.path);
  // }
}
