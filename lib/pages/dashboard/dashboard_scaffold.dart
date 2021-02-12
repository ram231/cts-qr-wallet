import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';
import 'tracker/cubit/covid_tracker_cubit.dart';

class _CtsTrackerProvider extends StatelessWidget {
  final Widget child;
  const _CtsTrackerProvider({
    @required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CovidTrackerCubit()..fetch(),
      child: WillPopScope(
        onWillPop: () async {
          await SystemNavigator.pop();
          return false;
        },
        child: child,
      ),
    );
  }
}

class CtsDashboardScaffold extends StatelessWidget {
  const CtsDashboardScaffold();
  @override
  Widget build(BuildContext context) {
    return _CtsTrackerProvider(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          elevation: 0,
          title: Text('Welcome!'),
          centerTitle: true,
          actions: [_CtsNotificationIcon()],
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            CtsDashboardHeader(),
            _AddQrWidget(),
            Expanded(
              flex: 10,
              child: CtsRegionList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _CtsNotificationIcon extends StatelessWidget {
  const _CtsNotificationIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.notifications_active),
      onPressed: () {},
    );
  }
}

class CtsRegionList extends StatelessWidget {
  const CtsRegionList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
      ),
      physics: BouncingScrollPhysics(),
      children: [
        CtsRegionCard(
          image: 'assets/cts_qr_assets/ccts.png',
          title: Text(
            'CCTS',
            style: textTheme.headline6.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          color: Colors.blue[400],
          subtitle: Text(
            'South Cotabato',
            style: textTheme.caption.copyWith(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        CtsRegionCard(
          color: Colors.green[700],
          image: 'assets/cts_qr_assets/safedavao.png',
          title: Text(
            'SAFE DAVAO QR',
            style: textTheme.headline6.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            'Davao',
            style: textTheme.caption.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        CtsRegionCard(
          color: Colors.white,
          image: 'assets/cts_qr_assets/cdo_higala.png',
          title: Text(
            'HIGALA',
            style: textTheme.headline6.copyWith(
              color: Colors.black87,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            'Cagayan De Oro',
            style: textTheme.caption.copyWith(
              color: Colors.black54,
            ),
          ),
        ),
        CtsRegionCard(
          color: Colors.blue[700],
          image: 'assets/cts_qr_assets/surigao_eHealth.png',
          title: Text(
            'e-HEALTH',
            style: textTheme.headline6.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            'Surigao',
            style: textTheme.caption.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        CtsRegionCard(
          color: Colors.yellow[100],
          image: 'assets/cts_qr_assets/gensan_tapat.png',
          title: Text(
            'TAPAT',
            style: textTheme.headline6.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
          subtitle: Text(
            'General Santos',
            style: textTheme.caption.copyWith(
              color: Colors.black,
            ),
          ),
        ),
        CtsRegionCard(
          color: Colors.black54,
          title: Text(
            'That\'s all!',
            style: textTheme.headline6.copyWith(
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            'We\'ll integrate more location soon!',
            style: textTheme.caption.copyWith(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

class CtsRegionCard extends StatelessWidget {
  const CtsRegionCard({
    Key key,
    this.image,
    @required this.color,
    @required this.title,
    this.subtitle,
  }) : super(key: key);
  final String image;
  final Color color;
  final Text title;
  final Text subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 128,
      decoration: BoxDecoration(
        color: color?.withOpacity(0.5) ?? Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            spreadRadius: 0.2,
            blurRadius: 10,
            offset: Offset(0, 0),
            color: Colors.black26,
          ),
        ],
        image: image != null
            ? DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  color.withOpacity(0.6),
                  BlendMode.srcOver,
                ),
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title,
          subtitle ?? SizedBox(),
        ],
      ),
    );
  }
}

class _AddQrWidget extends StatelessWidget {
  const _AddQrWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.pushNamed<String>(
          context,
          routeScan,
        );
        if (result == null) {
          return;
        }
        final _ = await Navigator.pushNamed<bool>(
          context,
          routeRegister,
          arguments: result,
        );
        return;
        //TODO: navigate to new page;
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 0.5,
              color: Colors.black12,
              offset: Offset(0, 0.1),
            ),
          ],
        ),
        width: size.width,
        height: 48,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.qr_code),
            SizedBox(
              width: 8,
            ),
            Text('Add QR Code'),
          ],
        ),
      ),
    );
  }
}

class _CovidTrackerBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, CovidTrackerLoaded state) builder;
  const _CovidTrackerBuilder({
    Key key,
    this.builder,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<CovidTrackerCubit, CovidTrackerState>(
      builder: (context, state) {
        if (state is CovidTrackerLoaded) {
          return builder(context, state);
        }
        if (state is CovidTrackerError) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.indigoAccent,
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Unable to load cases',
                  style: textTheme.subtitle2.copyWith(
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    context.read<CovidTrackerCubit>().fetch();
                  },
                ),
              ],
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}

class CtsDashboardHeader extends StatelessWidget {
  const CtsDashboardHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return _CovidTrackerBuilder(
      builder: (context, state) => Container(
        color: Colors.indigoAccent,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _CtsCurrentLocation(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  CtsCaseStatus(
                    titleCase: 'Confirmed',
                    caseType: CaseType.safe,
                    totalCases: '${state.cases.confirmedCases}',
                  ),
                  CtsCaseStatus(
                    titleCase: 'Admitted',
                    caseType: CaseType.alert,
                    totalCases: '${state.cases.confirmedAdmitted}',
                  ),
                  CtsCaseStatus(
                    titleCase: 'Death',
                    caseType: CaseType.severe,
                    totalCases: '${state.cases.confirmedDeath}',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CtsCurrentLocation extends StatelessWidget {
  const _CtsCurrentLocation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      'South Cotabato cases',
      maxLines: 2,
      textAlign: TextAlign.center,
      style: textTheme.headline6.copyWith(color: Colors.white),
    );
  }
}

enum CaseType {
  severe,
  safe,
  alert,
}

class CtsCaseStatus extends StatelessWidget {
  final String titleCase;
  final String totalCases;
  final CaseType caseType;
  const CtsCaseStatus({
    Key key,
    this.titleCase = 'New Case',
    this.totalCases = 'N/A',
    this.caseType = CaseType.safe,
  }) : super(key: key);

  Color colorCaseType(CaseType _case) {
    switch (_case) {
      case CaseType.safe:
        return Colors.green[400];
        break;
      case CaseType.alert:
        return Colors.deepPurple;
        break;
      case CaseType.severe:
        return Colors.red[400];
      default:
        return Colors.green[200];
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 96,
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: colorCaseType(caseType),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Text(
            titleCase,
            style: textTheme.caption.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            totalCases,
            style: textTheme.subtitle1.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
