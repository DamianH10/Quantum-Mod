
SMODS.Consumable {
    key = 'lambda',
    set = '_subatomic_particle',
    pos = { x = 1, y = 0 },
    loc_txt = {
        name = 'Lambda',
        text = {
            [1] = '{C:dark_edition}INCREASE THE JOKER LIMIT BY 1{}'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Joker Slot", colour = G.C.DARK_EDITION})
                G.jokers.config.card_limit = G.jokers.config.card_limit + 1
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}