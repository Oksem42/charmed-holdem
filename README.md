# Charmed Hold'em

Play Texas Hold'em, collect lucky charms, and build a combo that breaks the casino.

**Play it:** https://oksem42.github.io/charmed-holdem/

## Game modes
- **4-player table** (main mode): you and three rivals at each of the 8 tables.
- **Heads-up duel**: one rival per table.

Both modes share the charms, shop, hand levels and all in. Rivals are seated by difficulty each run, with The House at the final table.

## Rivals
Twenty-nine rivals, each with a playstyle and a backstory (hover a rival in game to read it). Each run seats them by difficulty: Easy, Tricky and Tough rivals, two Elites, and The House at the final table.

**The final table** is always a 1v1 against The House, which calls every bet, raise and all in. It opens with its own lead-up animation.

**Elites** are mini-bosses with special powers. Only one Elite ever sits at a table:
- **Augustus Primack** (Old Money): antes are doubled to 20 at his table.
- **Leo Badechluer** (Charm Thief): steals one of your charms every hand at his table.
- **Christofor Ford** (River Read): knows your hand on the river and only calls or bets there when he's ahead.
- **Dubious Dustin** (Snap Call): always calls your all ins, whatever he's holding.
- **Liam Ford** (Protection Racket): the mafia boss cancels your strongest score multiplier on every hand at his table.
- **Elias Primack** (Family Rules): Augustus's son. When you fold, 40% of the time he won't let you leave, and the hand plays out to showdown.

New rivals include Ben Anderson (every decision is a coin flip), Granny Gwen (never bets), Jackson (bets every flop, gives up on the turn), Sir Pockets (only plays pairs and high cards), Dealer Dan (scared of flush and straight boards) Mirage (reverse tells), Iron Ida (calls any all in with a pair or an ace) and Curious Carla (the bigger your all in, the more likely she calls).

## Casino and cosmetics
- Earn tokens: +25 for each table you clear, plus tokens for the chips left at the end of a run (and +150 for beating the casino).
- Open cases (Felt Case, Showtime Case, High Roller Vault) on a spinning reel. Open 1, 3, 5 or 10 at once: several reels spin together, then a summary shows everything you won. Prizes are cosmetic only: card backs, table themes and win animations, in Common, Rare, Epic and Legendary rarities. Duplicates go to your inventory, where you can see how many copies you have and sell the extras for tokens.
- Equip your unlocks in the Collection. Three table themes are free.
- Pocket pairs get their own animation; pocket aces get the golden Pocket Rockets version.
- The leaderboard keeps your 10 best runs per mode. Tokens, unlocks and the leaderboard are saved on your device.
- Optional online leaderboard: run `supabase-setup.sql` in a Supabase project, then put the Project URL and publishable key in the `ONLINE` setting in `index.html`.

## How to play
- Each hand costs a 10-chip ante. Bet, check or fold on each street, just like Hold'em.
- Each table gives you 6 hands to win the chip target. Miss it and the run ends.
- Between tables, buy, sell and reorder charms, reroll the shop, and level up hands.
- Beat all 8 tables to win.
- All in (`A`, press twice) pushes every chip. Most rivals only call with strong hands, but some always call, and losing one ends your run. Multiplier charms don't multiply an all-in pot, only your bonuses.
- A big stack raises the table target to half your chips minus 60, if that beats the base target.
- Choose your bet size with the slider or the Min, ½ pot, ¾ pot and Pot picks, and raise when a rival bets into you. Bigger bets make rivals fold more, but they catch on if you keep overbetting.
- Keys: `B` bet, `C` check or call, `R` raise, arrow keys bet size, `F` fold, `A` all in, `Enter` continue.

## Charm types
- **Payout**: flat bonus chips (Pair Pal, Underdog, Pocket Rockets...)
- **Multiplier**: multiplies the whole payout (Flush Fund, High Roller...)
- **Play style**: changes how you play (Bluff Master, Peek)
- **Grows**: gets stronger over a run (Hot Streak)
- **Combo**: works with other charms (Echo, which makes the charm to its left trigger twice; Charm Bracelet)
- **Cursed**: huge upside with a real cost (Glass Charm shatters when you lose a hand and takes a third of your chips; Devil's Deal costs 15% of your chips per lost hand)

The whole game is a single `index.html` with no build step.
