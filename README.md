This is a Ruby version of a simple card trick. The trick works like this:

First, take 21 cards from a standard deck of cards (no Jokers). Then lay the cards out into three columns of seven cards each, going from left to right, stacking the cards on each other as you would in Solitaire:

    1  2  3
    4  5  6
    7  8  9
    10 11 12
    13 14 15
    16 17 18
    19 20 21

Now, ask someone to pick a card and remember it, without telling you what it is. Ask them which column their card is in. Now, Collect the columns of cards, making sure to put the column that contains your subject's card is between the other two. For example, if the subject picks card number 12, you might collect the middle column, then the right column, then the left column. Be sure to keep the cards in order, so in this example you would now have a stack of cards that contains, in order, the following cards:

    2, 5, 8, 11, 14, 17, 20, 3, 6, 9, 12, 15, 18, 21, 1, 4, 7, 10, 13, 16, 19

Now, lay the 21 cards out again (in the same way as the first time), and again as the subject to identify the column their card is in. Gather up the cards in the same way (keeping their new choice in the middle). Finally, lay out the cards once more, and ask them to pick a column one last time, and gather up the cards in the same manner again.

Once you have gathered up the cards the final time, the card the subject chose will be the eleventh card.

This Ruby program simulates this card trick; you can try it out by cloning the Gist and then running `ruby app.rb` from within the cloned repository. There are also specs (based on Ruby 1.9's minitest) that you can run by running `rake test`.

The `Card` and `Deck` classes simulate basic functionality for a real-world card and deck of cards, respectively. `Trick` defines the rules for the magic trick, while `Magician` contains all the input/output code for interfacing with the user; this makes `Trick` much easier to test.
