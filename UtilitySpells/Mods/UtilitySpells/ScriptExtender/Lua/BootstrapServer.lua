Ext.Osiris.RegisterListener("ClearFlag", 3, "after", function (FLAG, GUIDSTRING, INTEGER)
	if FLAG == "GLO_SpeakWithDead_Event_QuestionAsked_9984cd59-2fad-46cb-bf61-96af6034fbea" then
		Osi.PROC_ObjectCountHelper(GUIDSTRING, "GLO_SpeakWithDead_QuestionCount", -1)
	end
end)

Ext.Osiris.RegisterListener("CastSpell", 5, "after", function (char, spell, nil1, nil2, nil3)
    ShowNotification(GetHostCharacter(), "Casted Spell") 
    if spell == "UTSP_Shout_ToggleDetectThoughts" then
        ShowNotification(GetHostCharacter(), "Casted ToggleDetectThoughts") 
        messageBox("MessageBox: Casted ToggleDetectThoughts")
        if Osi.IsTagged(GetHostCharacter(), "DETECTTHOUGHTS", 1) == true then
			Osi.ClearTag(GetHostCharacter(), "DETECTTHOUGHTS")
            ShowNotification(GetHostCharacter(), "You cannot detect thoughts in others anymore") 
        else
			Osi.SetTag(GetHostCharacter(), "DETECTTHOUGHTS")
            ShowNotification(GetHostCharacter(), "You can now detect thoughts in others") 
        end
    end
end)
