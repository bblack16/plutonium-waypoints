#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\bots\_bot_utility;
#include scripts\bb_utility;

init() {
    if (level.teambased) {
        level thread onPlayerConnect();
    }
}

onPlayerConnect() {
    for(;;) {
        level waittill("connected", player);
        if (!player isBot()) {
            player thread onPlayerSpawned();
            player thread onplayerkilled();
        }
    }
}

onPlayerSpawned() {
    self endon("disconnect");

    for(;;) {
        self waittill("spawned_player");
        self showFriendIcon();
    }
}

onplayerkilled() {
    self endon( "disconnect" );

    for (;;) {
        self waittill( "killed_player" );
        self.headicon = "";
    }
}

showFriendIcon() {
    self.headicon = game["headicon_" + self.team];
    self.headiconteam = self.team;
}