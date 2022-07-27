import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stream_builder/message.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 64,
            ),
            const CircleAvatar(
              radius: 80,
              backgroundColor: Color.fromRGBO(189, 255, 215, 0.49),
              child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      "https://static.wikia.nocookie.net/peaky-blinders/images/8/8e/Tommys3.jpg/revision/latest?cb=20190715140230")),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 36, bottom: 16),
              child: Text(
                "Full Name",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Avenir"),
              ),
            ),
            const SizedBox(
              height: 101,
              width: 257,
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(114, 114, 114, 1),
                  fontFamily: "Avenir",
                  height: 1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            socialBox(
                "https://seeklogo.com/images/L/linkedin-icon-logo-32AA14A009-seeklogo.com.png",
                "LinkedIn"),
            socialBox(
                "https://seeklogo.com/images/L/linkedin-icon-logo-32AA14A009-seeklogo.com.png",
                "Facebook"),
            socialBox(
                "https://seeklogo.com/images/L/linkedin-icon-logo-32AA14A009-seeklogo.com.png",
                "instagram"),
            socialBox(
                "https://seeklogo.com/images/L/linkedin-icon-logo-32AA14A009-seeklogo.com.png",
                "My website"),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                circleLink(
                    "https://cdn2.iconfinder.com/data/icons/social-messaging-ui-color-shapes-2-free/128/social-whatsapp-circle-512.png"),
                SizedBox(
                  width: 25,
                ),
                circleLink(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/768px-Facebook_Logo_%282019%29.png"),
                SizedBox(
                  width: 25,
                ),
                GestureDetector(
                  onTap: () {
                    print("object");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Message();
                    }));
                  },
                  child: circleLink(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/2048px-Instagram_icon.png"),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }

  CircleAvatar circleLink(String link) {
    return CircleAvatar(
      radius: 25,
      backgroundImage: NetworkImage(link),
    );
  }

  Padding socialBox(String link, String name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {},
        child: Container(
            height: 54,
            width: 299,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(243, 242, 255, 1),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.network(link),
                ),
                SizedBox(
                  width: 64,
                ),
                Center(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Avenir",
                      color: Colors.black,
                      height: 1,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
