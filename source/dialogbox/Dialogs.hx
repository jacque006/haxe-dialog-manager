package dialogbox;

enum DialogId {
    NoId;
    FakeIntro;
    Intro;
    ShovelRequired;
    PlayerAlmostRanOutOfLight;
    PlayerRanOutOfLight;
    PlayerDied;
    ShovelPurchased;
    MatterConverterDescription;
    HeartJarDescription;
    SpeedClogDescription;
    AxeDescription;
    ShovelDescription;
    LedDescription;
    MatterConverterPurchased;
    HeartJarPurchased;
    SpeedClogPurchased;
    AxePurchased;
    LedPurchased;
}

class Dialogs {
	public static var DialogMap:Map<DialogId, Array<String>> = [
        FakeIntro => ["Oh look, another one came down."],
        Intro => ["Oh look, another one came down.", "If you manage to live long enough to get some money, bring it back here for some items.", "I see you have $5 on you right now.", "How about you trade me that for the shovel to get you started?", "Use the arrow keys to move and Press 'Z' to interact with objects like my shop and ropes"],
        ShovelRequired => ["Going into the caves already? You really shouldn't go there without a shovel..."],
        PlayerAlmostRanOutOfLight => ["Wow that light was just about drained.", "You certainly are brave."],
        PlayerRanOutOfLight => ["You are lucky I found you.", "Without a light, you would have been wandering those caves for a long time.", "Obviously, rescues come with a fee...", "Don't give up"],
        PlayerDied => ["I knew you weren't tough enough...", "I wasn't actually going to let you die down there.", "Well... it has happened once, but that was it!", "Obviously, rescues come with a fee...", "Don't give up"],
        ShovelPurchased => ["Thanks! 'Z' is also how you swing your shovel. Go ahead, try it out.", "Also, the battery on your headlamp depletes over time. It automatically recharges up here.", "Good luck"],
        MatterConverterDescription => ["The Matter Converter. This item will turn corpses into battery power for your light."],
        HeartJarDescription => ["Heart Jar. Double your max health."],
        SpeedClogDescription => ["SpeedClog. Slight movement speed increase."],
        AxeDescription => ["Axe. More damage."],
        ShovelDescription => ["Shovel. You are going to need this."],
        LedDescription => ["LED Bulb. Incredibly bright and efficient light bulb."],
        MatterConverterPurchased => ["Thanks! Interact with corpses in the caves to convert them into battery power.", "Every 6 corpses will give your light more charge!"],
        HeartJarPurchased => ["Thanks! Your max health has increased by 3!"],
        SpeedClogPurchased => ["Thanks! You now move a little bit faster!"],
        AxePurchased => ["Thanks! You now can deal more damage!"],
        LedPurchased => ["LED Bulb. You now have increased visibility and longevity on your headlamp!"],
    ];
}