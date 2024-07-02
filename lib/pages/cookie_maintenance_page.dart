import 'package:cookie_app/providers/cookie_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CookieMaintenancePage extends StatelessWidget {
  const CookieMaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cookie maintenance"),
      ),
      body: Column(
        children: [
          Expanded(child: _CookieList()),
          _CookieEditWidget(),
        ],
      ),
    );
  }
}

class _CookieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cookies = Provider.of<CookieListProvider>(context).cookies;
    return ListView.builder(
      itemCount: cookies.length,
      itemBuilder: (BuildContext context, int index) {
        var cookie = cookies[index];
        return ListTile(
          key: Key(cookies[index].id),
          title: Text(cookies[index].wisdom),
          subtitle: Text("- ${cookies[index].author}"),
          // delete button below
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Provider.of<CookieListProvider>(context, listen: false).deleteCookie(cookie.id);
            },
          ),
        );  

      },
    );
  }
}

class _CookieEditWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CookieEditState();
}

class _CookieEditState extends State<_CookieEditWidget> {
  final _formKey = GlobalKey<FormState>();

  final _wisdomController = TextEditingController();
  final _authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _wisdomController,
                decoration: InputDecoration(
                  hintText: 'enter a wisdom',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'A wisdom is needed';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(
                  hintText: 'enter an author',
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Provider.of<CookieListProvider>(context, listen: false)
                          .addCookie(
                              _wisdomController.text, _authorController.text);
                      _wisdomController.clear();
                      _authorController.clear();
                    }
                  },
                  child: Text('Create cookie'))
            ],
          ),
        ),
      ),
    );
  }
}
