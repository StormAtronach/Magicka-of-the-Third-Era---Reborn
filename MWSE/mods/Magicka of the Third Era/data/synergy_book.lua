-- synergy_book.lua
-- The book that explains synergies to the player, and where it turns up.
-- The text describes the rules of synergy_table.lua. Change them together.
--   leveled_lists  lists that may hold the book, with the level it appears from
--   owners         NPCs who carry the book, with how many

return {
  id = "a_ve_bk_synergies1",
  name = "A Guide to Magical Synergies",
  mesh = "m\\Text_Octavo_07.NIF",
  icon = "m\\Tx_book_01.tga",
  weight = 3,
  value = 100,
  leveled_lists = { random_book_wizard_all = 1 },
  owners = { ["dorisa darvel"] = 1, jobasha = 1, ["simine fralinie"] = 1 },
  text = [==[
<DIV ALIGN="CENTER"><FONT COLOR="000000" SIZE="3" FACE="Magic Cards"><BR>
A Guide to Synergies - a Spellmaker's Handbook<BR>
<DIV ALIGN="LEFT"><BR><BR>

Synergies are the advanced mage's best friend. By clever use of synergies, mage can optimize their spells, and even create what would otherwise be seen as impossible. By combining effects with certain conditions, one can make a spell that fulfils one or even more synergies. Any spell can have any amount of synergies - although each synergy is only as good as it's components are. Synergies work best when every spell component is relevant to it, and when each component has equal cost.<BR><BR>
Fire Synergies<BR><BR>
The most commonly known trick regarding the element of Fire is how to weave it into a fiery ball. 
First, you'll need it to form a ball of a reasonable radius (5 at least).
Then, you'll need to split the fire into two separate effects: one responsible for the immediate burning (don't make it last any longer than than a second!), and one must last for at least 5 seconds.
Finally, make sure that both of these effects will be ranged ones. It seems silly, but many apprentice mages making their first spells completely forget about it.<BR><BR>
Fire can be very potent at degrading armor. Such trait has been taken full advantage of at the Siege of Orsinium.
To let fire empower the armor-melting effect, you'll need to ensure that both fire and armor disintegration last of a reasonable duration - at least 10 seconds. A prolonged fire will reinforce the melting.<BR><BR>
Just as Fire can melt it's victims, it can also protect the caster. Having a long duration Fire effect (at least 10 seconds) will augment the Resist Frost effect that's cast on yourself.<BR><BR>
Weaving the three destructive elements together is no easy feat, but under certain magnitude they form what advanced mages call a "Chromatic blast", an empowered ball of mixed energy. 
To weave effects into such synergy, you'll need to combine Fire, Frost, and Shock, ensure that each of the effects has strong enough magnitude - 20 is the least you can work with - and make sure the spell is a long-range one. Due to it's difficulty, it's not a commonly used effect on the battlefields.<BR><BR>
Frost Synergies<BR><BR>
A typical misconception of novice mages is that Frost by itself possesses a freezing effect. And while it is not true - on it's own, Frost is nothing more than a destructive element devoid of any nuance - Frost has a natural affinity with slowing attacks.
One could try using the Frost Damage effect with a duration of at least 5, and a Drain Speed effect. Since Frost only opens up the wounds and does not do anything 'slowing' by itself, having it stay any longer is not required. Drain Speed can stay for the longer duration, but you should keep it for at least 10 seconds to notice the Frost's impact.<BR><BR>
Just as Frost is good by slowing down the capabilities of target to run, it's just as good at depleting it's fatigue. It's a simple trick that can be used both at close and far range, although permeating capabilities of Frost make it better suited for close range. You simply need to combine it's effect with Damage Fatigue, and, unlike with draining Speed, there's no requirements on duration.<BR><BR>
Similar to Fire, Frost also has protective uses. It can be used to shield against Fire damage by combining a Frost effect with a duration of at least 10 seconds with a Resist Fire effect, which results in more efficient spell.<BR><BR>
Another synergetic trait of Frost was discovered by a Second Era mage named Illnea. As she found out, Frost opens up the possibilities for the empowered Paralysis effects. To make this work, the projectile, containing both effects (merely touching won't work) must be of at least 10 radius.<BR><BR>
Shock Synergies<BR><BR>
Shock's synergies are less known due to it being harder, and thus less common magical school. One of the more known synergies is the ability to penetrate the victim's body, causing muscle deficiency. This effect is most useful in close quarters, requiring a touch-range spell. 
To make such spell, combine Shock damage and Drain Agility effects. Drain Agility should last for at least 10 effects to benefit properly from shocking.<BR><BR>
A shockball with proper impact can reinforce the weapon-obliterating effect. The magnitude must be of at least 40 for the shock part to make it work. A spell must be a long-ranged one to prevent risks posed by close discharges.<BR><BR>
Shockstorms require vast magical power to concentrate. They work similar to Fireballs: requiring both "over-the-time" and "instant" parts of Shock Damage, with first being of at least 5 seconds and second being 2 seconds at most.
The spell must be long-ranged, and the radius must be even greater than in case of Fireballs - 10 is the minimum. And, by themselves, they're not very effective. However, as it turns out, such eruption of magicka is highly empowering for the Damage Magicka effects. By adding Damage Magicka effect (with a proper radius) to these two effects, the spell will get much more efficient.<BR><BR>
Poison Synergies<BR><BR>
Poison is an underappreciated effect among the mages, often dismissed as "cowardly" and more fitting for assassins than "real" mages. However, staying power of Poison is not the one to be underappreciated. The synergy, with a loud name of "Weakening Poison Field", takes full advantage of it.
To make it work, you'll need to combine Poison and Drain Strength effects. As you could guess from the name, the spell must have a reasonable radius - 10 at the very least.
Of course, this is a long-range spell - you don't want to be caught in your own cloud!
And finally, you need to ensure that effects will remain long enough. How long, exactly? Opinions differ, but for the most cases mages advice for 20 seconds of duration, for both effects.<BR><BR>
One of the other uses of Poison it to weaken target's mental resistances, making it weaker to other magic. A Poison effect with a duration of at least 10 seconds synergized with Weakness to Magicka effect, provided it has at least the same duration. This spell works well both on close and far distances. <BR><BR>
Sourot is a powerful Poison synergy commonly used by Sload necromancers. In the Third Era, you can rarely find someone using it, save for the old-fashioned scrolls. However, recreating it is possible, if a bit troublesome.
You will need 4 effects for this: Damage Willpower, Damage Endurance, Poison Damage, and Paralysis. The spell works only at close range.
Poison must be potent enough to ensure the instant effect: duration does not matter, but minimal magnitude is 15.
Lastly, Paralysis must have a duration of at least 3 seconds.<BR><BR>
Damage Health Synergies<BR><BR>
Damage Health is the purest form of damaging magic, and the least understood one. It's harder to understand, and thus harder to work with. No wonder there are  However, being hard to understand works both ways, and very few Nirn inhabitants possess the natural resistance for these effects.
The most typical synergy known is a Cruel Wound. It emphasizes on the durational aspect of Damage Health and combines it with a Damage Attribute of a similar duration. Both effect must be at least 5 seconds long.
The strong point of such synergy is it's flexibility: it can use any attribute to work. However, just as it is flexible, it's not particularly benefitial in any of the cases.<BR><BR>
Another known trait of Damage Health is it's instant destructive powers, which amplify the damage-over-time effect of Poison.
Combining a fairly powerful (with magnitude of at least 40) instant Damage Health effect will allow for much stronger over time (at least 10 seconds) effect of Poison.<BR><BR>
Conjuration Synergies<BR><BR>
All three Elemental Shields have a natural synergy with corresponding Atronachs. Note that you can only shield yourself in this way, not someone else.<BR><BR>
Summoning armor from the depths of Oblivion can be made less exhausting if you do it all at once, lessening the drain on one's mental capabilities. By summoning helmet, cuirass, greaves, and boots at once, you'll essentially summon the last one for free.<BR><BR>
Conjurers with an affinity for a close combat can take advantage of the synergy named "Daedric Duelist", which combines Bound Shield and Bound Longsword effects. Summoning them for at least 10 seconds together is a handy way to reduce the mental strain.<BR><BR>
Those who prefer more brutish side of combat can use "Daedric Berserk" synergy instead. Bound War Axe, surprisingly, is synergetic with Fortify Attack effect. Of course, you have to fortify your own attack, not someone else's.<BR><BR>
Alteration Synergies<BR><BR>
"Hoptoad" is one of the simplest Alteration techniques, and involves combining Slowfall and Jump effects. Each must be at least 10 seconds long.<BR><BR>
Very handy trick for mages that have to travel by foot for a long time is to combine Feather and Restore Fatigue effects. Both of these effects are by their nature very duration-lenient, allowing for long duration effects. When both are combined with a duration of 60 seconds, they get even more effective.<BR><BR>
Elemental shields can be combined into a stronger shield that will use their combined powers - one that tends to get called "Chromatic Shield". To make one, just combine the three different elemental shields, with a duration of at least 10 seconds. Do note, though, that such shield can only be cast on self.<BR><BR>
"Windform" is a high-grade levitation technique used by master mages. Such spell requires high competence in both Alteration and Illusion (though the former is more important), but allows for efficient, unhindered movement.
To make one, combine a high magnitude Levitation: 120 pt is the minimum, with an Invisibility effect. Both must be at least 20 second long and cast on self.<BR><BR>
While navigating waters, mage might find "Amphibious Form" of use. This is a synergy of Water Breathing and Swift Swim effects, which is a fairly intuitive, easy-to-memorize combination. The only restriction is that both of these effects must have a duration of at least 20 seconds. Spell itself can be cast both on yourself and the others.<BR><BR>
"Baleful Suffering" is a mix of offensive effects designed to have an upper hand against heavily armored knights. Such a techique requires some knowledge in Destruction, Alteration and Illusion. It is a spell that combines the four effects:<BR>
1. Burden, with at least 10 second duration<BR>
2. Disintegrate Weapon<BR>
3. Disintegrate Armor<BR>
4. Blind, with at least 10 second duration<BR>
All of the effects must be long-ranged.<BR><BR>
Mysticism Synergies<BR><BR>
By combining all three common detection effects, one can save plenty of mental fatigue. The only requirement for each of these effects is that they should be at least 10 seconds long - although it will work best when all have the similar power.<BR><BR>
Drain Health and Drain Fatigue work in a similar way, and so it's no wonder that they synergize well. To make best use of them, these should be combined and used at short range.
Additionaly, both work best at higher durations, so for the synergetic effect both need to have their duration at 7 or higher.<BR><BR>
Illusion Synergies<BR><BR>
"Ghost Form" combines the elusiveness of Sanctuary with arcane power of Resist Normal Weapons. These effects, despite belonging to different schools of magic, work surprisingly well together. Both of them must be cast on yourself, and both must have a duration of at least 10 seconds.<BR><BR>
Imprisoning soul and the body at the same time requires both Illusion and Mysticism, but can be combined for solid benefits if caster is competent at both schools. Both effects must have a duration of at least 10 seconds, and both must be cast at long range.<BR><BR>
"Shadow Crawler" synergy involves combining Invisibility and Night's Eye effect, allowing for efficient traversing of dark corridors and narrow alleys, making for a perfect spell for nightblades.<BR><BR>
Restoration Synergies<BR><BR>
"Warrior's Blessing" is a fairly forgotten spellmaking technique that combines both Restore Health and Restore Fatigue effects with Fortify Attack, resulting in a well-demanded fighting skill.
There are very few requirement for each individual effect:<BR>
1. Restore effects only have to be at least somewhat prolonged.<BR>
2. Fortify Attack needs to have some magnitude. 15 is the minimal.<BR>
Resulting can be cast not only at yourself, but on the others aswell, which was it's primary use back in the Second Era.<BR><BR>
Fortyfing several Attributes at the same time is another Restoration synergetic technique, common to self-sufficient Knights capable of casting Restoration magic, that had fallen out of favor, replaced by dedicated priest corps. Empowering both Strength, Agility and Speed at the same time results in lesser mental strain than it would be otherwise.
<BR>
-]==],
}
