
SMODS.Consumable {
    key = 'flouroantimonicacid',
    set = 'chemical',
    pos = { x = 1, y = 1 },
    config = { 
        extra = {
            dollars0 = 30   
        } 
    },
    loc_txt = {
        name = 'Flouroantimonic acid',
        text = {
            [1] = 'DESTROY YOUR ENTIRE HAND',
            [2] = 'gain 30$. Flouroantimonic',
            [3] = 'acid is the strongest acid',
            [4] = 'ever, around {C:red}-31{} ph.'
        }
    },
    cost = 6,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        local destroyed_cards = {}
        local temp_hand = {}
        
    for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
        table.sort(temp_hand,
            function(a, b)
                return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
            end
        )
        
        pseudoshuffle(temp_hand, 12345)
        
    for i = 1, 999 do destroyed_cards[#destroyed_cards + 1] = temp_hand[i] end
        
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(destroyed_cards)
        
        delay(0.5)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                
                local current_dollars = G.GAME.dollars
                local target_dollars = G.GAME.dollars + 30
                local dollar_value = target_dollars - current_dollars
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(30).." $", colour = G.C.RED})
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