
import 'package:doublevpartners/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';
import '../presentation/screens/screens.dart';



mixin RouterMixin{
  
  final _router = GoRouter(
    routes: [
      GoRoute(path: '/',
      name: 'home',
      builder: (_, __) => const InitScreen()
      ),
      GoRoute(path: '/signinscreen',
      name: 'signinscreen',
      builder: (_, __) => const Signinscreen(),
      ),
       GoRoute(path: '/signupscreen',
      name: 'signupscreen',
      builder: (_, __) => const SignUpScreen(),
      ),
      GoRoute(path: '/homescreen',
      name: 'homescreen',
      builder: (_, __) => const HomeScreen(),
      ),
    
  ]
  );
 
 GoRouter get router => _router;

}