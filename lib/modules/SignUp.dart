import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Core/Locale/shared_pref.dart';
import '../Cubits/register/register_cubit.dart';
import 'Admin/AdminMain.dart';
import 'Login.dart';
import 'leader/leader.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  static List<String> username = [];

  @override
  void initState() {
    super.initState();
  }

  bool _isVisible = false;
  var _formKey1 = GlobalKey<FormState>();
  var _controller3 = TextEditingController();
  var _controller4 = TextEditingController();
  var _controller5 = TextEditingController();

  Widget Name() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        controller: _controller3,
        validator: ((value) {
          if (value!.isEmpty || !RegExp(r'^[\w]+$').hasMatch(value)) {
            return "Enter your name correctly";
          } else
            return null;
        }),
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.man,
            color: IconTheme.of(context).color,
          ),
          border: OutlineInputBorder(),
          labelText: "Name",
          hintText: "Shady Osama",
        ),
      ),
    );
  }

  Widget email() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: Container(
          child: TextFormField(
        controller: _controller4,
        validator: ((value) {
          if (value!.isEmpty ||
              !RegExp(r'^[a-z A-Z]([\w]|-|[\.])*[@]{1}[a-z A-Z]{5,8}[\.]{1}[a-z A-Z]{2,3}$')
                  .hasMatch(value)) {
            return "Enter your email correctly";
          } else
            return null;
        }),
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.email,
            color: IconTheme.of(context).color,
          ),
          border: OutlineInputBorder(),
          labelText: "Email",
          hintText: "email@gmail.com",
        ),
      )),
    );
  }

  Widget password() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty ||
              !(RegExp(r'^[a-z A-Z]{1}[\w]*$')).hasMatch(value)) {
            return ("Enter Correct Password");
          } else {
            return null;
          }
        },
        obscureText: _isVisible,
        controller: _controller5,
        // autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: _isVisible
                ? Icon(
                    Icons.visibility_off,
                    color: IconTheme.of(context).color,
                  )
                : Icon(
                    Icons.visibility,
                    color: IconTheme.of(context).color,
                  ),
            onPressed: () {
              setState(() {
                _isVisible = !_isVisible;
              });
            },
          ),
          hintText: "Password",
          labelText: "Password",
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegitserState>(
      listener: (context, state) {
        RegisterCubit authL = RegisterCubit.get(context);
        if (state is SuccessfulDataUsers) {
          Fluttertoast.showToast(
              msg: "data loaded successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          if (authL.reply2.type != "chef") {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (_) {
              return AdminMain(nameA: authL.reply2.name as String);
            }));
          } else {
            String nmyr = authL.reply2.name as String;
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (_) {
              return Leader(name: nmyr);
            }));
          }
          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          //   return AdminMain();
          // }));
        }
        if (state is ErrorDataUsers) {
          Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        RegisterCubit auth = RegisterCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("Registration"),
            backgroundColor: Color(0xFF363f93),
            leading: IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => LoginPage()),
                      (route) => false);
                },
                icon: Icon(Icons.arrow_back)),
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.dstATop),
                  fit: BoxFit.fill,
                  image: AssetImage(
                      "assets/images/violet-color-wallpaper_093424938.jpg")),
              // gradient: LinearGradient(
              //     begin: Alignment.topRight,
              //     end: Alignment.bottomLeft,
              //     colors: [Color(0xff363f93), Colors.cyanAccent])
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey1,
                child: Column(children: [
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: []),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Create Account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Name(),
                  SizedBox(
                    height: 30,
                  ),
                  email(),
                  SizedBox(
                    height: 30,
                  ),
                  password(),
                  SizedBox(
                    height: 120,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Sign In",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                        SizedBox(
                          width: 200,
                        ),
                        FloatingActionButton(
                            child: Icon(Icons.east),
                            backgroundColor: Colors.black45,
                            onPressed: () {
                              //////////////////////////////////////////

                              auth.getUsers(
                                  _controller3, _controller4, _controller5);
////////////////////////////////////////////////////////////////
                              if (_formKey1.currentState!.validate()) {
                                SnackBar snackbar = SnackBar(
                                    content: Text(
                                        "Name ${_controller3.value.text} \n email ${_controller4.value.text}"));

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackbar);
                              }
                              username.add("${_controller4.value.text}");
                              CacheHelper.saveData(
                                  key: "username", value: username);
                            }),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
