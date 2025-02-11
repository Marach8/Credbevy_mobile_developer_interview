import 'package:credbevy_task/src/global_export.dart';

class TxnHistoryWidget extends StatelessWidget {
  const TxnHistoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (_, listIndex){
        return CredBevyContainer(
          color: CredBevyColors.white, radius: 24,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
          boxShadow: [
            BoxShadow(
              spreadRadius: 0, blurRadius: 60,
              offset: Offset(0, 30),
              color: CredBevyColors.hex8A959E.withValues(alpha: 0.5)
            )
          ],
          child: Row(
            children: [
              CredBevyContainer(
                height: 38, width: 38,
                color: Colors.green,
                boxShape: BoxShape.circle,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Uber Ride',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: CredBevyColors.hex454545
                      )
                    ),
                    Text(
                      'Jan 10-2387',
                      style: Theme.of(context).textTheme.labelLarge
                    ),
                  ],
                ),
              ),
    
              Text(
                '-\$45.54',
                style: Theme.of(context).textTheme.headlineSmall
              ),
    
            ],
          ),
        );
      }
    );
  }
}

