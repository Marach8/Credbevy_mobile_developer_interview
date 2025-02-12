import 'package:credbevy_task/src/global_export.dart';

class CredBevSuccessScreen extends StatelessWidget {
  const CredBevSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as List<String>?;
    return CredBevyAnnotatedRegion(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const CredBevImgLoader(
                  imagePath: CredBevyImgStrings.SUCCESS,
                  height: 107.84, width: 107.84,
                ),
                const SizedBox(height: 40),
                Text(
                  '\$${arguments?.first.formatPrice()}',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 20),
                CredBevyMultipleTextsRichText(
                  textAlign: TextAlign.center,
                  items: {
                    CredBevyStrings.TRF_SUCCESSFULLY_SENT_2: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: CredBevyColors.hex212B36,
                      fontSize: CredBevyFontSizes.size16
                    ),
                    (arguments?[1] ?? ''): Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: CredBevyColors.hex212B36
                    )
                  },
                ),
                Text(
                  'Ref: ${arguments?.last ?? ''}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),

        bottomSheet: CredBevyContainer(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: CredBevyHelperFuncs.getScreenWidth(context),
          child: CredBevyElevetedBtn(
            onPressed: () => Navigator.pop(context),
            btnTitle: CredBevyStrings.BACK,
          ),
        ),
      ),
    );
  }
}