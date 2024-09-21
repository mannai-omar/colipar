import 'package:colipar/styles/colors.dart';
import 'package:colipar/styles/text_styles.dart';
import 'package:colipar/widgets/custom_button.dart';
import 'package:colipar/widgets/nav_bar.dart';
import 'package:colipar/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.backgroundBlue,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.20,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Simplifiez vos envois', style: AppTextStyles.h1),
                    SizedBox(height: 10),
                    Text(
                      'La solution conviviale pour partager et livrer\nvos colis localement',
                      style: AppTextStyles.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const TabBar(
                tabs: [
                  Tab(text: 'Se connecter'),
                  Tab(text: 'S\'inscrire'),
                ],
                labelColor: AppColors.blue,
                unselectedLabelColor: AppColors.black,
                indicatorColor: AppColors.blue,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Login Tab Content
                    loginTabContent(context),
                    // Register Tab Content
                    registerTabContent(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget registerTabContent(context) {
    return Container(
      color: AppColors.backgroundWhite,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  CustomTextField(
                      hintText: 'Nom et prenom', icon: Icons.person_outline),
                  SizedBox(height: 30),
                  CustomTextField(
                      hintText: 'Email', icon: Icons.email_outlined),
                  SizedBox(height: 30),
                  CustomTextField(
                    hintText: 'Mot de passe',
                    icon: Icons.lock_outline,
                    obscureText: true,
                  ),
                  SizedBox(height: 30),
                  CustomTextField(
                      hintText: 'Confirmer mot de passe',
                      icon: Icons.lock_outline,
                      obscureText: true),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(text: 'S\'inscrire',onTap: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNav()),
                    );
                  },),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loginTabContent(context) {
    return Container(
      color: AppColors.backgroundWhite,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffe4e4e4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/google.svg',
                      height: 26,
                      width: 26, // Correct width here
                    ),
                    const SizedBox(
                        width: 10), // Add spacing between icon and text
                    const Text('Continuer avec Google'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: AppColors.gray,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Ou continuer avec email',
                    style: TextStyle(fontSize: 14, color: AppColors.gray),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: AppColors.gray,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  CustomTextField(
                      hintText: 'Email', icon: Icons.email_outlined),
                  SizedBox(height: 30),
                  CustomTextField(
                      hintText: 'Mot de passe', icon: Icons.lock_outline),
                ],
              ),
            ),
            const Spacer(), // Pushes the button to the bottom
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: CustomButton(
                  text: 'Se connecter',
                  onTap: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNav()),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
