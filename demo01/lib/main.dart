import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello You ~',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Hello You '),
          ),
          body: Center(
            // child: Text(
            //   '世界这么大世界这么大世界这么大世界这么大世界这么大世界这么大世界这么大世界这么大世界这么大世界这么大世界这么大世界这么大世界这么大世界这么大世界这么大世界这么大世界这么大世界这么大世界这么大世界这么大世界这么大世界这么大世界这么大世界这么大世界这么大世界这么大',
            //   textAlign: TextAlign.start,
            //   maxLines: 2,
            //   overflow: TextOverflow.fade,
            //   style: TextStyle(
            //       fontSize: 30.0, color: Color.fromARGB(255, 255, 150, 150)),
            // ),

            child: Container(
              child: new Text('Hi ~',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white
                )
              ),
              alignment: Alignment.topLeft,
              width: 500.0,
              height: 400.0,
              color: Colors.blue
            ),
          )
        )
    );
  }
}
