import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:localization/modules/Admin/AdminMain.dart';
import 'package:localization/modules/leader/leader.dart';
import 'package:localization/modules/settings/setting.dart';
import '../Core/Locale/shared_pref.dart';
import '../Cubits/auth/auth_cubit.dart';
import 'Rooms/rooms.dart';
import 'SignUp.dart';
import '../Layout/homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isVisible = false;
  final _formKey = GlobalKey<FormState>();

  var _controller1 = TextEditingController();
  var _controller2 = TextEditingController();

  Widget email() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, top: 30),
      child: TextFormField(
        //  autovalidateMode: AutovalidateMode.always,
        controller: _controller1,

        validator: ((value) {
          if (value!.isEmpty ||
              !(RegExp(r'^[a-z A-Z]([\w])*$').hasMatch(value))) {
            return "Enter Correct Email";
          } else {
            return null;
          }
        }),
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.email,
            color: IconTheme.of(context).color,
          ),
          border: OutlineInputBorder(),
          hintText: "Name@gmail.com",
          labelText: "Email",
        ),
      ),
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
        controller: _controller2,
        //    maxLines: 2,
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
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        AuthCubit authL = AuthCubit.get(context);
        if (state is SuccessfulDataUsers) {
          Fluttertoast.showToast(
              msg: "data loaded successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          if (authL.reply1.type != "chef") {
            String nmy = authL.reply1.name as String;
            print(nmy);
            print(nmy);
            print(nmy);
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (_) {
              return AdminMain(nameA: nmy);
            }));
          } else {
            String nmy = authL.reply1.name as String;
            print(nmy);
            print(nmy);
            print(nmy);
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (_) {
              return Leader(name: nmy);
            }));
          }
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
        AuthCubit auth = AuthCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => HomePage()),
                        (route) => false);
                  },
                  icon: Icon(Icons.arrow_back)),
            ],
            title: Text('Login Page'),
            backgroundColor: Color(0xFF363f93),
          ),
          drawer: Drawer(
            child: Column(
              children: [
                ListTile(
                    leading: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Settings()));
                        },
                        child: Text("Settings"))),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.white, Colors.white38])),
              child: Center(
                child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(children: [
                              Image.asset(
                                "assets/images/6963.jpg",
                                height: 200,
                                width: double.infinity,
                              ),
                              email(),
                              SizedBox(
                                height: 20,
                              ),
                              password(),
                            ]),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 45, vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 201,
                                ),
                                FloatingActionButton(
                                    child: Icon(Icons.east),
                                    backgroundColor:
                                        Color.fromARGB(255, 58, 7, 139),
                                    onPressed: () {
                                      auth.LoginUsers(
                                          _controller1, _controller2);
                                      if (_formKey.currentState!.validate()) {
                                        // final snackbar = SnackBar(
                                        //   content: Text(
                                        //       "Email ${_controller1.value.text} "),
                                        // );
                                        // ScaffoldMessenger.of(context)
                                        //     .showSnackBar(snackbar);
                                        var snackBar = SnackBar(
                                          elevation: 0,
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                          content: AwesomeSnackbarContent(
                                            color: Colors.green,
                                            title: 'Login Successfully',
                                            message:
                                                '''Email: ${_controller1.value.text} \n Password : ${_controller2.value.text}
                                              ''',
                                            contentType: ContentType.failure,
                                          ),
                                        );

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    }),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 35),
                            child: Row(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      NavigateToSignUp(context);
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                SizedBox(
                                  width: 100,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Forget Password",
                                      style: TextStyle(color: Colors.black),
                                    )),
                              ],
                            ),
                          ),
                        ])),
              ),
            ),
          ),
        );
      },
    );
  }

  void NavigateToSignUp(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SignUp()));
  }
}
