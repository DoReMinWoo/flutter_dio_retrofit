import 'package:flutter/material.dart';
import 'package:flutter_dio_retrofit/presentation/view_model/user_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({super.key});

  @override
  UserScreenState createState() => UserScreenState();
}

class UserScreenState extends ConsumerState<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final userProviderResult = ref.watch(userProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod Example'),
        ),
        body: Center(
          child: userProviderResult.when(
            loading: () => const CircularProgressIndicator(),
            data: (reqresEntity) {
              final users = reqresEntity;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                    title: Text('${user.firstName} ${user.lastName}'),
                    subtitle: Text(user.email),
                  );
                },
              );
            },
            error: (error, stackTrace) {
              return Text('Error: $error');
            },
          ),
        ),
      ),
    );
  }
}
