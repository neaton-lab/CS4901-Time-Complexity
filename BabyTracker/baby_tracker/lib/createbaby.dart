import 'package:flutter/material.dart';

class CreateBaby extends StatefulWidget {
  const CreateBaby({Key? key}) : super(key: key);

  @override
  State<CreateBaby> createState() => _CreateBabyState();
}

class _CreateBabyState extends State<CreateBaby> {
  final formKey = GlobalKey<FormState>();
  String radioValue = "";
  String name = "";
  String gender = "";
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Baby Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Baby Name
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Name",
                    ),
                    onChanged: (val) {
                      setState(() {
                        name = val;
                      });
                    },
                    validator: (val){
                      if(val!.isNotEmpty){
                        return null;
                      }
                      else {
                        return "Name cannot be empty";
                      }
                    },
                  ),
                ),
                // Baby Gender
                // Padding(
                //     padding: EdgeInsets.symmetric(horizontal: 15),
                //     child: Column(
                //       children: [
                //         RadioListTile(
                //           title: Text("Male"),
                //           value: "male",
                //           groupValue: gender,
                //           onChanged: (value) {
                //             setState(() {
                //               gender = value.toString();
                //             });
                //           },
                //         ),
                //         RadioListTile(
                //           title: Text("Female"),
                //           value: "female",
                //           groupValue: gender,
                //           onChanged: (value) {
                //             setState(() {
                //               gender = value.toString();
                //             });
                //           },
                //         ),
                //         RadioListTile(
                //           title: Text("Other"),
                //           value: "other",
                //           groupValue: gender,
                //           onChanged: (value) {
                //             setState(() {
                //               gender = value.toString();
                //             });
                //           },
                //         )
                //       ],
                //     )),
                FormField(
                  builder: (state) {
                    return Column(
                      children: [
                        RadioListTile<String>(
                          title: Text('Male'),
                          value: 'Male',
                          groupValue: gender,
                          onChanged: (String? value) {
                            setState(() {
                              gender = value!;
                            });
                          }
                        ),
                        RadioListTile<String>(
                          title: Text('Female'),
                          value: 'Female',
                          groupValue: gender,
                          onChanged: (String? value) {
                            setState(() {
                              gender = value!;
                            });
                          }
                        ),
                        RadioListTile<String>(
                          title: Text('Other'),
                          value: 'Other',
                          groupValue: gender,
                          onChanged: (String? value) {
                            setState(() {
                              gender = value!;
                            });
                          }
                        ),
                        Text(
                          state.errorText ?? '',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )
                      ],
                    );
                  },
                  validator: (value) {
                    if (gender == "")
                      return "Please select a gender";
                    return null;
                  },
                ),

                // Baby Birth Date
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Birth Date:'),
                      Text(
                        '${date.month}/${date.day}/${date.year}',
                        style: TextStyle(fontSize: 32),
                      ),
                      ElevatedButton(
                        child: Text('Select Date'),
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: date,
                              firstDate: DateTime(2018),
                              lastDate: DateTime(2100));
                          // if 'CANCEL'
                          if (newDate == null) return;
                          // if 'OK'
                          setState(() => date = newDate);
                        },
                      )
                    ],
                  ),
                ),
                /*$Divider(
                  color: Colors.grey,
                ),*/
                SizedBox(height: 100),
                // Confirm button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                ),
                Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        createBaby();
                      },
                      child: const Text('Confirm',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
  createBaby() async{
    if(formKey.currentState!.validate()) {
      
    }
  }
}
