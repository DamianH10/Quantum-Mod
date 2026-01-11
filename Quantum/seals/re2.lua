
SMODS.Seal {
    key = 're2',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            retrigger_times0 = 2,
            retrigger_times = 2
        }
    },
    badge_colour = HEX('DC143C'),
    loc_txt = {
        name = 'Re: 2',
        label = 'Re: 2',
        text = {
            [1] = 'Retrigger Card twice'
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
            card.ability.seal.extra.retrigger_times = 2
        end
        if context.cardarea == G.hand and context.main_scoring then
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = 2
        end
    end
}