import 'package:bytebank/screens/contact_list.dart';
import 'package:bytebank/screens/transactions_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  _showContactsList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ContactsList(),
      ),
    );
  }

  _showTransactionFeed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransactionsList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset('assets/images/bytebank_logo.png'),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _FeatureItem(
                  name: 'Transfer',
                  icon: Icons.monetization_on,
                  onClick: () {
                    _showContactsList(context);
                  },
                ),
                _FeatureItem(
                  name: 'Transactions Feed',
                  icon: Icons.description,
                  onClick: () {
                    _showTransactionFeed(context);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String? name;
  final IconData? icon;
  final Function? onClick;

  const _FeatureItem({
    this.name,
    this.icon,
    this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick!(),
          child: Container(
            padding: const EdgeInsets.all(8),
            width: 150,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
                Text(
                  '$name',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
