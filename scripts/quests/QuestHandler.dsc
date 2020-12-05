QuestNameFormat:
    type: format
    format: "<green>Quest: <gold><text>"

QuestDescriptionFormat:
    type: format
    format: "<aqua>Description:<&r> <text>"

QuestDataHandler:
    debug: false
    type: world
    # Handles loading and unloading player quest data on join/quit
    events:
        on player joins:
        - define data <player.uuid>_quest_data
        - if <server.has_file[playerdata/<player.uuid>/quest_data.yml]>:
            - ~yaml load:playerdata/<player.uuid>/quest_data.yml id:<[data]>
        - else:
            - yaml create id:<[data]>
            - yaml id:<[data]> set player_uuid:<player.uuid>
            - ~yaml id:<[data]> savefile:playerdata/<player.uuid>/quest_data.yml
        - yaml set id:<[data]> set player_last_known_name:<player.name>
        on player quits:
        - define data <player.uuid>_quest_data
        - ~yaml id:<[data]> savefile:playerdata/<player.uuid>/quest_data.yml

QuestRequirementsHandler:
    type: procedure
    debug: false
    definitions: quest_internalname
    script:
    - define data <player.uuid>_quest_data
    # Completed quests
    - foreach <yaml[<[quest_internalname]>].read[config.requirements.quests_completed]> as:QuestsCompleted:
        - if <yaml[<[data]>].contains[quests.completed.<[QuestsCompleted]>].not>:
            - determine false
    # Player groups
    - foreach <yaml[<[quest_internalname]>].read[config.requirements.groups]> as:PlayerGroups:
        - if <player.groups.contains[<[PlayerGroups]>].not>:
            - determine false
    # Individual permissions
    - foreach <yaml[<[quest_internalname]>].read[config.requirements.permissions]> as:PlayerPermissions:
        - if <player.has_permission[<[PlayerPermissions]>].not>:
            - determine false
    - determine true

QuestAcceptHandler:
    debug: false
    type: task
    definitions: quest_internalname
    # Handles accepting a quest
    script:
    - define data <player.uuid>_quest_data
    - yaml id:<[quest_internalname]> copykey:player_data.<[quest_internalname]> quests.active.<[quest_internalname]> to_id:<[data]>
    - yaml id:<[data]> set quests.active.<[quest_internalname]>.current_stage:1
    - define quest <yaml[<[data]>].read[quests.active.<[quest_internalname]>]>
    - run QuestResetTimeHandler def:<[quest_internalname]>
    - define current_stage 1
    - narrate <yaml[<[quest_internalname]>].parsed_key[messages.offer]>
    - narrate format:QuestNameFormat <[quest].get[name]>
    - narrate format:QuestDescriptionFormat <[quest].get[description]>
    - narrate "<green>Stage <[current_stage]>: <&r><[quest].get[stages].get[<[current_stage]>].get[description]>"
    - foreach <[quest].get[stages].get[<[current_stage]>].get[objectives]>:
        - narrate "• <[value].get[name]>: <[value].get[progress]>/<[value].get[total]>"

QuestStageProgressHandler:
    debug: false
    type: task
    definitions: quest_internalname|objective
    ## This script will add 1 to the stage progress and should only be run when an objective is completed
    script:
    - define data <player.uuid>_quest_data
    - define quest <yaml[<[data]>].read[quests.active.<[quest_internalname]>]>
    # Set current stage definition
    - define current_stage <[quest].get[current_stage]>
    - define stage_progress <[quest].get[stages].get[current_stage].get[progress]>
    - define stage_total <[quest].get[stages].get[current_stage].get[total]>
    # Advance the current stage progress by 1
    - yaml id:<[data]> set quests.active.<[quest_internalname]>.stages.<[current_stage]>.progress:++
    # If the current stage progress is equal to or greater than the total for that stage,
    - if <[stage_progress]> >= <[stage_total]>:
        # Check whether there is another stage
        - if <yaml[<[data]>].contains[quests.active.<[quest_internalname]>.stages.<[current_stage].add[1]>]>:
            # If yes, advance to the next stage
            - run QuestStageAdvanceHandler def:<[quest_internalname]>
        - else:
            # If no, complete the quest
            - run QuestCompletionHandler def:<[quest_internalname]>
    # Display remaining objectives
    ## TODO: Replace with a foreach and conditional formatting for completed objectives
    - else if <[objective]||null>:
        - narrate format:QuestNameFormat <[quest].get[name]>
        - narrate "• <[quest].get[stages].get[<[current_stage]>].get[objectives].get[<[objective]>].get[name]>: <[quest].get[stages].get[<[current_stage]>].get[objectives].get[<[objective]>].get[progress]>/<[quest].get[stages].get[<[current_stage]>].get[objectives].get[<[objective]>].get[total]>"

QuestItemDeliveryHandler:
    debug: false
    type: task
    definitions: objective|quest_internalname|stage
    # Manages players delivering items to NPCs
    # Requires: <[objective]> AND <[quest_internalname]> AND <[stage]>
    script:
    - define data <player.uuid>_quest_data
    - define quest <yaml[<[data]>].read[quests.active.<[quest_internalname]>]>
    #- define progress <yaml[<[data]>].read[quests.active.<[quest_internalname]>.stages.<[stage]>.objectives.<[objective]>.progress]>
    - define progress <[quest].get[stages].get[<[current_stage]>].get[objectives].get[<[objective]>].get[progress]>
    #- define total <yaml[<[data]>].read[quests.active.<[quest_internalname]>.stages.<[stage]>.objectives.<[objective]>.total]>
    - define total <[quest].get[stages].get[<[current_stage]>].get[objectives].get[<[objective]>].get[total]>
    - define delivery_quantity <player.item_in_hand.quantity>
    #- define delivery_item:<player.item_in_hand.scriptname||<player.item_in_hand.material.name>>
    # We only want to take items if items need to be taken
    - if <[progress]> < <[total]>:
        - define remainder <[total].sub[<[progress]>]>
        - if <[delivery_quantity]> >= <[remainder]>:
            - take iteminhand quantity:<[delivery_quantity].sub[<[remainder]>]>
            - yaml id:<[data]> set quests.active.<[quest_internalname]>.stages.<[stage]>.objectives.<[objective]>.progress:<[total]>
            # Advance a stage
            - inject QuestStageProgressHandler
        - else:
            - take iteminhand quantity:<[delivery_quantity]>
            - yaml id:<[data]> set quests.active.<[quest_internalname]>.stages.<[stage]>.objectives.<[objective]>.progress:<[progress].add[delivery_quantity]>
            # Show current progress
            - inject QuestProgressHandler
            - define InProgress
    # If the progress is somehow already more than the total, move on
    - else:
        - yaml id:<[data]> set quests.active.<[quest_internalname]>.stages.<[stage]>.objectives.<[objective]>.progress:<[total]>
        # Advance a stage
        - inject QuestStageProgressHandler

QuestProgressHandler:
    debug: true
    type: task
    definitions: quest_internalname
    # Shows the player their progress for the designated quest
    script:
    - define data <player.uuid>_quest_data
    - define quest <yaml[<[data]>].read[quests.active.<[quest_internalname]>]>
    - define current_stage <[quest].get[current_stage]>
    # Show the quest name
    - narrate format:QuestNameFormat <[quest].get[name]>
    # Show the quest description
    - narrate format:QuestDescriptionFormat <[quest].get[description]>
    # Show the current stage
    - narrate "<green>Stage <[current_stage]>: <&r><[quest].get[stages].get[<[current_stage]>].get[description]>"
    # Show the current objectives
    - foreach <[quest].get[stages].get[<[current_stage]>].get[objectives]>:
        - narrate "• <[value].get[name]>: <[value].get[progress]>/<[value].get[total]>"

QuestStageAdvanceHandler:
    debug: false
    type: task
    definitions: quest_internalname
    # Advances the quest stage by one and narrates information about the new stage
    script:
    - define data <player.uuid>_quest_data
    - define quest <yaml[<[data]>].read[quests.active.<[quest_internalname]>]>
    # Add one to the current stage
    - yaml id:<[data]> set quests.active.<[quest_internalname]>.current_stage:++
    - define current_stage <[quest].get[current_stage]>
    # Narrate the quest name
    - narrate format:QuestNameFormat <[quest].get[name]>
    # Narrate the quest description
    - narrate format:QuestDescriptionFormat <[quest].get[description]>
    # Narrate the new current stage
    - narrate "<green>Stage <[current_stage]>: <&r><[quest].get[stages].get[<[current_stage]>].get[description]>"
    # Narrate the new objectives
    - foreach <[quest].get[stages].get[<[current_stage]>].get[objectives]>:
        - narrate "• <[value].get[name]>: <[value].get[progress]>/<[value].get[total]>"

QuestQuitHandler:
    debug: false
    type: task
    definitions: quest|quest_internalname
    # Handles everything related to quitting a quest
    script:
    - define data <player.uuid>_quest_data
    - define quest <yaml[<[data]>].read[quests.active.<[quest_internalname]>]>
    - yaml id:<[data]> set quests.active.<[quest_internalname]>:!
    - zap <yaml[<[quest_internalname]>].read[config.availability.offering_npc]>Interact <yaml[<[quest_internalname]>].read[config.quit_step]>
    - narrate "<red>QUEST QUIT: <[quest].get[name]>"

QuestCompletionHandler:
    debug: false
    type: task
    definitions: quest_internalname
    # Handles everything related to completing a quest
    script:
    - define data <player.uuid>_quest_data
    - yaml id:<[data]> set quests.active.<[quest_internalname]>:!
    - yaml id:<[data]> set quests.completed.<[quest_internalname]>.completion_count:++
    - yaml id:<[data]> set quests.completed.<[quest_internalname]>.last_completed:<util.time_now>
    - narrate "<gold>QUEST COMPLETE: <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.name]>"
    - narrate <yaml[<[quest_internalname]>].read[messages.completion]>
    - narrate <green>Rewards:
    - run QuestRewardHandler def:<[quest_internalname]>

QuestRepeatableHandler:
    debug: false
    type: procedure
    definitions: quest_internalname
    # Checks whether a quest is repeatable after a previous completion
    script:
    - define data <player.uuid>_quest_data
    - define reset_time <yaml[<[data]>].read[quests.completed.<[quest_internalname]>.reset_time]>
    - choose <yaml[<[quest_internalname]>].read[config.reset.period]>:
        - if <util.time_now> >= <[reset_time]>:
            - determine true
        - if <util.time_now> < <[reset_time]>:
            - determine false
        - else:
            - announce to_console "Something is terribly broken with the repeatable handler!"
        #- case 7d:
        #    - if <[current_week]> > <[reset_time]>:
        #        - determine true
        #    - else if <[current_week]> == <[last_completed].in_weeks> && <util.time_now.#day_of_week> > 6:
        #        - determine true
        #    - else if <util.time_now.day_of_week> == 6 && <util.time_now.hour> >= 19:
        #        - determine true
        #    - else:
        #        - determine false
        #- case 1d:
        #    - if <[current_day].sub[1]> > <[last_completed].in_days>:
        #        - determine true
        #    - else if <[current_day].sub[1]> == <[last_completed].in_days> && <#[last_completed].time.hour> < 19:
        #        - determine true
        #    - else if <[last_completed].time.hour> >= 19:
        #        - determine false
        #    - else if <[current_day]> == <[last_completed].in_days> && <util.time_now.hour> #>= 19 && <[last_completed].time.hour> < 19:
        #        - determine true
        #    - else:
        #        - determine false

QuestRewardHandler:
    debug: false
    type: task
    definitions: quest_internalname
    # Handles quest reward distribution
    script:
    - define data <player.uuid>_quest_data
    - if <yaml[<[quest_internalname]>].contains[rewards.money]>:
        - money give quantity:<yaml[<[quest_internalname]>].read[rewards.money]> players:<player>
        - narrate "<gold><yaml[<[quest_internalname]>].read[rewards.money]> gold"
    - if <yaml[<[quest_internalname]>].contains[rewards.items]>:
        - foreach <yaml[<[quest_internalname]>].read[rewards.items]>:
            - give <[value]>
            - narrate "<[value].quantity>x <[value].display>"
    - if <yaml[<[quest_internalname]>].contains[rewards.quest_points]>:
        - yaml id:<[data]> set career.quest_points:+:<yaml[<[quest_internalname]>].read[rewards.quest_points]>
    - if <yaml[<[quest_internalname]>].contains[rewards.scripts]>:
        - foreach <yaml[<[quest_internalname]>].read[rewards.scripts]>:
            - run <[value]> def:<[quest_internalname]>
    - if <yaml[<[quest_internalname]>].contains[rewards.commands]>:
        - foreach <yaml[<[quest_internalname]>].read[rewards.commands]>:
            - execute as_server <[value]>
        - foreach <yaml[<[quest_internalname]>].read[rewards.command_text]>:
            - narrate <[value]>

QuestLoginResetHandler:
    debug: false
    type: world
    # Handles any expirations and resets on login
    events:
        on player joins:
        - define data <player.uuid>_quest_data
        - if <yaml[<[data]>].read[quests.active].size||0> == 0:
            - stop
        - foreach <yaml[<[data]>].read[quests.active]> as:quest_internalname:
            - define reset_time:<yaml[<[data]>].read[quests.active.<[quest_internalname]>.reset_time]>
            - if <util.time_now> >= <[reset_time]>:
                - yaml id:<[data]> set quests.active.<[quest_internalname]>:!
                - narrate "<red>QUEST EXPIRED: <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.name]>"

QuestDailyResetHandler:
    debug: false
    type: world
    # Handles daily quest resets
    events:
        on system time 19:00:
        - foreach <server.online_players> as:player:
            - define data:<[player].uuid>_quest_data
            - foreach <yaml[<[data]>].read[quests.active]> as:quest_internalname:
                - define reset_time:<yaml[<[data]>].read[quests.active.<[quest_internalname]>.reset_time]>
                - if <util.time_now> >= <[reset_time]>:
                    - yaml id:<[data]> set quests.active.<[quest_internalname]>:!
                    - narrate "<red>QUEST EXPIRED: <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.name]>"

QuestResetTimeHandler:
    debug: false
    type: task
    definitions: quest_internalname
    # Handles quest reset times
    script:
    - define data <player.uuid>_quest_data
    - choose <yaml[<[quest_internalname]>].read[config.reset.period]>:
        - case 7d:
            - if <util.time_now.day_of_week> == 5 && <util.time_now.hour> >= 19:
                - yaml id:<[data]> set quests.completed.<[quest_internalname]>.reset_time:<util.next_day_of_week[Friday].add[7d].add[19h].sub[5m]>
            - else:
                - yaml id:<[data]> set quests.completed.<[quest_internalname]>.reset_time:<util.next_day_of_week[Friday].add[19h].sub[5m]>
        - case 1d:
            - if <util.time_now.hour> >= 19:
                - yaml id:<[data]> set quests.completed.<[quest_internalname]>.reset_time:<util.time_now.start_of_day.add[1d].add[19h].sub[5m]>
            - else:
                - yaml id:<[data]> set quests.completed.<[quest_internalname]>.reset_time:<util.time_now.start_of_day.add[19h].sub[5m]>

QuestAvailabilityHandler:
    debug: false
    type: procedure
    definitions: quest_internalname
    # Checks whether a quest is available
    script:
    - define data <player.uuid>_quest_data
    - if <yaml[<[data]>].read[quests.completed.<[quest_internalname]>.reset_time]||null> > <util.time_now>:
        - determine false
    - else:
        - determine true

QuestsAvailableHandler:
    debug: false
    type: procedure
    definitions: npc_name
    # Returns whether any quest is available for an npc
    script:
    - define data <player.uuid>_quest_data
    - define quest_list:<yaml[quest_npc_list].read[<[npc_name]>]>
    - define inventory_list:<list[]>
    - foreach <[quest_list]>:
        - if <proc[QuestAvailabilityHandler].context[<[value]>]> && <yaml[<[data]>].contains[quests.active.<[value]>].not>:
            - determine true
    - else:
        - determine false

QuestInventoryGUIHandler:
    debug: false
    type: task
    definitions: npc_name
    # Opens an inventory GUI with available quests
    script:
    - define data <player.uuid>_quest_data
    - define quest_list:<yaml[quest_npc_list].read[<[npc_name]>]>
    - define inventory_list:<list[]>
    - foreach <[quest_list]>:
        - if <proc[QuestAvailabilityHandler].context[<[value]>]> && <yaml[<[data]>].contains[quests.active.<[value]>].not>:
            - define inventory_list:<[inventory_list].include[<proc[QuestGUIItemBuilder].context[<[value]>]>]>
    - if <[inventory_list].size> > 0:
        - note <inventory[generic[title=<&6><&l>Quests;size=27;contents=<[inventory_list]>]> as:available_quest_inventory.<[npc_name]>.<player.uuid>
        - inventory open d:available_quest_inventory.<[npc_name]>.<player.uuid>
    - else:
        - narrate "<red>No quests available!"

QuestInventorySelectionHandler:
    debug: false
    type: world
    # Handles a player choosing a quest from an inventory GUI
    events:
        on player clicks in available_quest_inventory*:
        - if <context.item.has_nbt[quest_internalname]>:
            - inventory close
            - run QuestAcceptHandler def:<context.item.nbt[quest_internalname]>
        - else:
            - determine cancelled
        on player drags in available_quest_inventory*:
        - determine cancelled

QuestGUIItemBuilder:
    debug: false
    type: procedure
    definitions: quest_internalname
    # Constructs the item entries in an inventory GUI
    script:
    - define quest_name:<yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.name]>
    - define item_lore:<list[<[quest_name]>]>
    - define quest_description:<yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.description]>
    - define item_lore:<[item_lore].include[<[quest_description]>]>
    - define item_lore:<[item_lore].include[<&6>Rewards:]>
    - if <yaml[<[quest_internalname]>].read[config.rewards.money]||null> != null:
        - define lore_money:"<yaml[<[quest_internalname]>].read[config.rewards.money]> gold"
        - define item_lore:<[item_lore].include[<[lore_money]>]>
    - if <yaml[<[quest_internalname]>].read[config.rewards.quest_points]||null> != null:
        - define "lore_quest_points:<yaml[<[quest_internalname]>].read[config.rewards.quest_points]> quest points"
        - define item_lore:<[item_lore].include[<[lore_quest_points]>]>
    # Line wrapping time!
    - define item_lore:<proc[lore_builder].context[40|<[item_lore].escaped>]>
    - if <item[<[quest_internalname]>_gui_item]||null> != null:
        - define base_item:<item[<[quest_internalname]>_gui_item]>
        - if <[base_item].is_enchanted>:
            - define item_enchantments:<[base_item].enchantments.with_levels>
            - determine <item[<[base_item]>.material_name.with[display_name=<[quest_name]>;lore=<[item_lore]>;enchantments=<[item_enchantments]>;flags=HIDE_ENCHANTS;nbt=quest_internalname/<[quest_internalname]>]]>
    - else:
        - define item_material:<yaml[<[quest_internalname]>].read[config.material]>
        - determine <item[<[item_material]>[display_name=<[quest_name]>;lore=<[item_lore]>;nbt=quest_internalname/<[quest_internalname]>]]>