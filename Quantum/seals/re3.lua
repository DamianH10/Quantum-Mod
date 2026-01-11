
SMODS.Seal {
    key = 're3',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            retrigger_times0 = 3,
            retrigger_times = 3
        }
    },
    badge_colour = HEX('FFB347'),
    loc_txt = {
        name = 'Re: 3',
        label = 'Re: 3',
        text = {
            [1] = 'Retrigger Card trice'
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
            card.ability.seal.extra.retrigger_times = 3
        end
        if context.cardarea == G.hand and context.main_scoring then
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = 3
        end
    end
}