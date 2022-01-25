import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../login/main_login.dart';

import '../../home/home_page.dart';
import 'bloc/signup_bloc.dart';

import '../../data/auth_repository.dart';
import '../../data/submission_status.dart';

import 'bloc/signup_state.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Widget _signupForm() {
    final formKey = GlobalKey<FormState>();
    return BlocListener<SignupBloc, SignupState>(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _text(),
                SizedBox(height: 30.h),
                _userEmailField(),
                SizedBox(height: 20.h),
                _userPasswordField(),
                SizedBox(height: 20.h),
                _userConfirmPasswordField(),
                SizedBox(height: 40.h),
                _signUpButton(),
                SizedBox(height: 20.h),
                _or(),
                SizedBox(height: 20.h),
                _twoButtons(),
                SizedBox(height: 20.h),
                _signInText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _image() {
    return const Align(
      alignment: Alignment.topCenter,
      child: Image(
        width: double.maxFinite,
        image: AssetImage('images/top.png'),
      ),
    );
  }

  Widget _text() {
    return Align(
      alignment: Alignment.topCenter,
      child: Text(
        "Sign Up",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _userEmailField() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
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
                state.isVaildEmail ? null : 'Email is too short',
            onChanged: (value) => context.read<SignupBloc>().add(
                  SignupEmailChanged(email: value),
                ),
          ),
        );
      },
    );
  }

  Widget _userPasswordField() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
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
              hintText: 'Enter your password',
            ),
            validator: (value) =>
                state.isVaildPassword ? null : 'Password is too short',
            onChanged: (value) => context.read<SignupBloc>().add(
                  SignupPasswordChanged(password: value),
                ),
          ),
        );
      },
    );
  }

  Widget _userConfirmPasswordField() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
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
              hintText: 'Enter confirm password',
            ),
            validator: (value) =>
                state.isVaildPassword ? null : 'Password is too short',
            onChanged: (value) => context.read<SignupBloc>().add(
                  SignupNewpasswordChanged(newPassword: value),
                ),
          ),
        );
      },
    );
  }

  Widget _signUpButton() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting
            ? const CircularProgressIndicator()
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  primary: const Color(0xFF7C37FA),
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 130.w),
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
                    context.read<SignupBloc>().add(SignupSubmitted());
                  }
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
              );
      },
    );
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
          style:
              TextStyle(fontSize: 18.sp, color: Colors.grey.withOpacity(0.8)),
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
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
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
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
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

  Widget _signInText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have account?",
          style: TextStyle(
            fontSize: 18.sp,
            color: const Color(0xFF7B7890),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SigninPage(),
              ),
            );
          },
          child: Text(
            'Sign In',
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF7C37FA)),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignupBloc(
          context.read<AuthRepository>(),
        ),
        child: Stack(
          children: [
            _image(),
            _signupForm(),
          ],
        ),
      ),
    );
  }
}
