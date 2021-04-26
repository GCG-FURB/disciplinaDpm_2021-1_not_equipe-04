import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aaasc_drinking_game/model/drinking_card.dart';
import 'package:aaasc_drinking_game/provider/feedback_position_provider.dart';

class DrinkingCardWidget extends StatelessWidget {
  final DrinkingCard drinkingCard;
  final bool isDrinkingCardInFocus;

  const DrinkingCardWidget({
    @required this.drinkingCard,
    @required this.isDrinkingCardInFocus,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FeedbackPositionProvider>(context);
    final swipingDirection = provider.swipingDirection;
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.7,
      width: size.width * 0.95,
      decoration: BoxDecoration(
        color: Color(0xff3b8b32),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(drinkingCard.imgUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 0.5),
          ],
          gradient: LinearGradient(
            colors: [Colors.black12, Colors.black87],
            begin: Alignment.center,
            stops: [0.4, 1],
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 10,
              left: 10,
              bottom: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildDrinkingCardInfo(drinkingCard: drinkingCard),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16, right: 8),
                  ),
                ],
              ),
            ),
            if (isDrinkingCardInFocus) buildLikeBadge(swipingDirection)
          ],
        ),
      ),
    );
  }

  Widget buildLikeBadge(SwipingDirection swipingDirection) {
    final isSwipingRight = swipingDirection == SwipingDirection.right;
    final color = isSwipingRight ? Colors.green : Colors.pink;
    final angle = isSwipingRight ? -0.5 : 0.5;

    if (swipingDirection == SwipingDirection.none) {
      return Container();
    } else {
      return Positioned(
        top: 20,
        right: isSwipingRight ? null : 20,
        left: isSwipingRight ? 20 : null,
        child: Transform.rotate(
          angle: angle,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: color, width: 2),
            ),
            child: Text(
              isSwipingRight ? 'LIKE' : 'NOPE',
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget buildDrinkingCardInfo({@required DrinkingCard drinkingCard}) =>
      Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${drinkingCard.name}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              '${drinkingCard.category}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
            SizedBox(height: 8),
            Text(
              drinkingCard.description,
              style: TextStyle(color: Colors.white),
              overflow: TextOverflow.clip,
              softWrap: false,
            ),
            SizedBox(height: 4),
          ],
        ),
      );
}
