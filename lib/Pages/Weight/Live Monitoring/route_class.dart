import 'package:flutter/material.dart';
import '../../Diet/diet_page.dart';
import '../../Diet/high_calories.dart';
import '../../Diet/low_calories.dart';
import '../../Diet/muscle_gain.dart';
import '../../Diet/normal_diet.dart';
import '../../Diet/weight_loss.dart';
import '../../Drawer/drawer_page.dart';
import '../../Home/home_page.dart';
import '../../Progress/progress_page.dart';
import '../../Running/running_page.dart';
import '../Advance/advance_abs.dart';
import '../Advance/advance_arms.dart';
import '../Advance/advance_back.dart';
import '../Advance/advance_chest.dart';
import '../Advance/advance_exercise.dart';
import '../Advance/advance_leg.dart';
import '../Advance/advance_shoulder.dart';
import '../Beginner/beginner_abs.dart';
import '../Beginner/beginner_arms.dart';
import '../Beginner/beginner_back.dart';
import '../Beginner/beginner_chest.dart';
import '../Beginner/beginner_exercise.dart';
import '../Beginner/beginner_legs.dart';
import '../Beginner/beginner_shoulder.dart';
import '../Intermediate/intermediate_abs.dart';
import '../Intermediate/intermediate_arms.dart';
import '../Intermediate/intermediate_back.dart';
import '../Intermediate/intermediate_chest.dart';
import '../Intermediate/intermediate_exercise.dart';
import '../Intermediate/intermediate_legs.dart';
import '../Intermediate/intermediate_shoulder.dart';
import '../weight_page.dart';
import '../../../SignIn-SignUp/Google SignIn/google_page_controller.dart';
import '../../../SignIn-SignUp/Google SignIn/google_signIn_button.dart';
import '../../../SignIn-SignUp/get_started_page.dart';
import '../../../SignIn-SignUp/signIn_login_page.dart';
import '../../../new.dart';

var routeClass = <String, WidgetBuilder>{
  '/': (context) => const GetStartedPage(),
  '/New': (context) => New(),
  // '/MainScreen': (context) => MainScreen(cameras),
  '/GooglePageController': (context) => const GooglePageController(),
  '/SignInLoginPage': (context) => const SignInLoginPage(),
  '/GoogleSignInButton': (context) => const GoogleSignInButton(),
  '/DrawerPage': (context) => const DrawerPage(),
  '/DietPage': (context) => const DietPage(),
  '/MuscleGainDiet': (context) => const MuscleGainDiet(),
  '/WeightLoss': (context) => const WeightLoss(),
  '/NormalDiet': (context) => const NormalDiet(),
  '/LowCalories': (context) => const LowCalories(),
  '/HighCalories': (context) => const HighCalories(),
  '/HomePage': (context) => const HomePage(),
  '/ProgressPage': (context) => const ProgressPage(),
  '/RunningPage': (context) => const RunningPage(),
  '/WeightPage': (context) => const WeightPage(),
  '/BeginnerExercise': (context) => const BeginnerExercise(),
  '/BeginnerAbs': (context) => const BeginnerAbs(),
  '/BeginnerArms': (context) => const BeginnerArms(),
  '/BeginnerBack': (context) => const BeginnerBack(),
  '/BeginnerChest': (context) => const BeginnerChest(),
  '/BeginnerShoulder': (context) => const BeginnerShoulder(),
  '/BeginnerLegs': (context) => const BeginnerLegs(),
  '/IntermediateExercise': (context) => const IntermediateExercise(),
  '/IntermediateAbs': (context) => const IntermediateAbs(),
  '/IntermediateArms': (context) => const IntermediateArms(),
  '/IntermediateBack': (context) => const IntermediateBack(),
  '/IntermediateChest': (context) => const IntermediateChest(),
  '/IntermediateShoulder': (context) => const IntermediateShoulder(),
  '/IntermediateLegs': (context) => const IntermediateLegs(),
  '/AdvanceExercise': (context) => const AdvanceExercise(),
  '/AdvanceAbs': (context) => const AdvanceAbs(),
  '/AdvanceArms': (context) => const AdvanceArms(),
  '/AdvanceBack': (context) => const AdvanceBack(),
  '/AdvanceChest': (context) => const AdvanceChest(),
  '/AdvanceShoulder': (context) => const AdvanceShoulder(),
  '/AdvanceLegs': (context) => const AdvanceLegs(),
};
