@ These are event scripts. They should not be moved to C.

#include "constants/global.h"
#include "constants/flags.h"
#include "constants/moves.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/region_map_sections.h"
	.include "asm/macros.inc"
	.include "asm/macros/event.inc"
	.include "constants/constants.inc"

	.section .rodata
	
	.align 2
MysteryEventScript_StampCard::
	setvaddress MysteryEventScript_StampCard
	setorcopyvar VAR_RESULT, 1
	specialvar VAR_0x8008, GetMysteryGiftCardStat
	setorcopyvar VAR_RESULT, 0
	specialvar VAR_0x8009, GetMysteryGiftCardStat
	subvar VAR_0x8008, VAR_0x8009
	buffernumberstring STR_VAR_1, VAR_0x8008
	lock
	faceplayer
	vmessage sText_MysteryGiftStampCard
	waitmessage
	waitbuttonpress
	release
	end

sText_MysteryGiftStampCard:
	.string "STAMP KARTI Sistemini\n"
	.string "kullandığınız için teşekkür ederiz.\p"
	.string "STAMP KARTINIZI doldurmak için\n"
	.string "{STR_VAR_1} adet daha toplamanız\l"
	.string "gerekiyor.$"

MysteryEventScript_SurfPichu::
	setvaddress MysteryEventScript_SurfPichu
	vgoto_if_unset FLAG_MYSTERY_GIFT_DONE, SurfPichu_GiveIfPossible
	returnram

SurfPichu_GiveIfPossible:
	specialvar VAR_EVENT_PICHU_SLOT, CalculatePlayerPartyCount
	vgoto_if_eq VAR_EVENT_PICHU_SLOT, PARTY_SIZE, SurfPichu_FullParty
	setflag FLAG_MYSTERY_GIFT_DONE
	vcall SurfPichu_GiveEgg
	lock
	faceplayer
	vmessage sText_MysteryGiftEgg
	waitmessage
	waitbuttonpress
	playfanfare MUS_OBTAIN_ITEM
	waitfanfare
	release
	end

SurfPichu_FullParty:
	lock
	faceplayer
	vmessage sText_FullParty
	waitmessage
	waitbuttonpress
	release
	end

SurfPichu_GiveEgg:
	giveegg SPECIES_PICHU
	setmonmodernfatefulencounter VAR_EVENT_PICHU_SLOT
	setmonmetlocation VAR_EVENT_PICHU_SLOT, METLOC_FATEFUL_ENCOUNTER
	vgoto_if_eq VAR_EVENT_PICHU_SLOT, 1, SurfPichu_Slot1
	vgoto_if_eq VAR_EVENT_PICHU_SLOT, 2, SurfPichu_Slot2
	vgoto_if_eq VAR_EVENT_PICHU_SLOT, 3, SurfPichu_Slot3
	vgoto_if_eq VAR_EVENT_PICHU_SLOT, 4, SurfPichu_Slot4
	vgoto_if_eq VAR_EVENT_PICHU_SLOT, 5, SurfPichu_Slot5
	return

SurfPichu_Slot1:
	setmonmove 1, 2, MOVE_SURF
	return

SurfPichu_Slot2:
	setmonmove 2, 2, MOVE_SURF
	return

SurfPichu_Slot3:
	setmonmove 3, 2, MOVE_SURF
	return

SurfPichu_Slot4:
	setmonmove 4, 2, MOVE_SURF
	return

SurfPichu_Slot5:
	setmonmove 5, 2, MOVE_SURF
	return

sText_MysteryGiftEgg:
	.string "GİZEMLİ HEDİYE Sistemini\n"
	.string "kullandığınız için teşekkür ederiz.\p"
	.string "POKéMON MERKEZİ'nden size\n"
	.string "bir hediye - bir YUMURTA!\p"
	.string "Lütfen bunu sevgi ve\n"
	.string "nazla yetiştirin.$"

sText_FullParty:
	.string "Oh, takımınız dolu görünüyor.\p"
	.string "Lütfen bir POKéMON'u PC'ye\n"
	.string "depoladıktan sonra tekrar gelin.$"

MysteryEventScript_VisitingTrainer::
	setvaddress MysteryEventScript_VisitingTrainer
	special ValidateEReaderTrainer
	vgoto_if_eq VAR_RESULT, 0, MysteryEventScript_VisitingTrainerArrived
	lock
	faceplayer
	vmessage sText_MysteryGiftVisitingTrainer
	waitmessage
	waitbuttonpress
	release
	end

MysteryEventScript_VisitingTrainerArrived:
	lock
	faceplayer
	vmessage sText_MysteryGiftVisitingTrainer_2
	waitmessage
	waitbuttonpress
	release
	end

sText_MysteryGiftVisitingTrainer:
	.string "GİZEMLİ HEDİYE Sistemini\n"
	.string "kullandığınız için teşekkür ederiz.\p"
	.string "Bu HARİKA KART'ı tutarak,\n"
	.string "POKéMON MART'ta anketlere katıl.\p"
	.string "Bu anketleri kullanarak EĞİTMENLER\n"
	.string "SEVII ADALARI'na davet edebilirsin.\p"
	.string "…Size bir anket için gizli\n"
	.string "şifre vereyim:\p"
	.string "“BANA HARİKA\n"
	.string "EĞİTMEN VER”\p"
	.string "Bunu ankete yazın ve\n"
	.string "TELSİZ İLETİŞİM SİSTEMİ'ne gönderin.$"

sText_MysteryGiftVisitingTrainer_2:
	.string "GİZEMLİ HEDİYE Sistemini\n"
	.string "kullandığınız için teşekkür ederiz.\p"
	.string "SEVII ADALARI'na\n"
	.string "bir EĞİTMEN geldi ve sizi arıyor.\p"
	.string "Umarız ziyaret eden EĞİTMEN ile\n"
	.string "savaşmaktan keyif alırsınız.\p"
	.string "Diğer EĞİTMENLERİ davet etmek için\n"
	.string "diğer şifreleri deneyin.\p"
	.string "İşine yarayabilecek diğer şifreleri\n"
	.string "arama yapmayı deneyin.$"

MysteryEventScript_BattleCard::
	setvaddress MysteryEventScript_BattleCard
	vgoto_if_set FLAG_MYSTERY_GIFT_DONE, MysteryEventScript_BattleCardInfo
	setorcopyvar VAR_RESULT, 2
	specialvar VAR_0x8008, GetMysteryGiftCardStat
	vgoto_if_ne VAR_0x8008, 3, MysteryEventScript_BattleCardInfo
	lock
	faceplayer
	vmessage sText_MysteryGiftBattleCountCard_2
	waitmessage
	waitbuttonpress
	giveitem ITEM_POTION
	release
	setflag FLAG_MYSTERY_GIFT_DONE
	end

MysteryEventScript_BattleCardInfo:
	lock
	faceplayer
	vmessage sText_MysteryGiftBattleCountCard
	waitmessage
	waitbuttonpress
	release
	end

sText_MysteryGiftBattleCountCard:
	.string "GİZEMLİ HEDİYE Sistemini\n"
	.string "kullandığınız için teşekkür ederiz.\p"
	.string "BATTLE COUNT CARD'ınız\n"
	.string "aynı KARTA sahip EĞİTMENLERE karşı\l"
	.string "savaş kaydınızı takip eder.\l"
	.string "Sizinle aynı KARTA sahip EĞİTMENLERİ\n"
	.string "arayın ve onlarla savaşın.\p"
	.string "GENEL SIRALAMALARI HABERLERİ\n"
	.string "okuyarak kontrol edebilirsiniz.\p"
	.string "Lütfen denemeyi unutmayın!$"

sText_MysteryGiftBattleCountCard_2:
	.string "GİZEMLİ HEDİYE Sistemini\n"
	.string "kullandığınız için teşekkür ederiz.\p"
	.string "Tebrikler!\p"
	.string "Üç savaşı kazandığınız için bir\n"
	.string "ödül kazandınız!\p"
	.string "Biraz daha savaşmaya teşvik\n"
	.string "edileceğinizi umuyoruz.$"


MysteryEventScript_AuroraTicket::
	setvaddress MysteryEventScript_AuroraTicket
	lock
	faceplayer
	vgoto_if_set FLAG_RECEIVED_AURORA_TICKET, AuroraTicket_Obtained
	vgoto_if_set FLAG_FOUGHT_DEOXYS, AuroraTicket_Obtained
	checkitem ITEM_AURORA_TICKET, 1
	vgoto_if_eq VAR_RESULT, TRUE, AuroraTicket_Obtained
	vmessage sText_AuroraTicket1
	waitmessage
	waitbuttonpress
	checkitemspace ITEM_AURORA_TICKET, 1
	vgoto_if_eq VAR_RESULT, FALSE, AuroraTicket_NoBagSpace
	giveitem ITEM_AURORA_TICKET
	setflag FLAG_ENABLE_SHIP_BIRTH_ISLAND
	setflag FLAG_RECEIVED_AURORA_TICKET
	vmessage sText_AuroraTicket2
	waitmessage
	waitbuttonpress
	release
	end

AuroraTicket_NoBagSpace:
	vmessage sText_AuroraTicketNoPlace
	waitmessage
	waitbuttonpress
	release
	end

AuroraTicket_Obtained:
	vmessage sText_AuroraTicketGot
	waitmessage
	waitbuttonpress
	release
	end

sText_AuroraTicket1:
	.string "GİZEMLİ HEDİYE Sistemi\n"
	.string "kullandığınız için teşekkür ederiz.\p"
	.string "Siz {PLAYER} olmalısınız.\n"
	.string "Burada sizin için bir bilet var.$"

sText_AuroraTicket2:
	.string "Biletin VERMILION ŞEHİR limanında\n"
	.string "kullanılmak üzere olduğunu gösterir.\p"
	.string "Neden denemiyorsunuz ve ne olduğunu\n"
	.string "görmüyorsunuz?$"

sText_AuroraTicketGot:
	.string "GİZEMLİ HEDİYE Sistemi\n"
	.string "kullandığınız için teşekkür ederiz.$"

sText_AuroraTicketNoPlace:
	.string "Üzgünüm, {PLAYER}. ÇANTANIZIN\n"
	.string "ANA EŞYALAR CEBİ dolu.\p"
	.string "Lütfen bilgisayarınıza bir şeyler\n"
	.string "depolayın, sonra tekrar gelin.$"


MysteryEventScript_MysticTicket::
	setvaddress MysteryEventScript_MysticTicket
	lock
	faceplayer
	vgoto_if_set FLAG_RECEIVED_MYSTIC_TICKET, MysticTicket_Obtained
	vgoto_if_set FLAG_FOUGHT_LUGIA, MysticTicket_Obtained
	vgoto_if_set FLAG_FOUGHT_HO_OH, MysticTicket_Obtained
	checkitem ITEM_MYSTIC_TICKET, 1
	vgoto_if_eq VAR_RESULT, TRUE, MysticTicket_Obtained
	vmessage sText_MysticTicket2
	waitmessage
	waitbuttonpress
	checkitemspace ITEM_MYSTIC_TICKET, 1
	vgoto_if_eq VAR_RESULT, FALSE, MysticTicket_NoBagSpace
	giveitem ITEM_MYSTIC_TICKET
	setflag FLAG_ENABLE_SHIP_NAVEL_ROCK
	setflag FLAG_RECEIVED_MYSTIC_TICKET
	vmessage sText_MysticTicket1
	waitmessage
	waitbuttonpress
	release
	end

MysticTicket_NoBagSpace:
	vmessage sText_MysticTicketNoPlace
	waitmessage
	waitbuttonpress
	release
	end

MysticTicket_Obtained:
	vmessage sText_MysticTicketGot
	waitmessage
	waitbuttonpress
	release
	end

sText_MysticTicket2:
	.string "GİZEMLİ HEDİYE Sistemi\n"
	.string "kullandığınız için teşekkür ederiz.\p"
	.string "Siz {PLAYER} olmalısınız.\n"
	.string "Burada sizin için bir bilet var.$"

sText_MysticTicket1:
	.string "Biletin VERMILION ŞEHİR limanında\n"
	.string "kullanılmak üzere olduğunu gösterir.\p"
	.string "Neden denemiyorsunuz ve ne olduğunu\n"
	.string "görmüyorsunuz?$"

sText_MysticTicketGot:
	.string "GİZEMLİ HEDİYE Sistemi\n"
	.string "kullandığınız için teşekkür ederiz.$"

sText_MysticTicketNoPlace:
	.string "Üzgünüm, {PLAYER}. ÇANTANIZIN\n"
	.string "ANA EŞYALAR CEBİ dolu.\p"
	.string "Lütfen bilgisayarınıza bir şeyler\n"
	.string "depolayın, sonra tekrar gelin.$"


MysteryEventScript_AlteringCave::
	setvaddress MysteryEventScript_AlteringCave
	addvar VAR_ALTERING_CAVE_WILD_SET, 1
	vgoto_if_ne VAR_ALTERING_CAVE_WILD_SET, 10, MysteryEventScript_AlteringCave_
	setvar VAR_ALTERING_CAVE_WILD_SET, 0
MysteryEventScript_AlteringCave_:
	lock
	faceplayer
	vmessage sText_MysteryGiftAlteringCave
	waitmessage
	waitbuttonpress
	release
	end

sText_MysteryGiftAlteringCave:
	.string "GİZEMLİ HEDİYE sistemini\n"
	.string "kullandığınız için teşekkür ederiz.\p"
	.string "Son zamanlarda nadir POKéMON'ların\n"
	.string "göründüğü hakkında söylentiler var.\p"
	.string "Söylentiler DEĞİŞEN\n"
	.string "MAĞARA OUTCAST ADASI'da içeriyor.\p"
	.string "Neden orayı ziyaret etmiyorsunuz ve\n"
	.string "söylentilerin gerçekten doğru olup\l"
	.string "olmadığını kontrol etmiyorsunuz?$"

