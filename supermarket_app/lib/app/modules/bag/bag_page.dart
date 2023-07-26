import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supermarket_app/app/constants/app_colors.dart';
import 'package:supermarket_app/app/repositories/user_bag/user_bag_controller.dart';
import 'package:supermarket_app/app/widgets/app_text.dart';
// import 'package:supermarket_app/app/widgets/app_textfield.dart';

class BagPage extends StatefulWidget {
  const BagPage({Key? key}) : super(key: key);

  @override
  _BagPageState createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  final bagController = Modular.get<UserBagController>();

  @override
  void initState() {
    super.initState();
    bagController.retrieveItemsOnUserBag();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.iceWhite,
          appBar: AppBar(
            backgroundColor: const Color(0xFFF7F6F0),
            automaticallyImplyLeading: true,
            leading: GestureDetector(
              onTap: () => Modular.to.pop(),
              child: const Icon(
                Icons.arrow_back_ios_outlined,
                color: AppColors.black,
                size: 24,
              ),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          bottomNavigationBar: Container(
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.brown,
            ),
            child: Text("PORRAAA"),
          ),
          // bottomSheet:
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text(
                      'Carrinho',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 35,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey.withOpacity(.5),
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://picsum.photos/200/300',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            SizedBox(
                              width: deviceWidth * .4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  AppText(
                                    text: 'Name',
                                    fontColor: AppColors.teal,
                                    fontSize: 17,
                                  ),
                                  const SizedBox(height: 5),
                                  AppText(
                                    text:
                                        'Descriptionnnnnnnnnnnnnnnnnnnnnnnnnnnn',
                                    fontColor: AppColors.teal,
                                    textOverflow: TextOverflow.ellipsis,
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SizedBox(
                                width: deviceWidth * .08,
                                child: TextFormField(
                                  initialValue: '0',
                                  textAlign: TextAlign.center,
                                  onChanged: (String value) {},
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete_outline,
                                color: AppColors.teal,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
