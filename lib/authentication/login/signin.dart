import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../home/home_page.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_state.dart';
import '../../data/auth_repository.dart';
import '../../data/submission_status.dart';

import 'bloc/login_event.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: const Size(360, 690),
      minTextAdapt: true,
    );
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
          authRepo: context.read<AuthRepository>(),
        ),
        child: Stack(
          children: [
            Image(
              width: double.maxFinite.w,
              alignment: Alignment.topCenter,
              image: const AssetImage('images/top.png'),
            ),
            _signInForm,
          ],
        ),
      ),
    );
  }
}

void _showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Widget get _signInForm {
  final formKey = GlobalKey<FormState>();

  return BlocListener<LoginBloc, LoginState>(
    listener: (context, state) {
      final formStatus = state.formStatus;
      if (formStatus is SubmissionFailed) {
        _showSnackBar(context, formStatus.exception.toString());
      }
    },
    child: SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.only(top: 220.h),
          child: Column(
            children: [
              _text(),
              SizedBox(height: 20.h),
              _usernameField(),
              SizedBox(height: 20.h),
              _passwordField(),
              SizedBox(height: 5.h),
              _forgetPassword(),
              SizedBox(height: 20.h),
              _loginButton(),
              SizedBox(height: 20.h),
              _or(),
              SizedBox(height: 30.h),
              _twoButtons(),
              SizedBox(height: 20.h),
              _signUpText(),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _text() {
  return Align(
    alignment: Alignment.topCenter,
    child: Text(
      "Sign In",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _usernameField() {
  return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextFormField(
        expands: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          constraints: BoxConstraints(maxHeight: 90.h),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: 'Enter email',
        ),
        validator: (value) =>
            state.isValidUsername ? null : 'Email is too short',
        onChanged: (value) => context.read<LoginBloc>().add(
              LoginUsernameChanged(username: value),
            ),
      ),
    );
  });
}

Widget _passwordField() {
  return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextFormField(
        expands: false,
        obscureText: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          constraints: BoxConstraints(maxHeight: 90.h),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1),
          hintText: 'Enter password',
        ),
        validator: (value) =>
            state.isValidPassword ? null : 'Password is too short',
        onChanged: (value) => context.read<LoginBloc>().add(
              LoginPasswordChanged(password: value),
            ),
      ),
    );
  });
}

Widget _forgetPassword() {
  return Padding(
    padding: EdgeInsets.only(right: 20.w),
    child: Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const ForgetPassword(),
          //   ),
          // );
        },
        child: Text(
          'Forgot your Password?',
          style: TextStyle(
            fontSize: 16.sp,
            color: const Color(0xFF7B7890),
          ),
        ),
      ),
    ),
  );
}

Widget _loginButton() {
  return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
    return state.formStatus is FormSubmitting
        ? const CircularProgressIndicator()
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              primary: const Color(0xFF7C37FA),
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 130.w),
              elevation: 0,
              side: BorderSide(color: const Color(0xFF7C37FA), width: 1.w),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
              final formKey = GlobalKey<FormState>();
              if (formKey.currentState!.validate()) {
                context.read<LoginBloc>().add(LoginSubmitted());
              }
            },
            child: Text(
              'Sign In',
              style: TextStyle(color: Colors.white, fontSize: 20.sp),
            ),
          );
  });
}

Widget _or() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 50.w,
        child: const Divider(
          thickness: 2,
        ),
      ),
      SizedBox(width: 8.w),
      Text(
        'Or',
        style: TextStyle(fontSize: 18.sp, color: Colors.grey.withOpacity(0.8)),
      ),
      SizedBox(width: 8.w),
      SizedBox(
        width: 50.w,
        child: const Divider(
          thickness: 2,
        ),
      ),
    ],
  );
}

Widget _twoButtons() {
  return Padding(
    padding: EdgeInsets.only(left: 20.w, right: 20.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: const Color(0xFF3C5A99),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              fixedSize: Size(144.w, 44.h),
              elevation: 0),
          onPressed: () {},
          child: Row(
            children: [
              SizedBox(width: 10.w),
              Text(
                'f',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
              ),
              SizedBox(width: 5.w),
              Text(
                'Facebook',
                style: TextStyle(fontSize: 21.sp),
              )
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: const Color(0xFFF95341),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              fixedSize: Size(144.w, 44.h),
              elevation: 0),
          onPressed: () {},
          child: Row(
            children: [
              SizedBox(width: 16.w),
              Text(
                'G',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
              ),
              Text(
                '+',
                style: TextStyle(fontSize: 15.sp),
              ),
              SizedBox(width: 5.w),
              Text(
                'Google',
                style: TextStyle(fontSize: 21.sp),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _signUpText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Don't have account?",
        style: TextStyle(
          fontSize: 18.sp,
          color: const Color(0xFF7B7890),
        ),
      ),
      TextButton(
        onPressed: () {},
        child: Text(
          'Sign Up',
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF7C37FA)),
        ),
      ),
    ],
  );
}
