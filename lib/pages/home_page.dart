import 'package:flutter/material.dart';
import 'package:rxdart_sample/pages/home_page_viewModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageViewModel viewModel = HomePageViewModel();

  final _titleTextField = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //updateData();
    });
  }

  // String title = "";
  // updateData() {
  //   print("Calling UpdateData func");
  //   viewModel.title.stream.listen(
  //     (value) {
  //       print("Stream: $value");
  //       setState(() {
  //         title = value;
  //       });
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RxDart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder(
                stream: viewModel.titleObservable,
                builder: ((context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return Text(snapshot.data ?? "");
                })),
            TextField(
              controller: _titleTextField,
            ),
            ElevatedButton(
                onPressed: () {
                  print("DidTap");
                  viewModel.updateTitle(_titleTextField.text);
                  //updateData();
                },
                child: const Text("Submit")),
          ],
        ),
      ),
    );
  }
}
