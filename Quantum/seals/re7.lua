
SMODS.Seal {
    key = 're7',
    pos = { x = 6, y = 0 },
    config = {
        extra = {
            retrigger_times0 = 7,
            retrigger_times = 7
        }
    },
    badge_colour = HEX('4ECDC4'),
    loc_txt = {
        name = 'Re: 7',
        label = 'Re: 7',
        text = {
            [1] = 'Retrigger Card 7 Times'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = false,
    no_collection = false,
    sound = { sound = "multhit1", per = 1.2, vol = 0.4 },
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = 7
        end
        if context.cardarea == G.hand and context.main_scoring then
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = 7
        end
    end
}