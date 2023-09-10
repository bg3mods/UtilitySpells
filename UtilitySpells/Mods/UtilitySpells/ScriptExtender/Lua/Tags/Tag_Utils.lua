TAG_UTILS = {
    HallAllTags = function(character, tags)
        for _, tag in ipairs(tags) do
            if Osi.IsTagged(character, tag) ~= 1 then
                return false
            end
        end
        return true
    end,
    HasAnyTag = function(character, tags)
        for _, tag in ipairs(tags) do
            if Osi.IsTagged(character, tag) == 1 then
                return true
            end
        end
        return false
    end,
    HasTag = function(character, tag)
        return Osi.IsTagged(character, tag) == 1
    end,
}
