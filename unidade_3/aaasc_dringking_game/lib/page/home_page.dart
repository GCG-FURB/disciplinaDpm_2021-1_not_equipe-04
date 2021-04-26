import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import "dart:math";
import 'package:aaasc_drinking_game/data/drinking_cards.dart';
import 'package:aaasc_drinking_game/model/drinking_card.dart';
import 'package:aaasc_drinking_game/provider/feedback_position_provider.dart';
import 'package:aaasc_drinking_game/widget/drinking_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<DrinkingCard> drinkingCards =
      new List<DrinkingCard>.from(dummyDrinkingCards);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(),
        backgroundColor: Color(0xff225B1C),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              drinkingCards.isEmpty
                  ? Text('Falha ao carregar mais drinkingCards')
                  : Stack(
                      children: drinkingCards.map(buildDrinkingCard).toList()),
              Expanded(child: Container()),
            ],
          ),
        ),
      );

  Widget buildAppBar() => AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              fit: BoxFit.contain,
              height: 64,
            ),
          ],
        ),
        //FaIcon(FontAwesomeIcons.paw, color: Colors.greenAccent),
      );

  Widget buildDrinkingCard(DrinkingCard drinkingCard) {
    final drinkingCardIndex = drinkingCards.indexOf(drinkingCard);
    final isDrinkingCardInFocus = drinkingCardIndex == drinkingCards.length - 1;

    return Listener(
      onPointerMove: (pointerEvent) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.updatePosition(pointerEvent.localDelta.dx);
      },
      onPointerCancel: (_) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.resetPosition();
      },
      onPointerUp: (_) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.resetPosition();
      },
      child: Draggable(
        child: DrinkingCardWidget(
            drinkingCard: drinkingCard,
            isDrinkingCardInFocus: isDrinkingCardInFocus),
        feedback: Material(
          type: MaterialType.transparency,
          child: DrinkingCardWidget(
              drinkingCard: drinkingCard,
              isDrinkingCardInFocus: isDrinkingCardInFocus),
        ),
        childWhenDragging: Container(),
        onDragEnd: (details) => onDragEnd(details, drinkingCard),
      ),
    );
  }

  void onDragEnd(DraggableDetails details, DrinkingCard drinkingCard) {
    final minimumDrag = 100;
    if (details.offset.dx > minimumDrag || details.offset.dx < -minimumDrag) {
      final random = new Random();
      var newDrinkingCard = drinkingCard;
      while (newDrinkingCard == drinkingCard) {
        newDrinkingCard =
            dummyDrinkingCards[random.nextInt(dummyDrinkingCards.length)];
      }
      setState(() => drinkingCards.removeLast());
      setState(() => drinkingCards.insert(0, newDrinkingCard));
    }
  }
}
