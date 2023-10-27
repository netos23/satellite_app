import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'ordering_page_wm.dart';

// TODO: cover with documentation
/// Main widget for ProfilePage module
@RoutePage()
class OrderingPageWidget extends ElementaryWidget<IOrderingPageWidgetModel> {
  const OrderingPageWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultOrderingPageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IOrderingPageWidgetModel wm) {
    final theme = wm.theme;
    final textTheme = wm.textTheme;
    final colorTheme = wm.colorScheme;

    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Оформление заказа'),
            centerTitle: true,
          ),
          body:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        TextField(
                          textAlign: TextAlign.center,
                          controller: wm.firstNameController,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onBackground,
                            overflow: TextOverflow.ellipsis,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Имя',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          controller: wm.secondNameController,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onBackground,
                            overflow: TextOverflow.ellipsis,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Фамилия',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          controller: wm.emailController,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onBackground,
                            overflow: TextOverflow.ellipsis,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          controller: wm.phoneNumberController,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onBackground,
                            overflow: TextOverflow.ellipsis,
                          ),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Номер телефона',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text('Настройки съемки:'),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: const Row(
                            children: [
                              Text('Дата начала'),
                              Spacer(),
                              Icon(Icons.settings_outlined),
                            ],
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: const Row(
                            children: [
                              Text('Дата окончания:'),
                              Spacer(),
                              Icon(Icons.settings_outlined),
                            ],
                          ),
                        ),
                        const Text('Количество мегапикселей:'),
                      ],
                    ),
                  ),
                ),
                //const Spacer(),
                const SizedBox(
                  height: 16,
                ),
                Text('Выбор cпутников', style: theme.textTheme.bodyLarge,),
                const Center(child: CircularProgressIndicator()),
                const SizedBox(
                  height: 16,
                ),
                Text('Выбор тарифа', style: theme.textTheme.bodyLarge,),
                const SizedBox(
                  height: 4,
                ),
                Text('Выбор тарифа', style: theme.textTheme.bodyLarge,),
                const SizedBox(
                  height: 4,
                ),
                 const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: CircularProgressIndicator()),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SizedBox(
                    height: 50,
                    child: FilledButton(
                      style: theme.filledButtonTheme.style?.copyWith(
                          fixedSize:
                          const MaterialStatePropertyAll(Size.fromHeight(50))),
                      onPressed: wm.profileUseCase.logout,
                      child: const Center(child: Text('Оформить')),
                    ),
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