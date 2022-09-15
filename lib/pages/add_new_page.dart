import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({Key? key}) : super(key: key);

  @override
  _AddNewPageState createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Jewelry'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              BsRow(
                children: [
                  BsCol(
                    padding: EdgeInsets.only(top: 10.h, bottom: 20.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildPadding('Jewelry name'),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            prefixIcon: Icon(Icons.drive_file_rename_outline),
                            hintText: 'Enter jewelry name',
                            hintStyle: valuetextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  BsCol(
                    padding: EdgeInsets.only(top: 10.h, bottom: 20.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildPadding('Jewelry Description'),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            prefixIcon: Icon(Icons.drive_file_rename_outline),
                            hintText: 'Enter jewelry description',
                            hintStyle: valuetextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  BsCol(
                    padding: EdgeInsets.only(top: 10.h, bottom: 20.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildPadding('Jewelry Price'),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            prefixIcon: Icon(Icons.attach_money),
                            hintText: 'Enter jewelry Price',
                            hintStyle: valuetextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  BsCol(
                    padding: EdgeInsets.only(top: 10.h, bottom: 20.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildPadding('Jewelry Price'),
                        BsButton(
                          onPressed: () {},
                          label: const Text(
                            'Add Picture',
                          ),
                          style: const BsButtonStyle(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            backgroundColor: Colors.teal,
                            borderColor: Colors.teal,
                            color: Colors.white,
                          ),
                          prefixIcon: Icons.add,
                          size: BsButtonSize.btnMd,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildPadding(String name) {
    return  Padding(
      padding: const EdgeInsets.only(
        left: 2,
        bottom: 10,
      ),
      child: Text(
        name,
        style: headerTextStyle,
      ),
    );
  }
}

const valuetextStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: Colors.blueGrey,
);

const headerTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: Colors.blueGrey,
);