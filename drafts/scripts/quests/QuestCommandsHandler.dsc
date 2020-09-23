QuestsCommand:
    debug: false
    type: command
    name: quests
    description: Show active quests and their progress
    usage: /quests [page number]
    script:
    - define data <player.uuid>_quest_data
    - foreach <yaml[<[data]>].read[quests.active]> as:quest:
        - clickable questdetail save:quest_detail for:<player> def:<[quest]>
        - narrate format:QuestNameFormat <[quest].get[name].on_click[<entry[quest_detail].command>]>
        - narrate format:QuestDescriptionFormat <[quest].get[description].on_click[<entry[quest_detail].command>]>

QuestDetail:
    type: task
    debug: true
    definitions: quest
    script:
    - define data <player.uuid>_quest_data
    - define current_stage <[quest].get[current_stage]>
    - narrate format:QuestNameFormat <[quest].get[name]>
    - narrate format:QuestDescriptionFormat <[quest].get[description]>
    - narrate "<green>Stage <[current_stage]>: <&r><[quest].get[stages.<[current_stage]>.description]>"
    - foreach <[quest].get[stages.<[current_stage]>.objectives]>:
        - narrate "• <[value].get[name]>: <[value].get[progress]>/<[value].get[total]>"


QuestQuitCommand:
    debug: false
    type: command
    name: questquit
    description: Quit a specified quest
    usage: /questquit [quest]
    script:
    - define data <player.uuid>_quest_data
    - foreach <yaml[<[data]>].read[quests.active]> as:quest:
        - if <[quest].get[name].contains_text[<context.args.get[1]>]>:
            - define match_list:->:<[quest]>
    - if <[match_list].size> > 1:
        - narrate "Please select a quest to quit:"
        - foreach <[match_list]> as:match:
            - define quest <yaml[<[data]>].read[quests.active].get[match]>
            - clickable questquitdetail save:quest_quit_detail for:<player> def:<[quest]>|<[match]>
            - narrate format:QuestNameFormat <[quest].get[name].on_click[<entry[quest_quit_detail]>]>
    - else:
        - define match <[match_list].get[1]>
        - define quest <yaml[<[data]>].read[quests.active].get[match]>
        - inject QuestQuitHandler

QuestQuitDetail:
    type: task
    debug: true
    definitions: quest|match
    script:
    - inject QuestQuitHandler