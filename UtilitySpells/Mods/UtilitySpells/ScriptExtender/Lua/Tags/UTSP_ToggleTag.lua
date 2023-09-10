-- Generic function to toggle tags
function UTSP_ToggleTags(character, tag_guids, tag_notification)
    local character_string = "" .. character
    local add_notification = "You have a new ability: " .. tag_notification
    local remove_notification = "You have lost an ability: " .. tag_notification

    if TAG_UTILS.HallAllTags(character, tag_guids) then
        Osi.ClearTag(character, tag_guids)
        Osi.ShowNotification(character_string, remove_notification)
    else
        Osi.SetTag(character, tag_guids)
        Osi.ShowNotification(character_string, add_notification)
    end
end
