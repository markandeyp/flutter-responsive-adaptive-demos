import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StateChangeExample(),
    );
  }
}

class ResponsiveExample extends StatelessWidget {
  const ResponsiveExample({Key? key}) : super(key: key);
  final String _text =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vehicula dolor et nisl maximus interdum. Mauris fringilla ac dolor sit amet sollicitudin. Vestibulum id vehicula neque, sed consectetur elit. Nulla vel blandit leo. Phasellus pellentesque nibh nec nunc aliquet, sit amet suscipit est finibus. Sed a enim eu purus aliquet rutrum. Sed vestibulum neque sit amet est rutrum, at aliquet sapien tincidunt. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean facilisis nulla libero, vitae iaculis ipsum ullamcorper commodo.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(children: [
          Expanded(flex: 2, child: Text(_text)),
          const SizedBox(width: 20),
          Expanded(flex: 2, child: Text(_text))
        ]),
      ),
    );
  }
}

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 500) {
          return const WideUI();
        } else {
          return const NarrowUI();
        }
      },
    ));
  }
}

class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Screen Size: ${size.width}",
            style: const TextStyle(fontSize: 30),
          ),
          Text("Orientation: ${orientation.name}",
              style: const TextStyle(fontSize: 30))
        ],
      ),
    ));
  }
}

class WideUI extends StatelessWidget {
  const WideUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [1, 2, 3, 4]
            .map<Widget>((e) => SizedBox(
                  height: 100,
                  width: 100,
                  child: Container(
                      color: Color.fromARGB(255, e * 30, e * 40, e * 50)),
                ))
            .toList(),
      ),
    );
  }
}

class NarrowUI extends StatelessWidget {
  const NarrowUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [1, 2, 3, 4]
            .map<Widget>((e) => SizedBox(
                  height: 100,
                  width: 100,
                  child: Container(
                      color: Color.fromARGB(255, e * 30, e * 40, e * 50)),
                ))
            .toList(),
      ),
    );
  }
}

class AspectRatioExample extends StatelessWidget {
  const AspectRatioExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 3 / 1,
              child: Container(
                alignment: Alignment.center,
                color: Colors.red,
                child: const Text("Aspect ratio 3/1"),
              ),
            ),
            AspectRatio(
              aspectRatio: 5 / 2,
              child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: const Text("Aspect ratio 5/2")),
            )
          ],
        ),
      ),
    );
  }
}

class OrientationBuilderExample extends StatelessWidget {
  const OrientationBuilderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return orientation == Orientation.portrait
              ? const NarrowUI()
              : const WideUI();
        },
      ),
    );
  }
}

class StateChangeExample extends StatelessWidget {
  StateChangeExample({Key? key}) : super(key: key);
  final Key _inputKey = GlobalKey(debugLabel: 'txtName');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Container(
              padding: const EdgeInsets.all(20),
              child: orientation == Orientation.landscape
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Name"),
                        Flexible(
                            child: TextField(
                          key: _inputKey,
                        ))
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [const Text("Name"), TextField(key: _inputKey)],
                    ));
        },
      ),
    );
  }
}
