import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../sign_in/page/sign_in_page.dart';
import '../../tab_bar/page/tab_bar_page.dart';
import '../bloc/signup_bloc.dart';
import '../widget/sign_up_content.dart';






class SingUpPage extends StatelessWidget {
  const SingUpPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: _buildBody(context));
  }

  BlocProvider<SignUpBloc> _buildBody(BuildContext context){
    return BlocProvider<SignUpBloc>(
      create: (BuildContext context) => SignUpBloc(),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listenWhen: (_, currState) => currState is NextTabBarPageState || currState is NextSignInPageState || currState is ErrorState, 
        listener: (context, state){
        if(state is NextTabBarPageState){
          Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (_) => TabBarPage() ));
        } else if(state is NextSignInPageState){
          Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (_) => const SignInPage()));
        } 
      },
      buildWhen: (_, currState) => currState is SignUpInitial,
      builder: (context, state){
        return const SignUpContent();
      },
    ),
   );
 }

}