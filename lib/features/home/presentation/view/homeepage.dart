import 'package:ecommerce_app/features/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homeepage extends StatelessWidget {
  const Homeepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
//
// class Homeepage extends StatelessWidget {
//   const Homeepage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CounterCubit(),
//       child: Scaffold(
//         appBar: AppBar(title: const Text('Home')),
//         body: Center(
//           child: BlocConsumer<CounterCubit, CounterState>(
//             builder: (context, state) {
//               return Text('counter: ${state.count}');
//             },
//             listener: (context, state) {
//               if (state.count == 5) {
//                 showDialog(
//                   context: context,
//                   builder:
//                       (context) => AlertDialog(
//                         title: Text("congrats"),
//                         content: Text("count is 5"),
//                         actions: [
//                           TextButton(
//                             onPressed: Navigator.of(context).pop,
//                             child: Text("ok"),
//                           ),
//                         ],
//                       ),
//                 );
//               }
//             },
//           ),
//         ),
//         floatingActionButton: BlocBuilder<CounterCubit, CounterState>(
//           builder: (context, state) {
//             return FloatingActionButton(
//               onPressed: () {
//                 context.read<CounterCubit>().increment();
//               },
//               child: Icon(Icons.add),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
