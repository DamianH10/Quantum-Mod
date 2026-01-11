
SMODS.Voucher {
    key = 'recycle',
    pos = { x = 2, y = 0 },
    config = { 
        extra = {
            dollars0 = 4
        } 
    },
    loc_txt = {
        name = 'Recycle',
        text = {
            [1] = 'When a Booster-Pack',
            [2] = 'is skipped get {C:money}4${} back'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'CustomVouchers',
    calculate = function(self, card, context)
        if context.skipping_booster then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 4
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value, true)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+"..tostring(4), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}