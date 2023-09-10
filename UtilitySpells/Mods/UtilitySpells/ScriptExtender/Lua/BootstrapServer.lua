Ext.Require("./UTSP_TagListener.lua")
Ext.Require("./UTSP_SpeakWithDeadListener.lua")
Ext.Require("./Tag_Utils.lua")

Ext.Osiris.RegisterListener("ClearFlag", 3, "after", function(FLAG, GUIDSTRING, INTEGER)
    if FLAG == "GLO_SpeakWithDead_Event_QuestionAsked_9984cd59-2fad-46cb-bf61-96af6034fbea" then
        Osi.PROC_ObjectCountHelper(GUIDSTRING, "GLO_SpeakWithDead_QuestionCount", -1)
    end
end)

-- TODO: Remove the Tag functions once the tatuses work
-- Custom ToggleTag functions
local function UTSP_ToggleTag(character, tag_guid, tag_notification)
    local character_string = "" .. character
    local add_notification = "You have a new ability: " .. tag_notification
    local remove_notification = "You have lost an ability: " .. tag_notification

    if Osi.IsTagged(character, tag_guid) == 1 then
        Osi.ClearTag(character, tag_guid)
        Osi.ShowNotification(character_string, remove_notification)
    else
        Osi.SetTag(character, tag_guid)
        Osi.ShowNotification(character_string, add_notification)
    end
end

-- Alternative function with table
Ext.Osiris.RegisterListener("CastSpell", 5, "after", function(char, spell, nil1, nil2, nil3)
    local character = GetHostCharacter();
    local tagTable = {
        -- Backgrounds
        ["UTSP_Shout_ToggleBackground_Acolyte"] = { tag_guid = "906d1961-e9c6-4170-b775-62797a0efe1c", tag_notification =
        "acolyte background tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleBackground_Charlatan"] = { tag_guid = "07925e5b-af3d-4743-a565-b9fee04c24ac", tag_notification =
        "charlatan background tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleBackground_Criminal"] = { tag_guid = "74ed9de3-fff5-419a-949b-18bd5e17944e", tag_notification =
        "criminal background tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleBackground_Entertainer"] = { tag_guid = "bd3cfefd-5fe2-47ea-bd3c-e99eaad9b714", tag_notification =
        "entertainer background tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleBackground_FolkHero"] = { tag_guid = "9c38904c-4aed-4d22-9038-fc7d103aaed5", tag_notification =
        "folk hero background tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleBackground_GuildArtisan"] = { tag_guid = "baf9fb0e-f535-40a0-bb78-3ec289d84e66", tag_notification =
        "guild artisan background tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleBackground_Hermit"] = { tag_guid = "2fa3f042-2b50-41b2-8045-39ddd4421ca9", tag_notification =
        "hermit background tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleBackground_Noble"] = { tag_guid = "56825486-9cfc-4ec2-87d1-c8065c41774b", tag_notification =
        "noble background tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleBackground_Outlander"] = { tag_guid = "d81df6f9-9f6e-4146-841a-9f285e6ee879", tag_notification =
        "outlander background tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleBackground_Sage"] = { tag_guid = "dad18490-c61d-4958-805c-f017eb68f8a0", tag_notification =
        "sage background tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleBackground_Soldier"] = { tag_guid = "d135f265-c2e1-4077-a836-b548ee871681", tag_notification =
        "soldier background tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleBackground_Urchin"] = { tag_guid = "2faee476-d77b-42a7-a4c6-2b9ac934673c", tag_notification =
        "urchin background tag", callback = UTSP_ToggleTag },

        -- Classes
        ["UTSP_Shout_ToggleClass_Barbarian"] = { tag_guid = "02913f9a-f696-40cf-acdf-32032afab32c", tag_notification =
        "barbarian class tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleClass_Bard"] = { tag_guid = "d93434bd-6b71-4789-b128-ee24156057cc", tag_notification =
        "bard class tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleClass_Druid"] = { tag_guid = "44ac4317-4d38-4d28-80e2-94024c6e42f0", tag_notification =
        "druid class tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleClass_Fighter"] = { tag_guid = "1ae7017c-4884-4a43-bc4a-742fa0d201c0", tag_notification =
        "fighter class tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleClass_Monk"] = { tag_guid = "1ae7017c-4884-4a43-bc4a-742fa0d201c0", tag_notification =
        "monk class tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleClass_Ranger"] = { tag_guid = "37a733c1-a862-4157-b92a-9cff46232c6a", tag_notification =
        "ranger class tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleClass_Rogue"] = { tag_guid = "f8a0608b-666c-4be6-a49c-03b369c10bd2", tag_notification =
        "rogue class tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleClass_Sorcerer"] = { tag_guid = "18266c0b-efbc-4c80-8784-ada4a37218d7", tag_notification =
        "sorcerer class tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleClass_Warlock"] = { tag_guid = "5804f55a-93f7-4281-9512-8d548a9e2a22", tag_notification =
        "warlock class tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleClass_Wizard"] = { tag_guid = "6fe3ae27-dc6c-4fc9-9245-710c790c396c", tag_notification =
        "wizard class tag", callback = UTSP_ToggleTag },

        -- Dialogue
        ["UTSP_Shout_ToggleDialogue_ComprehendLanguages"] = { tag_guid = "1d6e36a6-d757-449b-8040-2af3f1a99c3a", tag_notification =
        "comprehend languages tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleDialogue_DetectThoughts"] = { tag_guid = "7e0395f8-aa53-4549-9af3-e2d203d678ee", tag_notification =
        "detect thoughts tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleDialogue_ForbiddenKnowledge"] = { tag_guid = "673cb6af-f12b-4d6e-abfa-1bb83cf4ce44", tag_notification =
        "forbidden knowledge tag", callback = UTSP_ToggleTag },
        ["UTSP_Shout_ToggleDialogue_PetPal"] = { tag_guid = "dc860a81-f3c2-4c1a-ab90-e7583324845c", tag_notification =
        "pet pal tag", callback = UTSP_ToggleTag },

        -- Race
        ["UTSP_Shout_ToggleRace"] = { tag_guid = "", tag_notification = "", callback = "" }

        -- Religion
        ["UTSP_Shout_ToggleReligion_"] = { tag_guid = "", tag_notification = "", callback = "" }
        ["UTSP_Shout_ToggleReligion_Cleric_"] = { tag_guid = "", tag_notification = "", callback = "" }
        ["UTSP_Shout_ToggleReligion_Paladin_"] = { tag_guid = "", tag_notification = "", callback = "" }
    }

    if tagTable[spell] ~= nil then
        Ext.Utils.Print('spell: ', spell)
        tagTable[spell].callback(character, tagTable[spell].tag_guid, tagTable[spell].tag_notification)
    end
end)
