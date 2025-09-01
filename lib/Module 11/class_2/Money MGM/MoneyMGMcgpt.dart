//
// import 'package:flutter/cupertino.dart';
// import 'MyApp.dart';
//
// void main(){
//   runApp(const MyApp());
// }

// money_manager_main.dart
// Single-file Flutter money management app with a clean, modern UI.
// Copy this to `lib/main.dart` in a new Flutter project and run.

import 'package:flutter/material.dart';
import 'dart:math';



void main() => runApp(MoneyManagerApp());

class MoneyManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PocketFlow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Color(0xFFF6F7FB),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      home: HomeScreenMoneyMGM(),
    );
  }
}

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final String category; // 'Income' or category name

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });
}

class HomeScreenMoneyMGM extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenMoneyMGM> {
  final List<Transaction> _transactions = List.generate(
    6,
        (i) => Transaction(
      id: 't\$i',
      title: i.isEven ? 'Salary' : 'Coffee',
      amount: i.isEven ? 1500 + i * 50.0 : 3.5 + i,
      date: DateTime.now().subtract(Duration(days: i * 2)),
      category: i.isEven ? 'Income' : 'Food',
    ),
  );

  String _filter = 'All';

  double get _balance {
    double income = 0;
    double expense = 0;
    for (var t in _transactions) {
      if (t.category == 'Income') income += t.amount;
      else expense += t.amount;
    }
    return income - expense;
  }

  void _addTransaction(Transaction tx) {
    setState(() {
      _transactions.insert(0, tx);
    });
  }

  void _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((t) => t.id == id);
    });
  }

  List<Transaction> get _filteredTransactions {
    if (_filter == 'All') return _transactions;
    if (_filter == 'Income') return _transactions.where((t) => t.category == 'Income').toList();
    return _transactions.where((t) => t.category == _filter).toList();
  }

  void _openAddModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: AddTransactionForm(onAdd: _addTransaction),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PocketFlow'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.pie_chart_outline),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => AnalyticsScreen(transactions: _transactions))),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBalanceCard(),
            SizedBox(height: 16),
            _buildFilterChips(),
            SizedBox(height: 12),
            Expanded(child: _buildTransactionList()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAddModal,
        icon: Icon(Icons.add),
        label: Text('Add'),
      ),
    );
  }

  Widget _buildBalanceCard() {
    final money = _balance;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 6))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Balance', style: TextStyle(color: Colors.white70)),
              Icon(Icons.account_balance_wallet, color: Colors.white70),
            ],
          ),
          SizedBox(height: 8),
          Text(
            '\$${money.toStringAsFixed(2)}',
            style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              _summaryTile('Income', _transactions.where((t) => t.category == 'Income').fold(0.0, (p, t) => p + t.amount)),
              SizedBox(width: 12),
              _summaryTile('Expense', _transactions.where((t) => t.category != 'Income').fold(0.0, (p, t) => p + t.amount)),
            ],
          )
        ],
      ),
    );
  }

  Widget _summaryTile(String label, double value) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(color: Colors.white70, fontSize: 12)),
            SizedBox(height: 4),
            Text('\$${value.toStringAsFixed(2)}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    final categories = <String>{'All', 'Income'}..addAll(_transactions.map((t) => t.category));
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((c) {
          final selected = c == _filter;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text(c),
              selected: selected,
              onSelected: (_) => setState(() => _filter = c),
              selectedColor: Colors.indigo.shade100,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTransactionList() {
    final list = _filteredTransactions;
    if (list.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.wallet_outlined, size: 60, color: Colors.indigo.shade100),
            SizedBox(height: 12),
            Text('No transactions', style: TextStyle(color: Colors.black45)),
          ],
        ),
      );
    }

    return ListView.separated(
      itemCount: list.length,
      separatorBuilder: (_, __) => SizedBox(height: 8),
      itemBuilder: (context, index) {
        final tx = list[index];
        return Dismissible(
          key: ValueKey(tx.id),
          direction: DismissDirection.endToStart,
          onDismissed: (_) => _removeTransaction(tx.id),
          background: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(12)),
            child: Icon(Icons.delete, color: Colors.white),
          ),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                radius: 26,
                backgroundColor: tx.category == 'Income' ? Colors.green.shade100 : Colors.orange.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: FittedBox(child: Text('\$${tx.amount.toStringAsFixed(0)}')),
                ),
              ),
              title: Text(tx.title),
              subtitle: Text('${tx.category} • ${_formatDate(tx.date)}'),
              trailing: Text(tx.category == 'Income' ? '+\$${tx.amount.toStringAsFixed(2)}' : '-\$${tx.amount.toStringAsFixed(2)}', style: TextStyle(color: tx.category == 'Income' ? Colors.green : Colors.redAccent, fontWeight: FontWeight.bold)),
            ),
          ),
        );
      },
    );
  }

  String _formatDate(DateTime d) {
    return '${d.year}-${_two(d.month)}-${_two(d.day)}';
  }

  String _two(int n) => n.toString().padLeft(2, '0');
}

class AddTransactionForm extends StatefulWidget {
  final Function(Transaction) onAdd;
  AddTransactionForm({required this.onAdd});

  @override
  _AddTransactionFormState createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();
  String _category = 'Food';
  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _titleCtrl.dispose();
    _amountCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() != true) return;
    final title = _titleCtrl.text.trim();
    final amount = double.tryParse(_amountCtrl.text) ?? 0;
    final tx = Transaction(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      amount: amount,
      date: _selectedDate,
      category: _category,
    );
    widget.onAdd(tx);
    Navigator.of(context).pop();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(Duration(days: 365 * 2)),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 50, height: 6, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(4))),
            ],
          ),
          SizedBox(height: 12),
          Text('Add transaction', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleCtrl,
                  decoration: InputDecoration(labelText: 'Title'),
                  validator: (v) => v == null || v.trim().isEmpty ? 'Enter a title' : null,
                ),
                TextFormField(
                  controller: _amountCtrl,
                  decoration: InputDecoration(labelText: 'Amount', prefixText: '\$'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (v) => (v == null || double.tryParse(v) == null) ? 'Enter a valid amount' : null,
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _category,
                        items: ['Food', 'Transport', 'Shopping', 'Income', 'Other'].map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                        onChanged: (v) => setState(() => _category = v ?? 'Food'),
                        decoration: InputDecoration(labelText: 'Category'),
                      ),
                    ),
                    SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: _pickDate,
                      icon: Icon(Icons.calendar_today_outlined),
                      label: Text('${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}'),
                      style: ElevatedButton.styleFrom(elevation: 0),
                    )
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: OutlinedButton(onPressed: () => Navigator.of(context).pop(), child: Text('Cancel'))),
                    SizedBox(width: 12),
                    Expanded(child: ElevatedButton(onPressed: _submit, child: Text('Add'))),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AnalyticsScreen extends StatelessWidget {
  final List<Transaction> transactions;
  AnalyticsScreen({required this.transactions});

  @override
  Widget build(BuildContext context) {
    final grouped = _groupLast7Days(transactions);
    return Scaffold(
      appBar: AppBar(title: Text('Analytics')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Spending last 7 days', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            SizedBox(height: 12),
            Expanded(child: SimpleBarChart(data: grouped)),
          ],
        ),
      ),
    );
  }

  Map<String, double> _groupLast7Days(List<Transaction> txs) {
    final now = DateTime.now();
    Map<String, double> map = {};
    for (int i = 6; i >= 0; i--) {
      final day = now.subtract(Duration(days: i));
      final key = '${day.month}/${day.day}';
      map[key] = 0;
    }
    for (var t in txs) {
      final key = '${t.date.month}/${t.date.day}';
      if (map.containsKey(key) && t.category != 'Income') map[key] = map[key]! + t.amount;
    }
    return map;
  }
}

class SimpleBarChart extends StatelessWidget {
  final Map<String, double> data;
  SimpleBarChart({required this.data});

  @override
  Widget build(BuildContext context) {
    final maxVal = data.values.isEmpty ? 0.0 : data.values.reduce(max);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: data.entries.map((e) {
            final ratio = maxVal == 0 ? 0.0 : (e.value / maxVal);
            return Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('\$${e.value.toStringAsFixed(0)}', style: TextStyle(fontSize: 12)),
                  SizedBox(height: 6),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: FractionallySizedBox(
                        heightFactor: max(0.03, ratio),
                        child: Container(decoration: BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.circular(6))),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(e.key, style: TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
