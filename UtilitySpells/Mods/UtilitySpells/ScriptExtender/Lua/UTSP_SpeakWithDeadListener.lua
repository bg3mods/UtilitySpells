Ext.Osiris.RegisterListener("ClearFlag", 3, "after", function(FLAG, GUIDSTRING, INTEGER)
    if FLAG == "GLO_SpeakWithDead_Event_QuestionAsked_9984cd59-2fad-46cb-bf61-96af6034fbea" then
        Osi.PROC_ObjectCountHelper(GUIDSTRING, "GLO_SpeakWithDead_QuestionCount", -1)
    end
end)
