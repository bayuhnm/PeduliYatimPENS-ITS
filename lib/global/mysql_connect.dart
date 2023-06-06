// import 'package:mysql1/mysql1.dart';

// Future<MySqlConnection> connectToMySQL() async {
//   final settings = ConnectionSettings(
//     host: '83.136.216.103',
//     port: 3306, // default MySQL port
//     user: 'pedu2552_donatur',
//     password: 'Web_pyatiM15',
//     db: 'pedu2552_donatur',
//   );

//   final connection = await MySqlConnection.connect(settings);
//   return connection;
// }

// Future<void> fetchDataFromMySQL() async {
//   final connection = await connectToMySQL();

//   final results = await connection.query('SELECT * FROM users');

//   for (var row in results) {
//     print(row.fields); // Do something with the retrieved data
//   }

//   await connection.close();
// }

