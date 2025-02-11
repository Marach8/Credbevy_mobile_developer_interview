import 'package:credbevy_task/src/global_export.dart';

class CredBevTrnsfrMoneyScreen extends StatefulWidget {
  const CredBevTrnsfrMoneyScreen({super.key});

  @override
  State<CredBevTrnsfrMoneyScreen> createState() => _CredBevTrnsfrMoneyScreenState();
}

class _CredBevTrnsfrMoneyScreenState extends State<CredBevTrnsfrMoneyScreen> {
  late TextEditingController _nameCntrl, _amtCntrl, _refCntrl;

  @override 
  void initState(){
    super.initState();
    _nameCntrl = TextEditingController();
    _amtCntrl = TextEditingController();
    _refCntrl = TextEditingController();
  }

  @override
  void dispose(){
    _nameCntrl.dispose();
    _amtCntrl.dispose();
    _refCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CredBevyAnnotatedRegion(
      child: Scaffold(
        appBar: CredBevyAppBar(
          leadingWidth: 46,
          leading: CredBevyContainer(
            onTap: () => Navigator.pop(context),
            boxShape: BoxShape.circle,
            height: 46, width: 46,
            padding: const EdgeInsets.fromLTRB(10.5, 0, 10.5, 0),
            color: CredBevyColors.hexF0F0F0,
            child: Icon(Icons.home_outlined)
          ),
          actions: [
            CredBevyContainer(
              height: 46, width: 46,
              boxShape: BoxShape.circle,
              color: Colors.black,
            )
          ],
        ),

        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  CredBevyStrings.CURRENT_BALANCE,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  '\$26,456.14',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              const SizedBox(height: 40),
          
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: RowOfFavAndFriendsWidget(),
              ),
          
              const SizedBox(height: 25),
          
              const ListOfNames(),
          
              const SizedBox(height: 20),
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextFieldHeader(title: CredBevyStrings.NAME),
                    const SizedBox(height: 8,),
                    CredBevyTextField(
                      controller: _nameCntrl,
                      hintText: 'Walter White',
                    ),
                    
                    const SizedBox(height: 20,),
                    const TextFieldHeader(title: CredBevyStrings.AMOUNT),
                    const SizedBox(height: 8,),
                    CredBevyTextField(
                      controller: _amtCntrl,
                      hintText: CredBevyStrings.HOW_MUCH_2_SEND
                    ),
                    const SizedBox(height: 7),

                    Row(
                      children: [
                        ContainerWithInteger(number: '+10'),
                        const SizedBox(width: 8),
                        ContainerWithInteger(number: '+100'),
                        const SizedBox(width: 8),
                        ContainerWithInteger(number: '-10'),
                        const SizedBox(width: 8),
                        ContainerWithInteger(number: '-100'),
                        const Spacer()
                      ],
                    ),

                
                    const SizedBox(height: 20),
                    const TextFieldHeader(title: CredBevyStrings.REFERENCE),
                    const SizedBox(height: 8,),
                    CredBevyTextField(
                      controller: _refCntrl,
                      hintText: CredBevyStrings.TRSF_REASON,
                    ),
                    const SizedBox(height: 100)
                  ],
                ),
              ),
            ],
          ),
        ),

        bottomSheet: CredBevyContainer(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: CredBevHelperFuncs.getScreenWidth(context),
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pushNamed(CredBevyRoutes.SUCCESS_SCREEN);
            },
            icon: CredBevyContainer(
              padding: const EdgeInsets.all(1), radius: 3,
              border: Border.all(color: CredBevyColors.hexF0F0F0),
              child: Icon(Iconsax.arrow_swap_horizontal, color: CredBevyColors.hexF0F0F0, size: 15,),
            ),
            label: Text(CredBevyStrings.SEND_MONEY),
          ),
        ),
      ),
    );
  }
}