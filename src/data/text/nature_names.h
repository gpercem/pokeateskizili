#if ENG_MOVES==1
static const u8 sHardyNatureName[] = _("HARDY");
static const u8 sLonelyNatureName[] = _("LONELY");
static const u8 sBraveNatureName[] = _("BRAVE");
static const u8 sAdamantNatureName[] = _("ADAMANT");
static const u8 sNaughtyNatureName[] = _("NAUGHTY");
static const u8 sBoldNatureName[] = _("BOLD");
static const u8 sDocileNatureName[] = _("DOCILE");
static const u8 sRelaxedNatureName[] = _("RELAXED");
static const u8 sImpishNatureName[] = _("IMPISH");
static const u8 sLaxNatureName[] = _("LAX");
static const u8 sTimidNatureName[] = _("TIMID");
static const u8 sHastyNatureName[] = _("HASTY");
static const u8 sSeriousNatureName[] = _("SERIOUS");
static const u8 sJollyNatureName[] = _("JOLLY");
static const u8 sNaiveNatureName[] = _("NAIVE");
static const u8 sModestNatureName[] = _("MODEST");
static const u8 sMildNatureName[] = _("MILD");
static const u8 sQuietNatureName[] = _("QUIET");
static const u8 sBashfulNatureName[] = _("BASHFUL");
static const u8 sRashNatureName[] = _("RASH");
static const u8 sCalmNatureName[] = _("CALM");
static const u8 sGentleNatureName[] = _("GENTLE");
static const u8 sSassyNatureName[] = _("SASSY");
static const u8 sCarefulNatureName[] = _("CAREFUL");
static const u8 sQuirkyNatureName[] = _("QUIRKY");

#else
static const u8 sHardyNatureName[] = _("SAĞLAM");
static const u8 sLonelyNatureName[] = _("YALNIZ");
static const u8 sBraveNatureName[] = _("CESUR");
static const u8 sAdamantNatureName[] = _("ISRARCI");
static const u8 sNaughtyNatureName[] = _("HAYLAZ");
static const u8 sBoldNatureName[] = _("GÖZÜPEK");
static const u8 sDocileNatureName[] = _("UYSAL");
static const u8 sRelaxedNatureName[] = _("RAHAT");
static const u8 sImpishNatureName[] = _("YARAMAZ");
static const u8 sLaxNatureName[] = _("GEVŞEK");
static const u8 sTimidNatureName[] = _("ÇEKİNGEN");
static const u8 sHastyNatureName[] = _("ACELECİ");
static const u8 sSeriousNatureName[] = _("CİDDİ");
static const u8 sJollyNatureName[] = _("NEŞELİ");
static const u8 sNaiveNatureName[] = _("SAF");
static const u8 sModestNatureName[] = _("MÜTEVAZI");
static const u8 sMildNatureName[] = _("YUMUŞAK");
static const u8 sQuietNatureName[] = _("SESSİZ");
static const u8 sBashfulNatureName[] = _("UTANGAÇ");
static const u8 sRashNatureName[] = _("SABIRSIZ");
static const u8 sCalmNatureName[] = _("SAKİN");
static const u8 sGentleNatureName[] = _("NAZİK");
static const u8 sSassyNatureName[] = _("ŞIMARIK");
static const u8 sCarefulNatureName[] = _("TEDBİRLİ");
static const u8 sQuirkyNatureName[] = _("TUTARSIZ");
#endif

const u8 *const gNatureNamePointers[NUM_NATURES] = {
    [NATURE_HARDY] = sHardyNatureName,
    [NATURE_LONELY] = sLonelyNatureName,
    [NATURE_BRAVE] = sBraveNatureName,
    [NATURE_ADAMANT] = sAdamantNatureName,
    [NATURE_NAUGHTY] = sNaughtyNatureName,
    [NATURE_BOLD] = sBoldNatureName,
    [NATURE_DOCILE] = sDocileNatureName,
    [NATURE_RELAXED] = sRelaxedNatureName,
    [NATURE_IMPISH] = sImpishNatureName,
    [NATURE_LAX] = sLaxNatureName,
    [NATURE_TIMID] = sTimidNatureName,
    [NATURE_HASTY] = sHastyNatureName,
    [NATURE_SERIOUS] = sSeriousNatureName,
    [NATURE_JOLLY] = sJollyNatureName,
    [NATURE_NAIVE] = sNaiveNatureName,
    [NATURE_MODEST] = sModestNatureName,
    [NATURE_MILD] = sMildNatureName,
    [NATURE_QUIET] = sQuietNatureName,
    [NATURE_BASHFUL] = sBashfulNatureName,
    [NATURE_RASH] = sRashNatureName,
    [NATURE_CALM] = sCalmNatureName,
    [NATURE_GENTLE] = sGentleNatureName,
    [NATURE_SASSY] = sSassyNatureName,
    [NATURE_CAREFUL] = sCarefulNatureName,
    [NATURE_QUIRKY] = sQuirkyNatureName,
};
