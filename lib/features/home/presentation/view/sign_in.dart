import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sign_in extends StatefulWidget {
  const sign_in({super.key});

  @override
  State<sign_in> createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 40,horizontal: 20)),
          SizedBox(height: 30,),
          Text("Create an account",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,), textAlign: TextAlign.center,),
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
              hintText: 'Username or Email',
              prefixIcon: Icon(Icons.person),
              suffixIcon: Icon(CupertinoIcons.eye),
              filled: true,
              fillColor: Colors.grey[300],
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.transparent),
              )
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock,),
                suffixIcon: IconButton(
                  icon: Icon(
                      _obscurePassword ? CupertinoIcons.eye_slash : CupertinoIcons.eye),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                filled: true,
                fillColor: Colors.grey[300],
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: Colors.transparent),
                )
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
                hintText: 'Confirm Password',
                prefixIcon: Icon(Icons.lock,),
                suffixIcon: IconButton(
                  icon: Icon(
                      _obscureConfirmPassword ? CupertinoIcons.eye_slash : CupertinoIcons.eye),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
                filled: true,
                fillColor: Colors.grey[300],
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: Colors.transparent),
                )
            ),
          ),
          SizedBox(height: 20,),
          Text("By clicking the",style: TextStyle(fontSize: 18),),
          Text("register",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
          Text("button, yoy agree to the public offer",style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: Colors.pink,padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),),child: Text("Create Account",style: TextStyle(color: Colors.white,fontSize: 20),))
        ],
      ),
    );
  }
}
