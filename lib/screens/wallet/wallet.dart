

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/wallet/wallet_components.dart';
import 'package:truckoom_shipper/screens/wallet/wallet_provider.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';



class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  WalletComponents _walletComponents;
  WalletProvider _walletProvider;
  @override
  void initState() {
    super.initState();
    _walletComponents = WalletComponents();
    _walletProvider = Provider.of<WalletProvider>(context, listen: false);
    _walletProvider.init(context: context);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<WalletProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: AppSizes.height,
          width: AppSizes.width,
          child: Column(
            children: [
              CommonWidgets.tabsAppBar2(
                  text: 'Wallet',
                  onPress: (){
                    Navigator.pop(context);
                  }
              ),
              Expanded(
                child: _walletProvider.isDataFetched?
                ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSizes.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _walletComponents.getWalletPriceBox(walletPrice: _walletProvider.getWallet().result.pendingAmount.toString()),
                          SizedBox(height: AppSizes.height*0.01),
                          _walletComponents.getDetailWalletBox(
                              alreadyPaid: _walletProvider.getWallet().result.paidAmount.toString(),
                              pending: _walletProvider.getWallet().result.pendingAmount.toString(),
                          ),
                          _walletComponents.getWalletTable(walletPrice: "200"),

                          _walletProvider.getWallet().result.transactions.length > 0?
                          Wrap(
                            children: [
                              ...List.generate(
                                  _walletProvider.getWallet().result.transactions.length,
                                      (index) => _walletComponents.getWalletTableData(
                                        id: _walletProvider.getWallet().result.transactions[index].loadId.toString(),
                                        name: _walletProvider.getWallet().result.transactions[index].paymentMode.toString(),
                                        amount: _walletProvider.getWallet().result.transactions[index].payment.toString(),
                                        date: _walletProvider.getWallet().result.transactions[index].transactionDate.toString(),
                                      )
                              )
                            ],
                          )
                              :CommonWidgets.onNullData(text: "No Transactions"),

                        ],
                      ),
                    ),
                  ],
                ):
                Center(
                  child: Container(
                    height: AppSizes.height * 0.15,
                    // width: AppSizes.width,
                    child: Lottie.asset(Assets.apiLoading, fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
