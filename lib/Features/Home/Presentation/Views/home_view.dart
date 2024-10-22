import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/cardBase.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Core/Dependencies/injector.dart';
import 'package:inventarioapp/Core/Utils/utils.dart';
import 'package:inventarioapp/Features/Home/Application/Repositories/home_irepository.dart';
import 'package:inventarioapp/Features/Home/Application/bloc/home_bloc.dart';
import 'package:inventarioapp/Features/Home/Presentation/Widgets/homeGraficoData.dart';
import 'package:inventarioapp/Features/Home/Presentation/Widgets/homeStockLimit.dart';
import 'package:inventarioapp/Util/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(repository: getIt<HomeIRepository>())
        ..add(
          GetStatisticsHomeEvent(),
        ),
      child: Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is HomeLoadedState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CardBase(
                            cantidad: state.statisticsHomeEntity.entradas,
                            color: Colors.cyan,
                            texto: "Entradas",
                          ),
                          CardBase(
                            cantidad: state.statisticsHomeEntity.salidas,
                            color: Colors.red,
                            texto: "Salidas",
                          ),
                          CardBase(
                            cantidad: state.statisticsHomeEntity.productos,
                            color: Colors.yellow,
                            texto: "Almacen",
                          ),
                          CardBase(
                            cantidad: state.statisticsHomeEntity.usuarios,
                            color: Colors.green,
                            texto: "Usuarios",
                          ),
                        ],
                      ),
                    ),
                    space(h: 30),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          space(w: 20),
                          HomeGraphicData(
                            entradas: state.salesDataEntries,
                            salidas: state.salesDataOutputs,
                          ),
                          HomeStockLimit(
                            productosStockLimit: state.productosStockLimit,
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
