QuestsCommand:
    debug: false
    type: command
    name: quests
    description: Show active quests and their progress
    usage: /quests [page number]
    script:
    - define data <player.uuid>_quest_data
    - foreach <yaml[<[data]>].read[quests.active]> as:quest_internalname:
        - define current_stage <yaml[<[data]>].read[quests.active.<[quest_internalname]>.current_stage]>
        - flag player questdetail_<[quest_internalname]>_uuid:<util.random.uuid> duration:1h
        - narrate format:QuestNameFormat "<element[<yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.name]>].on_click[/questdetail <[quest_internalname]> <player.flag[questdetail_<[quest_internalname]>_uuid]>]>"
        - narrate format:QuestDescriptionFormat "<element[<yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.description]>].on_click[/questdetail <[quest_internalname]> <player.flag[questdetail_<[quest_internalname]>_uuid]>]>"

QuestDetailCommand:
    debug: false
    type: command
    name: questdetail
    description: Show the details of a selected quest (run via quest list)
    usage: /questdetail [quest] [uuid]
    permissions: quests.questdetail
    script:
    - narrate "This text should never display."

QuestDetailCommandEvent:
    type: world
    debug: true
    events:
        on questdetail command:
        # Check if UUID matches
        - define quest_internalname <context.args.get[1]||null>
        - if <context.args.get[2]||null> == <player.flag[questdetail_<[quest_internalname]>_uuid]||null2>:
            - define data <player.uuid>_quest_data
            - define current_stage <yaml[<[data]>].read[quests.active.<[quest_internalname]>.current_stage]>
            - narrate format:QuestNameFormat <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.name]>
            - narrate format:QuestDescriptionFormat <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.description]>
            - narrate "<green>Stage <[current_stage]>: <&r><yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.stages.<[current_stage]>.description]>"
            - foreach <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.stages.<[current_stage]>.objectives]>:
                - narrate "• <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.stages.<[current_stage]>.objectives.<[value]>.name]>: <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.stages.<[current_stage]>.objectives.<[value]>.progress]>/<yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.stages.<[current_stage]>.objectives.<[value]>.total]>"
        - else:
            # No UUID match
            - determine fulfilled

QuestQuitCommand:
    debug: false
    type: command
    name: questquit
    description: Quit a specified quest
    usage: /questquit [quest]
    script:
    - define data <player.uuid>_quest_data
    - foreach <yaml[<[data]>].read[quests.active]>:
        - if <yaml[<[data]>].read[quests.active.<[value]>.name].contains_text[<context.args.get[1]>]>:
            - define match_list:->:<[value]>
    - if <[match_list].size> > 1:
        - narrate "Please select a quest to quit:"
        - foreach <[match_list]> as:match:
            - define quest_internalname <[match]>
            - narrate format:QuestNameFormat "<element[<yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.name]>].on_click[/questquitdetail <[quest_internalname]> <player.flag[questdetail_<[quest_internalname]>_uuid]>]>"
    - else:
        - define quest_internalname <[match_list].get[1]>
    - inject QuestQuitHandler

QuestQuitDetailCommand:
    debug: false
    type: command
    name: questquitdetail
    description: Quit the specified quest (run via questquit)
    usage: /questquitdetail [quest] [uuid]
    permissions: quests.questquitdetail
    script:
    - narrate "This text should never display."

QuestQuitDetailCommandEvent:
    type: world
    debug: true
    events:
        on questquitdetail command:
        - define quest_internalname <context.args.get[1]||null>
        - if <context.args.get[2]||null> == <player.flag[questquitdetail_<[quest_internalname]>_uuid]||null2>:
            - inject QuestQuitHandler
            - determine fulfilled
        - else:
            - determine fulfilled