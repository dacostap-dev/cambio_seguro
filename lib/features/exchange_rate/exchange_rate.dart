import 'package:cambio_seguro_demo/core/constants/constant_color.dart';
import 'package:cambio_seguro_demo/features/widgets/input_widget.dart';
import 'package:flutter/material.dart';

class ExchangeRatePage extends StatefulWidget {
  const ExchangeRatePage({super.key});

  @override
  State<ExchangeRatePage> createState() => _ExchangeRatePageState();
}

class _ExchangeRatePageState extends State<ExchangeRatePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const String purchase_price = '3.9240';
  static const String sale_price = '3.9450';

  final _firstTextController = TextEditingController(text: '0.00');
  final _secondTextController = TextEditingController(text: '0.00');

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();

    _tabController.addListener(reload);
  }

  void reload() {
    setState(() {
      final isSale = _tabController.index == 1;

      if (isSale) {
        final amountSoles = double.parse(_firstTextController.text);
        _secondTextController.text =
            (amountSoles / double.parse(sale_price)).toStringAsFixed(2);
      } else {
        final amountDolares = double.parse(_firstTextController.text);
        _secondTextController.text =
            (amountDolares * double.parse(purchase_price)).toStringAsFixed(2);
      }

      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(reload);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(50),
              height: 250,
              color: ConstantColor.kPrimary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'El mejor \n tipo de cambio',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      'para cambiar dolares y soles online en Perú',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('Dolar compra'),
                        Text(
                          purchase_price,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
                Tab(
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('Dolar venta'),
                        Text(
                          sale_price,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3.5,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 30,
                            ),
                            child: Column(
                              children: [
                                InputWidget(
                                  controller: _firstTextController,
                                  currency: Currency.USD,
                                  label: 'Envías',
                                  onChanged: (value) {
                                    setState(() {
                                      if (value.isNotEmpty) {
                                        final amount = double.parse(value);
                                        _secondTextController.text = (amount *
                                                double.parse(purchase_price))
                                            .toStringAsFixed(2);
                                        // .replaceAll('.', ',');
                                      } else {
                                        _secondTextController.text = '';
                                      }
                                    });
                                  },
                                ),
                                const SizedBox(height: 12),
                                InputWidget(
                                  controller: _secondTextController,
                                  currency: Currency.PEN,
                                  label: 'Recibes',
                                  onChanged: (value) {
                                    setState(() {
                                      if (value.isNotEmpty) {
                                        final amount = double.parse(value);
                                        _firstTextController.text =
                                            (amount / double.parse(sale_price))
                                                .toStringAsFixed(2);
                                        // .replaceAll('.', ',');
                                      } else {
                                        _firstTextController.text = '';
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Positioned.fill(
                            child: FractionallySizedBox(
                              widthFactor: 0.5,
                              heightFactor: 0.5,
                              child: IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                iconSize: 60,
                                onPressed: () {
                                  _tabController.animateTo(1);
                                },
                                icon: const Icon(
                                  Icons.change_circle_rounded,
                                  color: ConstantColor.kPrimary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 30,
                            ),
                            child: Column(
                              children: [
                                InputWidget(
                                  controller: _firstTextController,
                                  currency: Currency.PEN,
                                  label: 'Envías',
                                  onChanged: (value) {
                                    setState(() {
                                      if (value.isNotEmpty) {
                                        final amount = double.parse(value);
                                        _secondTextController.text =
                                            (amount / double.parse(sale_price))
                                                .toStringAsFixed(2);
                                      } else {
                                        _firstTextController.text = '';
                                      }
                                    });
                                  },
                                ),
                                const SizedBox(height: 12),
                                InputWidget(
                                  controller: _secondTextController,
                                  currency: Currency.USD,
                                  label: 'Recibes',
                                  onChanged: (value) {
                                    setState(() {
                                      if (value.isNotEmpty) {
                                        final amount = double.parse(value);
                                        _firstTextController.text = (amount *
                                                double.parse(purchase_price))
                                            .toStringAsFixed(2);
                                      } else {
                                        _firstTextController.text = '';
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Positioned.fill(
                            child: FractionallySizedBox(
                              widthFactor: 0.3, // Ajusta según sea necesario
                              heightFactor: 0.4, // Ajusta según sea necesario
                              child: IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                iconSize: 60,
                                onPressed: () {
                                  _tabController.animateTo(0);
                                },
                                icon: const Icon(
                                  Icons.change_circle_rounded,
                                  color: ConstantColor.kPrimary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: ConstantColor.kPrimary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size.fromHeight(50)),
                child: const Text(
                  'Iniciar operación',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
