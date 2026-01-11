
SMODS.Seal {
    key = 're10',
    pos = { x = 9, y = 0 },
    config = {
        extra = {
            retrigger_times0 = 10,
            retrigger_times = 10
        }
    },
    badge_colour = HEX('8A2BE2'),
    loc_txt = {
        name = 'Re: 10',
        label = 'Re: 10',
        text = {
            [1] = 'Retrigger Card {X:legendary,C:white}10{} Times'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = false,
    no_collection = false,
    sound = { sound = "multhit2", per = 1.2, vol = 0.4 },
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = 10
        end
        if context.cardarea == G.hand and context.main_scoring then
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = 10
        end
    end
}