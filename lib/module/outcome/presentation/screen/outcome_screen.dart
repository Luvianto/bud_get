import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bud_get/module/outcome/presentation/provider/outcome_notifier_provider.dart';
import 'package:bud_get/module/outcome/presentation/provider/state/outcome_state.dart';
import 'package:bud_get/module/outcome/presentation/widget/outcome_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class OutcomeScreen extends ConsumerStatefulWidget {
  const OutcomeScreen({super.key});

  @override
  ConsumerState<OutcomeScreen> createState() => _OutcomeScreenState();
}

class _OutcomeScreenState extends ConsumerState<OutcomeScreen> {
  final scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  bool isSearchActive = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollControllerListener);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void scrollControllerListener() {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      final notifier = ref.read(outcomeNotifierProvider.notifier);
      if (isSearchActive) {
        // notifier.searchProducts(searchController.text);
      } else {
        // notifier.fetchProducts();
      }
    }
  }

  void refreshScrollControllerListener() {
    scrollController.removeListener(scrollControllerListener);
    scrollController.addListener(scrollControllerListener);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(outcomeNotifierProvider);

    ref.listen(outcomeNotifierProvider.select((value) => value), ((
      OutcomeState? previous,
      OutcomeState next,
    ) {
      if (next.state == OutcomeConcreteState.fetchedAllOutcomes) {
        if (next.message.isNotEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(next.message.toString())));
        }
      }
    }));

    return Scaffold(
      appBar: AppBar(
        title: isSearchActive
            ? TextField(
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  hintText: 'Search here',
                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                controller: searchController,
                onChanged: _onSearchChanged,
              )
            : const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () {
              searchController.clear();
              setState(() {
                isSearchActive = !isSearchActive;
              });

              ref.read(outcomeNotifierProvider.notifier).resetState();
              if (!isSearchActive) {
                ref.read(outcomeNotifierProvider.notifier).fetchOutcomeList();
              }
              refreshScrollControllerListener();
            },
            icon: Icon(isSearchActive ? Icons.clear : Icons.search),
          ),
        ],
      ),
      drawer: const OutcomeDrawer(),
      body: state.state == OutcomeConcreteState.loading
          ? const Center(child: CircularProgressIndicator())
          : state.hasData
          ? Column(
              children: [
                Expanded(
                  child: Scrollbar(
                    controller: scrollController,
                    child: ListView.separated(
                      separatorBuilder: (_, __) => const Divider(),
                      controller: scrollController,
                      itemCount: state.outcomeList.length,
                      itemBuilder: (context, index) {
                        final outcome = state.outcomeList[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(''),
                          ),
                          title: Text(
                            outcome.title,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          trailing: Text(
                            '\$${outcome.amount}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          subtitle: Text(
                            outcome.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (state.state == OutcomeConcreteState.fetchingMore)
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: CircularProgressIndicator(),
                  ),
              ],
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
    );
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      // ref.read(outcomeNotifierProvider.notifier).searchProducts(query);
    });
  }
}
