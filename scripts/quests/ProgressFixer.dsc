QuestCompletionInteractFixer:
    type: world
    debug: false
    events:
        on player joins:
        - define data <player.uuid>_quest_data
        - if <yaml[<[data]>].contains[quests.completed.SwabbyDelivery]>:
            - zap SwabbyInteract SwabbyDeliveryCompleted
            - zap QuestMasterInteract GeneralDialogue
        - if <yaml[<[data]>].contains[quests.completed.SwabbyDelivery]> && <yaml[<[data]>].contains[quests.active.WoodTools].not> && <yaml[<[data]>].contains[quests.completed.WoodTools].not>:
            - zap QuestMasterInteract WoodToolsOffer
        - else if <yaml[<[data]>].contains[quests.completed.WoodTools]> && <yaml[<[data]>].contains[quests.active.StoneTools].not> && <yaml[<[data]>].contains[quests.completed.StoneTools].not>:
            - zap QuestMasterInteract StoneToolsOffer
        - else if <yaml[<[data]>].contains[quests.completed.StoneTools]> && <yaml[<[data]>].contains[quests.active.LeatherArmor].not> && <yaml[<[data]>].contains[quests.completed.LeatherArmor].not>:
            - zap QuestMasterInteract LeatherArmorOffer
        - else if <yaml[<[data]>].contains[quests.completed.LeatherArmor]> && <yaml[<[data]>].contains[quests.active.FindReinwald].not> && <yaml[<[data]>].contains[quests.completed.FindReinwald].not>:
            - zap QuestMasterInteract FindReinwaldOffer
        - else if <yaml[<[data]>].contains[quests.completed.LeatherArmor]> && <yaml[<[data]>].contains[quests.active.IronToolsArmor].not> && <yaml[<[data]>].contains[quests.completed.IronToolsArmor].not>:
            - zap QuestMasterInteract IronToolsArmorOffer
        - else if <yaml[<[data]>].contains[quests.completed.IronToolsArmor]> && <yaml[<[data]>].contains[quests.active.FindFishingNewbie].not> && <yaml[<[data]>].contains[quests.completed.FindFishingNewbie].not>:
            - zap QuestMasterInteract FindFishingNewbieOffer
        - else if <yaml[<[data]>].contains[quests.completed.FindFishingNewbie]> && <yaml[<[data]>].contains[quests.active.MeetSkillTrainers].not> && <yaml[<[data]>].contains[quests.completed.MeetSkillTrainers].not>:
            - zap QuestMasterInteract MeetSkillTrainersOffer
        - else if <yaml[<[data]>].contains[quests.completed.MeetSkillTrainers]> && <yaml[<[data]>].contains[quests.active.MeetPostmaster].not> && <yaml[<[data]>].contains[quests.completed.MeetPostmaster].not>:
            - zap QuestMasterInteract MeetPostmasterOffer
        - else if <yaml[<[data]>].contains[quests.completed.MeetPostmaster]> && <yaml[<[data]>].contains[quests.active.FirstMobHunting].not> && <yaml[<[data]>].contains[quests.completed.FirstMobHunting].not>:
            - zap QuestMasterInteract FirstMobHuntingOffer_QM
        - else if <yaml[<[data]>].contains[quests.completed.FirstMobHunting]> && <yaml[<[data]>].contains[quests.completed.MeetPostmaster]>:
            - zap QuestMasterInteract NoActiveQuest
