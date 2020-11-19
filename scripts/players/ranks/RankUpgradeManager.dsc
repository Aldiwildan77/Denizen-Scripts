# Replace generic requirements with rank-up quests; hunt down and kill mini-boss to receive a blessing from the gods

RankupCommand:
    type: command
    name: rankup
    description: Check the requirements to earn the next rank.
    usage: /rankup
    script:
    - if <player.in_group[Knight]>:
        - narrate "<&a>Congratulations, you're already at the highest rank currently achievable!"
        - stop
    - else if <player.in_group[Apprentice]>:
        - narrate "<&a>You're currently an <&b>Apprentice<&a>! Here are the requirements to level up to <&b>Knight<&a>:"
        - narrate "<&f>• 500 levels of experience"
        - narrate "<&f>• A sacrifice to the Gods of 100,000 gold"
        - narrate "<&f>• Combined skill level of 5000"

    - else if <player.in_group[Squire]>:
        - narrate "<&a>You're currently a <&b>Squire<&a>! Here are the requirements to level up to <&b>Apprentice<&a>:"
        - narrate "<&f>• 250 levels of experience"
        - narrate "<&f>• A sacrifice to the Gods of 50,000 gold"
        - narrate "<&f>• Combined skill level of 1500"

    - else if <player.in_group[Page]>:
        - narrate "<&a>You're currently a <&b>Page<&a>! Here are the requirements to level up to <&b>Squire<&a>:"
        - narrate "<&f>• 100 levels of experience"
        - narrate "<&f>• A sacrifice to the Gods of 1,000 gold"
        - narrate "<&f>• Combined skill level of 500"

    - else if <player.in_group[Youngling]>:
        - narrate "<&a>You're currently a <&b>Youngling<&a>! Here are the requirements to level up to <&b>Page<&a>:"
        - narrate "<&f>• 30 levels of experience"
        - narrate "<&f>• A sacrifice to the Gods of 500 gold"
        - narrate "<&f>• Combined skill level of 200"

Rank_Upgrade_Check:
    type: task
    debug: false
    script:
    - if <player.in_group[Apprentice]>:
        - if <player.money> >= 100000 && <player.xp_level> >= 500 && <player.mcmmo.level> >= 5000:
            - take money quantity:100000
            - experience take level 500
            - narrate "<&a>You have given a sacrifice to the Gods of 500 levels and 100,000 gold."
            - narrate "<&a>They honor your sacrifice and recognize your glory and triumph."
            - narrate "<&a>Your personal growth is recognized. You are now a <&b>Knight<&a>!"
            - announce "<&a><player.name> has been recognized by the Gods and is now a <&b>Knight<&a>!"
    - else if <player.in_group[Squire]>:
        - if <player.money> >= 50000 && <player.xp_level> >= 250 && <player.mcmmo.level> >= 1500:
            - take money quantity:50000
            - experience take level 250
            - narrate "<&a>You have given a sacrifice to the Gods of 500 levels and 50,000 gold."
            - narrate "<&a>They honor your sacrifice and recognize your glory and triumph."
            - narrate "<&a>Your personal growth is recognized. You are now a <&b>Knight<&a>!"
            - announce "<&a><player.name> has been recognized by the Gods and is now a <&b>Knight<&a>!"
    - else if <player.in_group[Page]>:
        - if <player.money> >= 1000 && <player.xp_level> >= 100 && <player.mcmmo.level> >= 500:
            - take money quantity:1000
            - experience take level 100
            - narrate "<&a>You have given a sacrifice to the Gods of 500 levels and 100,000 gold."
            - narrate "<&a>They honor your sacrifice and recognize your glory and triumph."
            - narrate "<&a>Your personal growth is recognized. You are now a <&b>Knight<&a>!"
            - announce "<&a><player.name> has been recognized by the Gods and is now a <&b>Knight<&a>!"
    - else if <player.in_group[Youngling]>:
        - if <player.money> >= 500 && <player.xp_level> >= 30 && <player.mcmmo.level> >= 200:
            - take money quantity:500
            - experience take level 30
            - narrate "<&a>You have given a sacrifice to the Gods of 500 levels and 100,000 gold."
            - narrate "<&a>They honor your sacrifice and recognize your glory and triumph."
            - narrate "<&a>Your personal growth is recognized. You are now a <&b>Knight<&a>!"
            - announce "<&a><player.name> has been recognized by the Gods and is now a <&b>Knight<&a>!"