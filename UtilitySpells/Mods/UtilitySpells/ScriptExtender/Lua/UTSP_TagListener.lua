-- Listen to spell casting. If the spell's name is in the table, call the corresponding callback function
Ext.Osiris.RegisterListener("CastSpell", 5, "after", function(char, spell, nil1, nil2, nil3)
    local character = GetHostCharacter();
    local tagTable = {
        -- Backgrounds
        ["UTSP_Shout_ToggleBackground_Acolyte"] = { tag_guids = { TAGS.BACKGROUNDS.ACOLYTE.GUID }, tag_notification =
        "acolyte background tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleBackground_Charlatan"] = { tag_guids = { TAGS.BACKGROUNDS.CHARLATAN.GUID }, tag_notification =
        "charlatan background tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleBackground_Criminal"] = { tag_guids = { TAGS.BACKGROUNDS.CRIMINAL.GUID }, tag_notification =
        "criminal background tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleBackground_Entertainer"] = { tag_guids = { TAGS.BACKGROUNDS.ENTERTAINER.GUID }, tag_notification =
        "entertainer background tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleBackground_FolkHero"] = { tag_guids = { TAGS.BACKGROUNDS.FOLK_HERO.GUID }, tag_notification =
        "folk hero background tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleBackground_GuildArtisan"] = { tag_guids = { TAGS.BACKGROUNDS.GUILD_ARTISAN.GUID }, tag_notification =
        "guild artisan background tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleBackground_Hermit"] = { tag_guids = { TAGS.BACKGROUNDS.HERMIT.GUID }, tag_notification =
        "hermit background tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleBackground_Noble"] = { tag_guids = { TAGS.BACKGROUNDS.NOBLE.GUID }, tag_notification =
        "noble background tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleBackground_Outlander"] = { tag_guids = { TAGS.BACKGROUNDS.OUTLANDER.GUID }, tag_notification =
        "outlander background tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleBackground_Sage"] = { tag_guids = { TAGS.BACKGROUNDS.SAGE.GUID }, tag_notification =
        "sage background tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleBackground_Soldier"] = { tag_guids = { TAGS.BACKGROUNDS.SOLDIER.GUID }, tag_notification =
        "soldier background tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleBackground_Urchin"] = { tag_guids = { TAGS.BACKGROUNDS.URCHIN.GUID }, tag_notification =
        "urchin background tag", callback = UTSP_ToggleTags },
        -- Classes
        ["UTSP_Shout_ToggleClass_Barbarian"] = { tag_guids = { TAGS.CLASSES.BARBARIAN.GUID,
            TAGS.CLASSES.BARBARIAN_BERSERKER.GUID }, tag_notification =
        "barbarian class tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleClass_Bard"] = { tag_guids = { TAGS.CLASSES.BARD.GUID }, tag_notification =
        "bard class tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleClass_Druid"] = { tag_guids = { TAGS.CLASSES.DRUID.GUID }, tag_notification =
        "druid class tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleClass_Fighter"] = { tag_guids = { TAGS.CLASSES.FIGHTER.GUID }, tag_notification =
        "fighter class tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleClass_Monk"] = { tag_guids = { TAGS.CLASSES.MONK.GUID }, tag_notification =
        "monk class tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleClass_Ranger_Beastmaster"] = { tag_guids = { TAGS.CLASSES.RANGER.GUID,
            TAGS.CLASSES.RANGER_BEASTMASTER.GUID }, tag_notification =
        "ranger class tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleClass_Ranger_GloomStalker"] = { tag_guids = { TAGS.CLASSES.RANGER.GUID,
            TAGS.CLASSES.RANGER_GLOOMSTALKER.GUID }, tag_notification =
        "ranger class tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleClass_Ranger_Hunter"] = { tag_guids = { TAGS.CLASSES.RANGER.GUID,
            TAGS.CLASSES.RANGER_HUNTER.GUID }, tag_notification =
        "ranger class tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleClass_Rogue"] = { tag_guids = { TAGS.CLASSES.ROGUE.GUID }, tag_notification =
        "rogue class tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleClass_Sorcerer_Draconic"] = { tag_guids = { TAGS.CLASSES.SORCERER.GUID,
            TAGS.CLASSES.SORCERER_DRACONIC.GUID }, tag_notification =
        "sorcerer class tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleClass_Sorcerer_WildMagic"] = { tag_guids = { TAGS.CLASSES.SORCERER.GUID,
            TAGS.CLASSES.SORCERER_WILDMAGIC.GUID }, tag_notification =
        "sorcerer class tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleClass_Warlock_Archfey"] = { tag_guids = { TAGS.CLASSES.WARLOCK.GUID,
            TAGS.CLASSES.WARLOCK_ARCHFEY.GUID }, tag_notification = "warlock class tag", callback =
            UTSP_ToggleTags },
        ["UTSP_Shout_ToggleClass_Warlock_Fiend"] = { tag_guids = { TAGS.CLASSES.WARLOCK.GUID,
            TAGS.CLASSES.WARLOCK_FIEND.GUID }, tag_notification = "warlock class tag", callback =
            UTSP_ToggleTags },
        ["UTSP_Shout_ToggleClass_Warlock_GreatOldOne"] = { tag_guids = { TAGS.CLASSES.WARLOCK.GUID,
            TAGS.CLASSES.WARLOCK_GREATOLDONE.GUID }, tag_notification =
        "warlock class tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleClass_Wizard"] = { tag_guids = { TAGS.CLASSES.WIZARD.GUID }, tag_notification =
        "wizard class tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleClass_Wizard_Necromancy"] = { tag_guids = { TAGS.CLASSES.WIZARD.GUID,
            TAGS.CLASSES.WIZARD_NECROMANCY.GUID }, tag_notification = "wizard class tag", callback = UTSP_ToggleTags },
        -- Classes - Cleric
        -- Classes - Paladin

        -- Dialogue
        ["UTSP_Shout_ToggleDialogue_ComprehendLanguages"] = { tag_guids = { TAGS }, tag_notification =
        "comprehend languages tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleDialogue_DetectThoughts"] = { tag_guids = { TAGS }, tag_notification =
        "detect thoughts tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleDialogue_ForbiddenKnowledge"] = { tag_guids = { TAGS }, tag_notification =
        "forbidden knowledge tag", callback = UTSP_ToggleTags },
        ["UTSP_Shout_ToggleDialogue_PetPal"] = { tag_guids = { TAGS }, tag_notification =
        "pet pal tag", callback = UTSP_ToggleTags },

        -- Race
        ["UTSP_Shout_ToggleRace"] = { tag_guids = "", tag_notification = "", callback = "" },

        -- Religion
        ["UTSP_Shout_ToggleReligion_"] = { tag_guids = "", tag_notification = "", callback = "" },
        ["UTSP_Shout_ToggleReligion_Cleric_"] = { tag_guids = "", tag_notification = "", callback = "" },
        ["UTSP_Shout_ToggleReligion_Paladin_"] = { tag_guids = "", tag_notification = "", callback = "" },
    }

    if tagTable[spell] ~= nil then
        Ext.Utils.Print('spell: ', spell)
        tagTable[spell].callback(character, tagTable[spell].tag_guids, tagTable[spell].tag_notification)
    end
end)
