import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  late String _message, _name;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            const Center(
                child: Padding(
              padding: EdgeInsets.only(top: 20, bottom: 30),
              child: Text(
                "Message",
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 24, 9, 66)),
              ),
            )),

            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection("messages")
                    .snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('err ${snapshot.error}');
                  } else if (snapshot.data == null) {
                    return Text('no Data');
                  } else {
                    return SizedBox(
                      height: 500,
                      child: ListView.separated(
                        itemCount: snapshot.data!.docs.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                        itemBuilder: (BuildContext context, int index) {
                          _name = snapshot.data!.docs[index].data()["name"];
                          _message =
                              snapshot.data!.docs[index].data()["message"];

                          return Container(
                            height: 125,
                            width: 380,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 254, 254, 207),
                                border: Border.all(
                                    width: 2,
                                    color: Color.fromARGB(255, 24, 9, 66))),
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                "$_name  \n\n$_message",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 24, 9, 66)),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }),

            ////////////////////////////////////////////////////////////////////////////////
            const Divider(
                thickness: 1.5, color: Color.fromARGB(255, 24, 9, 66)),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "Send a message",
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 24, 9, 66)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                  onChanged: (value) {
                    _name = value;
                  },
                  decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 24, 9, 66))))),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                  onChanged: (value) {
                    _message = value;
                  },
                  decoration: InputDecoration(
                      hintText: 'Message',
                      suffixIcon: IconButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection("messages")
                              .add({"name": _name, "message": _message});
                        },
                        icon: Icon(Icons.send),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 24, 9, 66))))),
            ),
          ]),
        ),
      ),
    );
  }
}
