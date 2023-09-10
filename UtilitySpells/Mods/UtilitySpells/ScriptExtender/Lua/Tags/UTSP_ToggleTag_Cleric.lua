-- Specific functions for Cleric tags. We need to check other tags function to toggle tags
function UTSP_ToggleTag_Cleric_Good(character, tag_guid, tag_notification)
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
