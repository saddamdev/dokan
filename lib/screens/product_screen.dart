import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<dynamic> data;
  Future<void> setData() async {
    var jsonData = await getData();
    setState(() => data = jsonData);
  }

  @override
  void initState() {
    setData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return data == null
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: data.length,
                  itemBuilder: (_, i) {
                    final user = data[i];
                    return Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(16),
                      color: Color(0xFFe1f5fe),
                      child: GridTile(
                        header: Text(
                          user['username'],
                          textAlign: TextAlign.center,
                        ),
                        child: Center(
                          child: Text(
                            user['id'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 32),
                          ),
                        ),
                        footer: Text(
                          user['website'],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
              ),
              FlatButton(
                  onPressed: () {
                    setState(() => data = data.reversed.toList());
                  },
                  color: Color(0xFFffd740),
                  child: Text('Filter by id'))
            ],
          );
  }
}
