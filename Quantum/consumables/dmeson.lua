
SMODS.Consumable {
    key = 'dmeson',
    set = '_subatomic_particle',
    pos = { x = 3, y = 0 },
    config = { 
        extra = {
            currentmoney = 0   
        } 
    },
    loc_txt = {
        name = 'D-Meson',
        text = {
            [1] = 'Double your Money',
            [2] = 'with {X:red,C:white}NO{} CAP'
        }
    },
    cost = 4,
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
                
                local current_dollars = G.GAME.dollars
                local target_dollars = G.GAME.dollars + G.GAME.dollars
                local dollar_value = target_dollars - current_dollars
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(G.GAME.dollars).." $", colour = G.C.RED})
                ease_dollars(dollar_value, true)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}