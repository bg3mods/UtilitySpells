Ext.Osiris.RegisterListener("ClearFlag", 3, "after", function(FLAG, GUIDSTRING, INTEGER)
    if FLAG == "GLO_SpeakWithDead_Event_QuestionAsked_9984cd59-2fad-46cb-bf61-96af6034fbea" then
        Osi.PROC_ObjectCountHelper(GUIDSTRING, "GLO_SpeakWithDead_QuestionCount", -1)
    end
end)

Ext.Osiris.RegisterListener("CastSpell", 5, "after", function(char, spell, nil1, nil2, nil3)
    local DETECTTHOUGHS = "7e0395f8-aa53-4549-9af3-e2d203d678ee"
    if spell == "UTSP_Shout_ToggleDetectThoughts" then
        if Osi.IsTagged(GetHostCharacter(), DETECTTHOUGHS) == 1 then
            Osi.ClearTag(GetHostCharacter(), DETECTTHOUGHS)
            ShowNotification(GetHostCharacter(), "You cannot detect thoughts in others anymore")
        else
            Osi.SetTag(GetHostCharacter(), DETECTTHOUGHS)
            ShowNotification(GetHostCharacter(), "You can detect thoughts in others")
        end
    end
end)
