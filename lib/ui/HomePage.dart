import 'package:exchange/redux/models/rate.dart';
import 'package:exchange/utils/ad_manager.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:exchange/redux/actions/exchange.dart';
import 'package:exchange/redux/models/app_state.dart';
import 'package:exchange/utils/ui_constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  InterstitialAd _interstitialAd;

  bool _isInterstitialAdReady;

  
  void _loadInterstitialAd() {
    print('8');
    _interstitialAd.load();
    _interstitialAd.show();
  }

  void _onInterstitialAdEvent(MobileAdEvent event) {
    switch (event) {
      case MobileAdEvent.loaded:
        print('1');
        _isInterstitialAdReady = true;
        break;
      case MobileAdEvent.failedToLoad:
        print('2');
        _isInterstitialAdReady = false;
        print('Failed to load an interstitial ad');
        break;
      case MobileAdEvent.closed:
        // _moveToHome();
        break;
      default:
      // do nothing
    }
  }

  @override
  void initState() {
    print('0');
    FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  
    _isInterstitialAdReady = false;
  
    _interstitialAd = InterstitialAd(
      adUnitId: AdManager.interstitialAdUnitId,
      listener: _onInterstitialAdEvent,
    );

    super.initState();
  }



  TextEditingController amount = TextEditingController(text: '1');
  double amountT = 1;
  

  @override
  Widget build(BuildContext context) {

    return StoreConnector<AppState, Map<String, dynamic>>(
      converter: (store)
      {
        final Map<String, dynamic> args = {
          "isLoading" : store.state.isLoading,
          "currentRate" : store.state.currentRate,
          "routes" : store.state.routes,
          "changebase": (String base){
            return store.dispatch(ChangeBasesAction(base));
          }
        };
        return args;
      },
      builder: (context, args){
        final Rate currentRate = args["currentRate"];
        final bool isLoading = args["isLoading"];
        final Function changebase = args["changebase"];
        
        return Scaffold(
          body: isLoading ? Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo.png',width: 100,),
                    SizedBox(height: 30,),
                    Text('CURRENCY CONVERTER', style: TextStyle(color: Colors.white, fontSize: 20),),
                    Center(),
                    SizedBox(height: 100,),
                    CircularProgressIndicator(),
                  ],
                )
              ),
            ],
          ) : Column(
            children: [
              Container(
                // flex: 1,
                child: Container(
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    children: [
                      SizedBox(height: 80),
                      Text(
                        'Welcome to Currency Convertor',
                        style: TextStyle(
                          color: AppColors.secondaryTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: TextFormField(
                                onChanged: (value){
                                  setState(() {
                                    amountT = double.parse(value);
                                  });
                                },
                                controller: amount,
                                style: TextStyle(color: AppColors.secondaryTextColor),
                                decoration: getInputDecoration(lebel: 'Amount'),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            child: Text(currentRate.base,style: TextStyle(color: Colors.white,fontSize: 16),),
                          )
                        ],
                      ),
                     ],
                  )
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: ListView(
                    children: rateBuilder(currentRate.rates, changebase, amountT, _loadInterstitialAd),
                  ),
                ),
              ),
              SizedBox(height:20)
            ]
          )
        );
      
      },
    );
  }
}

rateBuilder(Map<String, dynamic> rates, Function changebase, double amount, Function _loadInterstitialAd){
  // print(amountT); 
  List<Widget> rWid = [];
  rates.forEach((String key,dynamic value) {
    // print(value.runtimeType);
    double _amount = value * amount;
    String _title = key;
    
    switch (key) {
      case 'AUD':_title = key + ' - ' + 'Australian dollar';break;
      case 'BRL':_title = key + ' - ' + 'Brazilian real';break;
      case 'BGN':_title = key + ' - ' + 'Bulgarian lev	';break;
      case 'CAD':_title = key + ' - ' + 'Canadian dollar	';break;
      case 'CNY':_title = key + ' - ' + 'Chinese Yuan Renminbi	';break;
      case 'HRK':_title = key + ' - ' + 'Croatian kuna	';break;
      case 'CZK':_title = key + ' - ' + 'Czech koruna	';break;
      case 'DKK':_title = key + ' - ' + 'Danish krone	';break;
      case 'DKK':_title = key + ' - ' + 'Danish krone	';break;
      case 'HKD':_title = key + ' - ' + 'Hong Kong dollar';break;
      case 'HUF':_title = key + ' - ' + 'Hungarian forint	';break;
      case 'ISK':_title = key + ' - ' + 'Icelandic krona	';break;
      case 'INR':_title = key + ' - ' + 'Indian rupee	';break;
      case 'IDR':_title = key + ' - ' + 'Indonesian rupiah	';break;
      case 'ILS':_title = key + ' - ' + 'Israeli new shekel	';break;
      case 'JPY':_title = key + ' - ' + 'Japanese yen	';break;
      case 'MYR':_title = key + ' - ' + 'Malaysian ringgit	';break;
      case 'MXN':_title = key + ' - ' + 'Mexican peso	';break;
      case 'NZD':_title = key + ' - ' + 'New Zealand dollar	';break;
      case 'NOK':_title = key + ' - ' + 'Norwegian krone	';break;
      case 'PHP':_title = key + ' - ' + 'Philippine peso	';break;
      case 'PLN':_title = key + ' - ' + 'Polish zloty	';break;
      case 'EUR':_title = key + ' - ' + 'European euro	';break;
      case 'RON':_title = key + ' - ' + 'Romanian leu	';break;
      case 'SGD':_title = key + ' - ' + 'Singapore dollar	';break;
      case 'ZAR':_title = key + ' - ' + 'South African rand	';break;
      case 'GBP':_title = key + ' - ' + 'Pound sterling	';break;
      case 'KRW':_title = key + ' - ' + 'South Korean won	';break;
      case 'SEK':_title = key + ' - ' + 'Swedish krona	';break;
      case 'CHF':_title = key + ' - ' + 'Swiss franc	';break;
      case 'THB':_title = key + ' - ' + 'Thai baht';break;
      case 'TRY':_title = key + ' - ' + 'Turkish lira';break;
      case 'USD':_title = key + ' - ' + 'United States dollar';break;
      default:
    }
    


    rWid.add(
      GestureDetector(
        child: Container(
          margin: EdgeInsets.fromLTRB(20,20,20,0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.tertiary,
            border: Border.all(width: 1)
          ),
          child: ListTile(
            onTap: (){
              _loadInterstitialAd();
              changebase(key);
            },
            trailing: Image.asset('assets/'+key+'.png'),
            title: Text(
              _title,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 20
              )
            ),
            subtitle: Text(
              _amount.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 17,
                color: AppColors.primary[500],
              ),
            ),
          ),
        ),
      )
    );
  });
  return rWid;
}