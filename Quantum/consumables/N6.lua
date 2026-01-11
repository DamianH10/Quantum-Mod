
SMODS.Consumable {
    key = 'N6',
    set = 'chemical',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'Nitrogen 6',
        text = {
            [1] = 'select up to 6 cards and destroy them',
            [2] = 'BTW: N6 is a very unstable molecule and',
            [3] = 'only stable at {}-200C  for a few decades',
            [4] = 'and stores 2x the amount of energy',
            [5] = 'than Nitroglycerin, and decomposes only',
            [6] = 'to Nitrogen gas. Meaning it can be used',
            [7] = 'as clean explosives and maybe some sort',
            [8] = 'of fuel, as in contrast to other subst-',
            [9] = 'ances like Nitroglycerin decompose or',
            [10] = 'react to much more Poisonous compunds',
            [11] = 'which makes N6 a much cleaner alternative',
            [12] = 'as it only decomposes to harmless Nitrogen.'
        }
    },
    cost = 5,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        if to_big(#G.hand.highlighted) < to_big(7) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    SMODS.destroy_cards(G.hand.highlighted)
                    return true
                end
            }))
            delay(0.3)
        end
    end,
    can_use = function(self, card)
        return (to_big(#G.hand.highlighted) < to_big(7))
    end
}