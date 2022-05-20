
# initialize and import ---------------------------------------------------

# clear working space
rm(list = ls())

# library
library(tidyverse)
library(writexl)


# define dictionaries -----------------------------------------------------

# access to mental health and substance abuse services
mh_sa_access <- c(
  "access to social service", "access to service", "access to substance abuse", "access to drug", "access to addiction", "access to alcohol treatment", "access to behavior", "access to behaviour", "access to mental health", "access to psych", "access to rehab", "access to treatment", "access to clinic", "rehabilitation program", "rehabilitation service", "rehabilitation clinic", "rehabilitation center", "rehabilitation centre", "rehabilitation facilit", "service utilization", "mental healthcare", "mental health care", "mental health outreach", "mental health program", "mental health treatment", "mental health intervention", "mental health service", "health provider", "mental health clinic", "addiction care", "addiction outreach", "addiction program", "addiction treatment", "addiction intervention", "addiction service", "addiction clinic", "addiction center", "addiction centre", "addiction facilit", "substance abuse care", "substance abuse outreach", "substance abuse program", "substance abuse treatment", "substance abuse intervention", "substance abuse service", "substance abuse provider", "substance abuse clinic", "substance abuse center", "substance abuse centre", "substance abuse facilit", "psychological care", "psychological outreach", "psychological program", "psychological treatment", "psychological intervention", "psychological service", "behavioral care", "behavioral program", "behavioral treatment", "behavioral intervention", "behavioral service", "behavioural care", "behavioural program", "behavioural treatment", "behavioural intervention", "behavioural service", "behavioral health care", "behavioral healthcare", "behavioral health program", "behavioral health treatment", "behavioral health intervention", "behavioral health service", "behavioral health clinic", "behavioural health care", "behavioural healthcare", "behavioural health program", "behavioural health treatment", "behavioural health intervention", "behavioural health service", "behavioural health clinic", "social service", "health insurance", "medical insurance", "counselor", "therapist", "school psychologist", "social worker", "continuity of care", "child health care", "child healthcare", "school clinic", "community clinic", "health clinic", "treatment program", "treatment program", "treatment service", "treatment center", "treatment centre", "treatment facilit", "health center", "health centre", "health facilit", "healthcare clinic", "healthcare center", "healthcare centre", "healthcare facilit", "health care clinic", "health care center", "health care centre", "health care facilit", "health resource", "prenatal screening", "prenatal care", "pre-natal screening", "pre-natal care", "health screen", "substance abuse screen", "psychological screen", "health assessment", "substance abuse assessment", "psychological assessment", "respite care", "health professional shortage"
)

# adequate housing
adequate_housing <- c(
  "adequate housing", "adequate home", "adequate house", "stable housing", "stable home", "stable house", "proper housing", "proper home", "proper house", "permanent housing", "permanent home", "permanent house", "safe housing", "safe home", "safe house", "suitable housing", "suitable home", "suitable house", "living conditions", "housing security"
)

# association with delinquent peers
delinquent_peers <- c(
  "delinquent peer", "antisocial peer", "anti-social peer", "criminal peer", "aggressive peer", "violent peer", "delinquent friend", "antisocial friend", "anti-social friend", "criminal friend", "aggressive friend", "violent friend", "peer group", "peer pressure", "bully", "bullies"
)

# association with pro-social peers
prosocial_peers <- c(
  "prosocial peer", "prosocial friend", "pro-social peer", "pro-social friend", "positive peer", "positive friend", "responsible peer", "responsible friend", "non-deviant peer", "non-deviant friend", "nonviolent friend", "non-violent friend", "nonviolent peer", "non-violent peer", "good friend", "bystander", "by-stander", "friendship quality"
)

# built environment
built_environment <- c(
  "crosswalk", "traffic volume", "access to recreation", "recreation access", "access to play", "stop sign", "traffic signal", "urban", "urbanicity", "rural", "rurality", "population density", "built environment", "complete streets", "road construction", "traffic congestion", "visibility", "lighting", "public art", "green space", "greening"
)

# bystander intervention skills
bystander_intervention <- c(
  "bystander", "bystander interven", "bystander intervention skills", "interven", "intervention skills", "bystander involv", "willingness to intervene"
)

# caring adults outside the family who can serve as role models or mentors
caring_adults <- c(
  "community connect", "community support", "supportive community", "sense of community", "neighbor connect",  "neighborhood connect", "neighbourhood connect", "neighbor support",  "neighborhood support", "neighbourhood support", "supportive community", "supportive neighbor", "supportive neighborhood", "supportive neighbourhood", "social support", "socially support", "social cohes", "social action", "social involv", "social service", "sense of belong", "sense of support", "friendship ties", "willingness to intervene", "sociability", "volunteerism", "intergenerational connect", "inter-generational connect", "mutual trust", "mentor", "role-model", "role model", "caring adult", "caring guardian", "caring teacher", "caring coach", "supportive adult", "supportive guardian", "supportive teacher", "supportive coach", "loving adult", "loving guardian", "loving teacher", "loving coach", "positive adult", "positive guardian", "positive teacher", "positive coach", "adult support", "guardian support", "teacher support", "coach support", "adult's support", "guardian's support", "teacher's support", "coach's support", "adult connect", "guardian connect", "teacher connect", "coach connect", "adult involve", "guardian involve", "teacher involve", "coach involve", "connectedness to adult", "prosocial adult", "pro-social adult", "prosocial guardian", "pro-social guardian", "prosocial teacher", "pro-social teacher", "prosocial coach", "pro-social coach", "attachment to adult", "attachment to guardian", "attachment to teacher", "attachment to coach"
)

# child has special needs that may increase caregiver burden (e.g., disabilities, mental health issues, and chronic physical illness)
special_needs <- c(
  "child disab", "childhood disab", "special need", "special needs child", "disabled child", "chronic illness", "chronic physical illness", "mental health", "disabilities", "disable", "disability"
)

# communities that support parents and take responsibility for preventing abuse
community_support_parents <- c(
  "community connect", "community support", "community cohes", "community action", "community involv", "community service", 
  "community participation", "community ties", "community network", "community engag", "community interaction", "community identity", 
  "community function", "community trust", "community stability", "community action", "community partner", "community monitoring", 
  "community integration", "community watch", "supportive community", "sense of community", "neighbor connect",  "neighborhood connect", 
  "neighbourhood connect", "neighbor support",  "neighborhood support", "neighbourhood support", "neighbor cohes", "neighborhood cohes", 
  "neighbourhood cohes", "neighborhood action", "neighbourhood action", "neighbor involv", "neighborhood involv", "neighbourhood involv", 
  "neighborhood service", "neighbourhood service", "neighbor participation", "neighborhood participation", "neighbourhood participation", 
  "neighbor ties", "neighborhood ties", "neighbourhood ties", "neighbor network", "neighborhood network", "neighbourhood network", 
  "neighbor engag",  "neighborhood engag", "neighbourhood engag", "neighbor interaction", "neighborhood interaction", "neighbourhood interaction", 
  "neighborhood identity", "neighbourhood identity", "neighborhood function", "neighbourhood function", "neighborhood trust", "neighbourhood trust", 
  "neighborhood stability", "neighbourhood stability", "neighborhood partner", "neighbourhood partner", "neighborhood watch", 
  "neighborhood monitoring", "neighbourhood monitoring", "neighborhood integration", "neighbourhood integration", "neighbourhood watch", 
  "resident connect", "resident support", "resident cohes", "resident action", "resident involv", "resident service", "resident participation", 
  "resident ties", "resident network", "resident engag", "resident interaction", "resident trust", "resident stability", "resident action", 
  "supportive community", "supportive neighbor", "supportive neighborhood", "supportive neighbourhood", "group connect", "group support", 
  "group cohes", "group support", "support group", "group involv", "social connect", "social support", "socially support", "social cohes", 
  "social action", "social involv", "social service", "social participation", "social ties", "social engag", "social interaction", "social trust", 
  "social functionality", "social action", "social partnership", "social monitoring", "social control", "social capital", "social network", 
  "social integration", "social organization", "sense of belong", "sense of support", "residential stability", "residential cohes", 
  "residential action", "residential integration", "collective efficacy", "civic engage", "civic duty", "civic involve", "civic organiz", 
  "civic group", "civic participation", "reciprocated exchange", "religiosity", "friendship ties", "willingness to intervene", "sociability", 
  "volunteerism", "intergenerational connect", "inter-generational connect", "mutual trust", "bystander", "bystander interven", 
  "bystander intervention skills", "interven", "intervention skills", "bystander involv", "mentor", "role-model", "role model", "caring adult", 
  "caring grandparent", "caring guardian", "caring teacher", "caring coach", "supportive adult", "supportive grandparent", "supportive guardian", 
  "supportive teacher", "supportive coach", "loving adult", "loving grandparent", "loving guardian", "loving teacher", "loving coach", 
  "positive adult", "positive grandparent", "positive guardian", "positive teacher", "positive coach", "adult support", "grandparent support", 
  "guardian support", "teacher support", "coach support", "adult's support", "grandparent's support", "guardian's support", "teacher's support", 
  "coach's support", "adult connect", "grandparent connect", "guardian connect", "teacher connect", "coach connect", "adult involve", 
  "grandparent involve", "guardian involve", "teacher involve", "coach involve", "teacher-pupil relation", "teacher-student relation", 
  "teacher-pupil connect", "teacher-student connect", "connectedness to adult", "prosocial adult", "pro-social adult", "prosocial parent", 
  "pro-social parent", "prosocial grandparent", "pro-social grandparent", "prosocial guardian", "pro-social guardian", "prosocial teacher", 
  "pro-social teacher", "prosocial coach", "pro-social coach", "attachment to adult", "attachment to grandparent", "attachment to guardian", 
  "attachment to teacher", "attachment to coach"
)

# community support and connectedness
community_support <- c(
  "community connect", "community support", "community cohes", "community action", "community involv", "community service", "community participation", "community ties", "community network", "community engag", "community interaction", "community identity", "community function", "community trust", "community stability", "community action", "community partner", "community monitoring", "community integration", "community watch", "supportive community", "sense of community", "neighbor connect",  "neighborhood connect", "neighbourhood connect", "neighbor support",  "neighborhood support", "neighbourhood support", "neighbor cohes", "neighborhood cohes", "neighbourhood cohes", "neighborhood action", "neighbourhood action", "neighbor involv", "neighborhood involv", "neighbourhood involv", "neighborhood service", "neighbourhood service", "neighbor participation", "neighborhood participation", "neighbourhood participation", "neighbor ties", "neighborhood ties", "neighbourhood ties", "neighbor network", "neighborhood network", "neighbourhood network", "neighbor engag",  "neighborhood engag", "neighbourhood engag", "neighbor interaction", "neighborhood interaction", "neighbourhood interaction", "neighborhood identity", "neighbourhood identity", "neighborhood function", "neighbourhood function", "neighborhood trust", "neighbourhood trust", "neighborhood stability", "neighbourhood stability", "neighborhood partner", "neighbourhood partner", "neighborhood watch", "neighborhood monitoring", "neighbourhood monitoring", "neighborhood integration", "neighbourhood integration", "neighbourhood watch", "resident connect", "resident support", "resident cohes", "resident action", "resident involv", "resident service", "resident participation", "resident ties", "resident network", "resident engag", "resident interaction", "resident trust", "resident stability", "resident action", "supportive community", "supportive neighbor", "supportive neighborhood", "supportive neighbourhood", "group connect", "group support", "group cohes", "group support", "support group", "group involv", "social connect", "social support", "socially support", "social cohes", "social action", "social involv", "social service", "social participation", "social ties", "social engag", "social interaction", "social trust", "social functionality", "social action", "social partnership", "social monitoring", "social control", "social capital", "social network", "social integration", "social organization", "sense of belong", "sense of support", "residential stability", "residential cohes", "residential action", "residential integration", "collective efficacy", "civic engage", "civic duty", "civic involve", "civic organiz", "civic group", "civic participation", "reciprocated exchange", "religiosity", "friendship ties", "willingness to intervene", "sociability", "volunteerism", "intergenerational connect", "inter-generational connect", "mutual trust"
)

# community violence
community_violence <- c(
  "violen", "firearm", "gun", "weapon", "shooting", "assault", "murder", "murder-suicide", "homicid", "infanticide", "femicide"
)

# concrete support for basic needs
basic_needs <- c(
  "needs met", "basic needs", "access to social service", "access to service", "social service", "social support", "service coordinat", "service integrat", "service connect", "service link", "resource coordinat", "resource integrat", "resource connect", "resource link", "care coordinat", "care integrat", "care connect", "care link", "treatment coordinat", "treatment integrat", "treatment connect", "treatment link", "coordinated care", "coordination of care", "coordinated service", "coordination of service", "coordinated resource", "coordination of resource", "coordinated treatment", "coordination of treatment", "coordinated communit", "coordination of communit",  "coordination among communit", "coordinated system", "integrated care", "integration of care", "integrated service", "integration of service", "integrated resource", "integration of resource", "integrated treatment", "integration of treatment", "integrated communit", "integration of communit", "integration among communit", "integrated system", "comprehensive care", "comprehensive service", "comprehensive treatment", "comprehensive community", "responsive care", "responsiveness of care", "responsive service", "responsiveness of service", "responsive communit", "responsiveness of communit", "responsive system", "responsiveness of system", "multifaceted care", "multifaceted service", "multifaceted treatment", "multifaceted communit", "multifaceted system", "case manage", "referral", "wrap-around", "wrap around", "linkage to care", "linkage to service", "linkage to treatment", "cross-sector", "cross sector", "multi-agency", "multi agency", "service system", "community capacity"
)

# connection to a caring adults
adult_connection <- c(
  "mentor", "role-model", "role model", "caring adult", "caring grandparent",  "caring guardian", "caring teacher", "caring coach", "supportive adult", "supportive grandparent", "supportive guardian", "supportive teacher", "supportive coach", "loving adult", "loving grandparent", "loving guardian", "loving teacher", "loving coach", "positive adult", "positive grandparent", "positive guardian", "positive teacher", "positive coach", "adult support", "grandparent support", "guardian support", "teacher support", "coach support", "adult's support", "grandparent's support", "guardian's support", "teacher's support", "coach's support", "adult connect", "grandparent connect", "guardian connect", "teacher connect", "coach connect", "adult involve", "grandparent involve", "guardian involve", "teacher involve", "coach involve", "teacher-pupil relation", "teacher-student relation", "teacher-pupil connect", "teacher-student connect", "connectedness to adult", "prosocial adult", "pro-social adult", "prosocial parent", "pro-social parent", "prosocial grandparent", "pro-social grandparent", "prosocial guardian", "pro-social guardian", "prosocial teacher", "pro-social teacher", "prosocial coach", "pro-social coach", "attachment to adult", "attachment to grandparent", "attachment to guardian", "attachment to teacher", "attachment to coach"
)

# connection/commitment to school
school_connection <- c(
  "school connect", "school cohes", "school commit", "school engag", "school involvement", "school participation", "school attitude", "school relation", "school investment", "school adjust", "school success", "school support", "school attach", "school bond", "school belong", "school enviro", "school importan", "student connect", "student cohes", "student commit", "student engag", "student involvement", "student participation", "student attitude", "student investment", "student adjust", "student support", "student attach", "student bond", "student belong", "pupil connect", "pupil cohes", "pupil commit", "pupil engag", "pupil involvement", "pupil participation", "pupil attitude", "pupil investment", "pupil adjust", "pupil support", "pupil attach", "pupil bond", "pupil belong", "teacher connect", "teacher investment", "teacher support", "teacher attach", "teacher bond", "academic orientation", "academic commit", "academic investment", "academic adjust", "academic enviro", "educational orientation", "educational commit", "educational investment", "educational adjust", "educational enviro", "connection to teacher", "connection to school", "connection to student", "connection to pupil", "commitment to school", "commitment to student", "commitment to pupil", "commitment to education", "attachment to school", "attachment to student", "attachment to pupil", "attachment to teacher", "supportive school", "supportive academic", "supportive teacher", "supportive education", "positive school", "positive academic", "positive teacher", "positive education",  "connected school", "connected academic", "connected education", "connection to school", "connection to academic", "connection to education", "invested school", "invested academic", "invested teacher", "invested education", "investment in school", "investment in academic", "investment in education", "investment in student", "investment in pupil", "committed school", "committed academic", "committed teacher", "committed education", "commitment to school", "commitment to academic", "commitment to teacher", "commitment to  education", "caring school", "caring academic", "caring teacher", "caring education", "school-family", "family-school", "school-parent", "parent-school", "sense of belong", "truancy", "truant", "missed school", "missing school", "school absence", "school absent", "absent from school", "chronically absent", "chronic absence"
)

# coordination of Resources and Services Among Community Agencies
coordinated_services <- c(
  "service coordinat", "service integrat", "service connect", "service link", "resource coordinat", "resource integrat", "resource connect", "resource link", "care coordinat", "care integrat", "care connect", "care link", "treatment coordinat", "treatment integrat", "treatment connect", "treatment link", "coordinated care", "coordination of care", "coordinated service", "coordination of service", "coordinated resource", "coordination of resource", "coordinated treatment", "coordination of treatment", "coordinated communit", "coordination of communit",  "coordination among communit", "coordinated system", "integrated care", "integration of care", "integrated service", "integration of service", "integrated resource", "integration of resource", "integrated treatment", "integration of treatment", "integrated communit", "integration of communit", "integration among communit", "integrated system", "comprehensive care", "comprehensive service", "comprehensive treatment", "comprehensive community", "responsive care", "responsiveness of care", "responsive service", "responsiveness of service", "responsive communit", "responsiveness of communit", "responsive system", "responsiveness of system", "multifaceted care", "multifaceted service", "multifaceted treatment", "multifaceted communit", "multifaceted system", "case manage", "referral", "wrap-around", "wrap around", "linkage to care", "linkage to service", "linkage to treatment", "cross-sector", "cross sector", "multi-agency", "multi agency", "service system", "community capacity"
)

# Cultural Norms that Support Aggression Toward Others
cultural_norms_aggression <- c(
  "norms", "attitude", "belief", "norm adherence", "social norm", "social construct", "social value", "social pressure", "social practice", "social conform", "social perception", "social endors", "social expectation", "social view", "cultural norm", "cultural construct", "cultural value", "cultural pressure", "cultural practice", "cultural context", "cultural perception", "cultural endors", "cultural expectation", "cultural view", "collective value", "collective pressure", "collective practice", "collective perception", "collective expectation", "collective view", "groupthink", "group norm", "group value", "group conform", "group perception", "group endors", "group expectation", "group view", "peer norm", "peer value", "peer pressure", "peer conform", "peer perception", "peer endors", "peer expectation", "peer view", "political view", "normative construct", "normative value", "moral disengagement", "moral atmosphere", "honor culture", "pro-violence", "pro violence", "hate crime", "culture of honor", "authoritarian", "social dominance", "in-group", "out-group", "racism", "racist", "classism", "classist", "ageism", "ageist", "xenophob", "social oppression", "marginalization", "prejudice", "bigotry", "discrimination", "intoleran", "rape culture"
)

# Diminished Economic Opportunities/High Unemployment Rates
dim_econ_opportunity <- c(
  "unemploy", "employment", "job", "economic opportunity", "residential resource", "neighborhood resource", "neighborhood economic", "community resource", "community economic", "local resource", "local econom", "local capital", "local investment", "economic crisis", "financial crisis", "business presence", "businesses per capita", "retail environment", "labor market opportunity", "self-employed", "self employed", "underemploy", "under-employ", "under employ"
)

# Distracted Driving
distracted_driving <- c(
  "distracted driv", "driving distract", "cell phone", "cellular phone", "mobile phone", "texting while driving", "night time driv", "nighttime driv", "night-time driv", "driving at night", "number of passenger", "teen passenger", "teenage passenger"
)

# Economic Stress
econ_stress <- c(
  "economic stress", "economic strain", "economic hardship", "economic pressure", "economic dependence", "economic independence", "economic assistance", "economic difficult", "economic distress", "economic instability", "financial stress", "financial strain", "financial hardship", "financial pressure", "financial dependence", "financial independence", "financial assistance", "financial difficult", "financial distress", "financial instability", "economically stressed", "economically strained", "economically dependent", "economically independent", "economically distressed", "economically unstable", "financially stressed", "financially strained", "financially dependent", "financially independent", "financially distressed", "financially unstable", "food insecurity", "multi-job", "public benefits", "public assistance", "food pantry", "food stamp", "economic recession", "economic status", "working poor", "homeless", "price lunch", "priced lunch"
)

# Family Conflict
family_conflict <- c(
  "family conflict", "family abus", "family violence", "family strain", "family distress", "family stress", "family function", "family maladjust", "family dysfunction", "family breakup", "family dissolution", "family instability", "family interaction", "family hostil", "family disharmony", "family agress", "familial conflict", "familial abus", "familial violence", "familial strain", "familial distress", "familial stress", "familial function", "familial maladjust", "familial dysfunction", "familial breakup", "familial dissolution", "familial instability", "familial interaction", "familial hostil", "familial disharmony", "familial aggress", "family management", "familial management", "family disruption", "familial disruption", "sibling conflict", "sibling abus", "sibling strain", "sibling distress", "sibling stress", "sibling maladjust", "sibling dysfunction", "sibling disharmony", "sibling aggress", "sibling bully", "sibling rival", "marital conflict", "marital abus", "marital violence", "marital strain", "marital distress", "marital function", "marital maladjust", "marital dysfunction", "marital breakup", "marital dissolution", "marital instability", "marital stability", "marital hostil", "marital disharmony", "marital aggress", "parental violence", "parental conflict", "parental dysfunction", "parental disharmony", "parental aggress", "domestic violence", "domestic abus", "domestic conflict", "partner violence", "partner abus", "partner conflict", "spouse violence", "spousal violence", "spouse abus", "spousal abus", "spouse conflict", "spousal conflict", "quarrel", "divorce", "hostile climate", "aversive family"
)

# Family Support and Connectedness
family_support <- c(
  "family attach", "familial attachment", "family activities", "family decision", "family connect", "familial connect", "family monitor", "familial monitor", "family support", "familial support", "family involv", "familial involv", "family cohes", "familial cohes", "family bond", "familial bond", "family trust", "familial trust", "family accept", "familial accept", "family affection", "familial affection", "family close", "familial close", "family function", "familial function", "family environment", "familial environment", "family communication", "familial communication", "parent attach", "parental attachment", "parental connect", "parent connect", "parental monitor", "parent monitor", "parental support", "parent support", "parent involve", "parental involv", "parent warmth", "parental warmth", "parent bond", "parental bond", "parent trust", "parental trust", "parent accept", "parental accept", "parent affection", "parental affection", "parent interest", "parental interest", "caregiver attach", "caregiver connect", "caregiver monitor", "caregiver support", "caregiver involv", "caregiver warmth", "caregiver bond", "caregiver trust", "caregiver accept", "caregiver affection", "caregiver interest", "maternal attach", "maternal connect", "maternal monitor", "maternal support", "maternal involv", "maternal warmth", "maternal bond", "maternal trust", "maternal accept", "maternal affection", "maternal interest", "paternal attach", "paternal connect", "paternal monitor", "paternal support", "paternal involv", "paternal warmth", "paternal bond", "paternal trust", "paternal accept", "paternal affection", "paternal interest", "supportive family", "supportive familial", "supportive parent", "supportive mother", "supportive father", "supportive caregiver", "loving family", "loving familial", "loving parent", "loving mother", "loving father", "loving caregiver", "caring family", "caring familial", "caring parent", "caring mother", "caring father", "caring caregiver", "emotional support", "positive family", "positive familial", "stable family", "stable familial", "positive parent", "positive mother", "positive father", "positive caregiver", "emotional connect", "emotional intimacy", "positive communication", "connected family", "family interconnect", "household cohes", "attachment to family", "parental monitoring", "child monitoring"
)

# Gang Involvement
gang_involvement <- c(
  "gang member", "gang violen", "gang homicide", "gang crime", "gang affiliat", "gang-affiliat", "gang associat", "gang-associat", "gang involv", "gang-involv", "gang-related", "gang network", "exposure to gang", "exposure to a gang", "belonging to gang", "belonging to a gang", "involvement in gang", "involvement in a gang", "participation in gang", "participation in a gang", "affiliation with gang", "affiliation with a gang", "association with gang", "association with a gang"
)

# Harmful norms around masculinity and femininity
gender_norms <- c(
  "gender norm", "gender expectation", "gender ident", "gender equity", "gender inequity", "gender equality", "gender inequality", "gender socioeconomic inequity", "gender economic inequity", "gender socioeconomic inequality", "gender economic inequality", "gender role", "gender conform", "gender stereotyp", "masculin", "feminin", "homophob", "antigay", "anti-gay", "heteronormative", "hegemon", "sexism", "sexist", "mysogyn", "machismo", "chauvinism", "rape myth", "sexual entitlement", "sexual dominance", "female status", "role stress", "strict gender", "rigid gender"
)

# High Alcohol Outlet Density
high_alc_density <- c(
  "alcohol outlet", "alcohol license", "on premise", "on-premise", "off premise", "off-premise", "density of bars", "liquor outlet", "liquor store", "liquor license", "drinking places", "drinking establishment"
)

# History of Violent Victimization and ACEs
history_aces <- c(
  "batter", "victim", "rape", "molest", "sexual abus", "sex abus", "sex traffic", "sexual coerc", "coercive sex", "sexual exploitation", "human traffic", "maltreat", "harassment", "child abus", "child mistreat", "pedophil", "corporal punish", "physical abus", "non-physical abus", "physically abus", "emotional abus", "emotionally abus", "psychological abus", "psychologically abus", "verbal abus", "neglect", "dating abus", "dating conflict", "adolescent abus", "stalking", "controlling behavior", "humiliation", "parental abus", "parental conflict", "abused by a parent", "abused by a caregiver", "abused by their mother", "abused by their father", "abused by a fam", "abused by an adult", "abused by a caregiver", "abused as a child", "abuse as a child", "abuse in childhood", "bully", "bullied", "ostracism", "ostracized", "social rejection", "socially rejected", "peer victim", "peer abus", "elder abus", "older adult abus", "suicid", "intentional overdose", "intentional death", "adverse childhood experience", "adverse experience", "childhood trauma", "traumatic experience", "trauma in childhood", "history of abuse", "incarcerat", "prison", "historical trauma"
)

# Household rules and child monitoring
hh_rules_monitoring <- c(
  "poor parent", "parent-child relations", "parent-youth relations", "parent relations", "parental relations", "parent hostil", "parental hostil", "harsh discipline", "harsh punish", "harsh disciplin", "physical punishment", "physical discipline", "inconsistent disciplin", "harsh parent", "inconsistent parent", "maladaptive parent", "parenting stress", "parent stress", "parenting skill", "parent function", "parental function", "caregiver stress", "caregiver hostil", "caregiver function", "maternal hostil", "paternal hostil", "attachment to parent", "attachment to caregiver", "attachment to mother", "attachment to father", "parental attachment", "attachment to parent", "attachment to caregiver", "social competenc", "parenting practice", "parenting behavior", "parenting behaviour", "parent behavior", "parent behaviour", "poor supervision", "lack of supervision", "authoritarian parent"
)

# Impaired Driving
impaired_driving <- c(
  "impaired driving", "impaired driver", "intoxicated driving", "intoxicated driver", "driving under the influence", "driving while intoxicated", "blood alcohol level", "blood alcohol content"
)

# Language barriers
language_barrier <- c(
  "language", "foreign", "non-English"
)

# Large number of dependent children
many_children <- c(
  "dependent", "dependent child"
)

# Low Educational Achievement
low_edu_achievement <- c(
  "school achieve", "school success", "school attain", "school progress", "school performance", "school aspiration", "school disengage", "school advancement", "school readiness", "school failure", "educational achieve", "educational success", "educational attain", "educational progress", "educational performance", "educational aspiration", "educational disengage", "educational advancement", "academic achieve", "academic success", "academic attain", "academic progress", "academic performance", "academic aspiration", "academic disengage", "academic advancement", "school drop-out", "school drop out", "grades", "grade point average", "GPA", "undereducated", "low achieving", "low-achieving", "low education", "education level", "level of education", "success in school", "progress in school", "schoolwork", "school work",  "coursework", "course work", "homework", "home work", "primary education", "secondary education", "tertiary education", "higher education", "high school education", "high-school education", "college", "achievement in school", "performance in school", "school deviance", "school graduat", "graduate on time", "on time graduat", "on-time graduat", "diploma", "verbal IQ", "low IQ"
)

# Media Violence
media_violence <- c(
  "m-rated"
  ) 

# Medication Adverse Effects and Misuse
medication_misuse <- c(
  "medication abuse", "medication addict", "medication depend", "medication misuse", "drug misuse", "maladaptive use", "prescription abuse", "prescription addict", "prescription depend", "prescription misuse", "prescription drug abuse", "prescription drug addict", "prescription drug depend", "prescription drug misuse", "anticoagulant", "blood thinner", "blood-thinner", "warfarin", "asprin", "clopidogrel", "heparin", "rivaroxaban", "Xarelto", "dabigatran", "Pradaxa", "apixaban", "Eliquis", "edoxaban", "Lixiana", "platelet aggregat", "plavix", "clopidogrel", "effient", "prasugrel", "brilinta", "ticagrelor"
)

# Motor Vehicle Crashes
vehicle_crashes <- c(
  "vehicle accident", "vehicle crash", "vehicle collision", "vehicle injur", "moving vehicle violation", "vehicle death", "vehicle fatal", "vehicle trauma", "vehicle safety", "vehicular accident", "vehicular crash", "vehicular collision", "vehicular injur", "vehicular violation", "vehicular death", "vehicular fatal", "vehicular trauma", "vehicular safety", "traffic accident", "traffic crash", "traffic collision", "traffic injur", "traffic violation", "traffic death", "traffic fatal", "traffic trauma", "traffic safety", "car accident", "car crash", "car collision", "car injur", "car violation", "car death", "car fatal", "car trauma", "car safety", "motorcycle accident", "motorcycle crash", "motorcycle collision", "motorcycle injur", "motorcycle wreck", "motorcycle violation", "motorcycle death", "motorcycle fatal", "motorcycle trauma", "motorcycle safety", "road accident", "road crash", "road collision", "road injur", "road violation", "road death", "road fatal", "road trauma", "road safety", "pedestrian accident", "pedestrian crash", "pedestrian collision",  "pedestrian injur", "pedestrian violation", "pedestrian death", "pedestrian fatal", "pedestrian trauma", "pedestrian safety", "pedestrian-motor vehicle accident", "pedestrian-motor vehicle crash", "pedestrian-motor vehicle collision", "pedestrian-motor vehicle injur", "pedestrian-motor vehicle violation", "pedestrian-motor vehicle death", "pedestrian-motor vehicle fatal", "pedestrian-motor vehicle trauma", "pedestrian-motor vehicle safety", "driving accident", "driving crash", "driving collision", "driving injur", "driving death", "driving fatal", "driving trauma", "driving safety", "driving behavior", "driving behaviour", "driving violation", "moving violation", "automobile accident", "automobile crash", "automobile collision", "automobile injur", "automobile violation", "automobile death", "automobile fatal", "automobile trauma", "automobile safety", "truck accident", "truck crash", "truck collision", "truck injur", "truck violation", "truck death", "truck fatal", "truck trauma", "truck safety", "sports utility vehicle accident", "sports utility vehicle crash", "sports utility vehicle collision", "sports utility vehicle injur", "sports utility vehicle violation", "sports utility vehicle death", "sports utility vehicle fatal", "sports utility vehicle trauma", "sports utility vehicle safety", "interstate accident", "interstate crash", "interstate collision", "interstate injur", "interstate violation", "interstate death", "interstate fatal", "interstate trauma", "interstate safety", "highway accident", "highway crash", "highway collision", "highway injur", "highway violation", "highway death", "highway fatal", "highway trauma", "highway safety", "wreck", "fender bender", "collide", "terrain vehicle accident", "terrain vehicle crash", "ATV accident", "ATV crash", "ATV collision", "ATV injur", "ATV violation", "ATV death", "ATV fatal", "ATV trauma", "ATV safety", "safe driving"
)

# Neighborhood Poverty
nbhood_poverty <- c(
  "poverty", "impoverish", "low income", "low-income", "limited income", "household income", "poor communit", "poor resident", "wealthy communit", "economic disadvantage", "economically disadvantaged", "economic instability", "economic deprivation", "economically deprived", "economic resources", "financial disadvantage", "financially disadvantaged", "financial deprivation", "financially deprived", "concentrated disadvantage", "concentration of disadvantage", "concentrated deprivation", "local disrepair", "local disadvantage", "local deprivation", "socioeconomic", "community resources", "community disrepair", "community disadvantage", "community deprivation", "disadvantaged communit", "neighborhood resources", "neighborhood disrepair", "neighborhood disadvantage", "neighborhood deprivation", "neighbourhood resources", "neighbourhood disrepair", "neighbourhood disadvantage", "neighbourhood deprivation", "affluence", "affluent", "dilapidated", "overcrowd"
)

# Nonbiological, transient caregivers in the home (e.g., mother's male partner)
nonbiological_caregivers <- c(
  "mother's male partner", "male partner", "boyfriend", "nonbiological", "transient caregiver", "female partner", "girlfriend", "partner", "non-biological"
)

# Parents' understanding of children's needs, child development and parenting skills
parenting_skills <- c(
  "poor parent", "parent-child relations", "parent-youth relations", "parent relations", "parental relations", "parent hostil", "parental hostil", "parent-child hostil", "parent child hostil", "parent-child conflict", "parent child conflict", "parent-child strain", "parent child strain", "parent-child connect", "parent child connect", "parent-child interconnect", "parent child interconnect", "child attach", "harsh discipline", "harsh punish", "harsh disciplin", "physical punishment", "physical discipline", "inconsistent disciplin", "harsh parent", "inconsistent parent", "maladaptive parent", "parenting stress", "parent stress", "parenting skill", "parent function", "parental function", "caregiver stress", "caregiver hostil", "caregiver function", "maternal hostil", "paternal hostil", "attachment to parent", "attachment to caregiver", "attachment to mother", "attachment to father", "parental attachment", "attachment to parent", "attachment to caregiver", "social competenc", "parenting practice", "parenting behavior", "parenting behaviour", "parent behavior", "parent behaviour", "poor supervision", "lack of supervision", "authoritarian parent", "child need", "child development"
)

# Parental employment
parent_unemployment <- c(
  "unemploy", "employment", "job", "economic opportunity", "residential resource", "neighborhood resource", "neighborhood economic", "community resource", "community economic", "local resource", "local econom", "local capital", "local investment", "economic crisis", "financial crisis", "business presence", "businesses per capita", "retail environment", "labor market opportunity", "self-employed", "self employed", "underemploy", "under-employ", "under employ"
)

# Parental thoughts and emotions that tend to support or justify maltreatment behaviors
parent_maltx <- c(
  "poor parent", "parent-child relations", "parent-youth relations", "parent relations", "parental relations", "parent hostil", "parental hostil", "parent-child hostil", "parent child hostil", "parent-child conflict", "parent child conflict", "parent-child strain", "parent child strain", "parent-child connect", "parent child connect", "parent-child interconnect", "parent child interconnect", "child attach", "harsh discipline", "harsh punish", "harsh disciplin", "physical punishment", "physical discipline", "inconsistent disciplin", "harsh parent", "inconsistent parent", "maladaptive parent", "parenting stress", "parent stress", "parenting skill", "parent function", "parental function", "caregiver stress", "caregiver hostil", "caregiver function", "maternal hostil", "paternal hostil", "attachment to parent", "attachment to caregiver", "attachment to mother", "attachment to father", "parental attachment", "attachment to parent", "attachment to caregiver", "social competenc", "parenting practice", "parenting behavior", "parenting behaviour", "parent behavior", "parent behaviour", "poor supervision", "lack of supervision", "authoritarian parent", "norms", "attitude", "belief", "norm adherence", "social norm", "social construct", "social value", "social pressure", "social practice", "social conform", "social perception", "social endors", "social expectation", "social view", "cultural norm", "cultural construct", "cultural value", "cultural pressure", "cultural practice", "cultural context", "cultural perception", "cultural endors", "cultural expectation", "cultural view", "collective value", "collective pressure", "collective practice", "collective perception", "collective expectation", "collective view", "groupthink", "group norm", "group value", "group conform", "group perception", "group endors", "group expectation", "group view", "peer norm", "peer value", "peer pressure", "peer conform", "peer perception", "peer endors", "peer expectation", "peer view", "political view", "normative construct", "normative value", "moral disengagement", "moral atmosphere", "honor culture", "pro-violence", "pro violence", "hate crime", "culture of honor", "authoritarian", "social dominance", "in-group", "out-group", "racism", "racist", "classism", "classist", "ageism", "ageist", "xenophob", "social oppression", "marginalization", "prejudice", "bigotry", "discrimination", "intoleran", "rape culture"
)

# Parenting stress
parent_stress <- c(
  "parenting stress", "parent stress", "caregiver stress", "caregiving stress", "maternal stress", "paternal stress"
)

# Poor Behavioral Control/Impulsiveness
impulsiveness <- c(
  "behavior control", "behavioral control", "behavior modulation", "behavioral modulation", "behaviour control", "behavioural control", "behaviour modulation", "behavioural modulation", "inhibitory control", "impulse control", "impulsiv", "inhibition", "sensation seeking", "sensation-seeking", "discounting", "risk activated", "risk-activated", "reward activated", "reward-activated", "reward averse", "reward-averse", "urgency", "compulsi", "hyper-reactiv", "reactivity", "self-control", "self control", "conduct disorder", "restlessness", "concentration problems", "risk taking", "risk-taking", "risky behavior", "risky behaviour", "antisocial behavior", "anti-social behavior", "delinquent behavior", "delinquent act", "delinquency", "vandalism", "attention deficit", "attention problem", "ADHD", "hyperactiv", "hyper-activ", "cognitive deficit", "cognitive problems", "cognitive impair", "cognitively impair", "cognition", "learning disorder", "learning disability", "processing disorder", "processing disability", "processing deficit", "disinhibit", "thrill seek", "disruptive behavior", "disruptive behaviour"
)

# Poor Neighborhood Support and Cohesion
nbhood_support_cohesion <- c(
  "social disorganization", "social disengagement", "social instability", "social marginal", "social disenfranchise", "social inaction", "community disorgan", "community disengage", "community instability", "community isolation", "community marginal", "community disenfranchise", "community inaction", "community condition", "neighborhood disorgan", "neighborhood disengage", "neighborhood instability", "neighborhood isolation", "neighborhood marginal", "neighborhood disenfranchise", "neighborhood inaction", "neighbourhood disorgan", "neighbourhood disengage", "neighbourhood instability", "neighbourhood isolation", "neighbourhood marginal", "neighbourhood disenfranchize", "neighbourhood inaction", "neighborhood condition", "neighbourhood condition", "local disorganization", "local disengagement", "local instability", "local marginal", "local inaction", "resident disengage", "resident disenfranchise", "resident inaction", "residential instability", "transien", "socially disorganized", "socially disengaged", "socially unstable", "socially marginalized", "socially marginalised", "socially disenfranchised", "locally disorganized", "locally disengaged", "locally disenfranchise", "isolated communit", "isolated neighbor", "isolated neighbour", "isolated resident", "marginalized communit", "marginalized neighbor", "marginalised neighbour", "marginalized resident", "disenfranchised communit", "disenfranchised neighbor", "disenfranchised neighbour", "disenfranchised resident"
)

# Poor Parent-Child Relationships
poor_family_relationships <- c(
  "poor parent", "parent-child relations", "parent-youth relations", "parent relations", "parental relations", "parent hostil", "parental hostil", "parent-child hostil", "parent child hostil", "parent-child conflict", "parent child conflict", "parent-child strain", "parent child strain", "parent-child connect", "parent child connect", "parent-child interconnect", "parent child interconnect", "child attach", "harsh discipline", "harsh punish", "harsh disciplin", "physical punishment", "physical discipline", "inconsistent disciplin", "harsh parent", "inconsistent parent", "maladaptive parent", "parenting stress", "parent stress", "parenting skill", "parent function", "parental function", "caregiver stress", "caregiver hostil", "caregiver function", "maternal hostil", "paternal hostil", "attachment to parent", "attachment to caregiver", "attachment to mother", "attachment to father", "parental attachment", "attachment to parent", "attachment to caregiver", "social competenc", "parenting practice", "parenting behavior", "parenting behaviour", "parent behavior", "parent behaviour", "poor supervision", "lack of supervision", "authoritarian parent"
)

# Problem Solving Skills (Skills in Solving Problems Non-Violently, Lack of Non-Violent Problem Solving Skills)
lack_problem_solving_skills <- c(
  "aggress", "lack of coping", "problem solving", "problem-solving", "lack of communication", "poor interpersonal", "poor communication", "poor coping", "maladaptive coping", "maladaptive behavior", "hostile communicat", "coping skill", "social skill", "communication skill", "interpersonal skill", "life skill", "coping strateg", "communication strateg", "interpersonal problem", "social problem", "relationship problem", "interpersonal conflict", "social conflict", "relationship conflict", "peer conflict", "social competence", "interpersonal competence", "peer pressure", "physical fight", "fighting", "conflict resolution", "cooperative behavior", "cooperative behaviour", "caring behavior", "caring behaviour", "problem orientation", "managing stress", "managing anx", "socially competent", "interpersonally compentent", "prosocial behavior", "pro-social behavior", "prosocial act", "pro-social act", "empathy"
)

# Proper Child Safety Seat Use/Child Backseat Sitting Location
carseat <- c(
  "car seat", "carseat", "booster seat", "back seat", "child restraint", "backseat", "rear seat", "rear center seat", "seated in the rear", "seated in the back", "child passenger", "child safety", "forward-facing car seat"
)

# Psychological/Mental Health Problems
mental_health <- c(
  "mental health", "mental illness", "mentally ill", "mental disorder", "mentally disordered", "mental diagnosis", "psycholog", "psychopath", "psychiatric", "affective disorder", "depress", "anxiety", "maladjust", "anger", "emotion", "dysregulation", "mania", "manic", "antisocial personality", "anti-social personality", "personality disorder", "intermittent explosive disorder", "borderline personality", "defiant disorder", "dysthymi", "bipolar", "bi-polar", "schizo", "post traumatic stress", "post-traumatic stress", "ptsd", "panic", "hopelessness"
)

#Seatbelt Use
seatbelt <- c(
  "Seat belt", "seatbelt", "restraint", "belt use"
)

# Single parenthood
single_parent <- c(
  "single parent", "single-parent", "lone parent", "lone-parent", "one parent", "one-parent"
)

# Social Isolation/lack of support
social_isolation <- c(
  "social isolation", "socially isolated", "lack of support", "shut in", "shut-in", "social exclusion", "social deprivation", "social stress", "psychological support", "loneliness", "lonely", "social alienation"
)

# Societal Income Inequality
income_inequality <- c(
  "income inequality", "income inequity", "income distribution", "income stratification", "neighborhood inequality", "neighbourhood inequality", "neighborhood stratification", "neighbourhood stratification", "community inequality", "community stratification", "income distribution", "wealth distribution", "economic inequity", "economic inequality", "economic distribution", "economic stratification", "equal opportunity", "social stratification", "GINI index", "GINI coefficient", "GINI ratio"
)

# Substance Use
substance_use <- c(
  "substance use", "substance abuse", "substance misuse", "substance problem", "substance involvement", "substance diagnos", "addict", "alcohol abuse", "alcohol use", "alcohol misuse", "alcohol problem", "alcohol related", "alcohol-related", "alcohol consum", "excessive alcohol", "binge drinking", "binge-drinking", "drinking frequency", "drinking behavior", "drinking behaviour", "drinking related", "drinking-related", "marijuana", "cannabis", "methamphetamine", "cocaine", "hallucinogen", "crack", "stimulant", "polydrug", "tranquilizer", "inhalant", "ecstasy", "steroid", "drug use", "drug abuse", "drug misuse", "drug problem", "maladaptive use", "heroin", "opioid"
)

# Witnessing Violence
witness_violence <- c(
  "exposure to crim", "exposure to a crime", "exposure to abus", "exposure to advers", "exposure to assault", "exposure to harassment", "exposed to crim", "exposed to a crime", "exposed to abus", "exposed to advers", "exposed to assault", "exposed to harassment", "witness"
)

# Young parent age
young_parent <- c(
  "young parent", "young pregnan", "teen parent", "teen pregnan", "adolescent parent", "adolescent pregnan"
)


# convert each set of terms to a data frame -------------------------------

dictionaries <- mget(ls())

dictionaries <- lapply(dictionaries, function(x) {
  x = data.frame(terms = x, notes = NA)
})

full_dictionary <- bind_rows(dictionaries, .id = "dictionary") %>%
  group_by(terms) %>%
  mutate(duplicate = ifelse(n() > 1, TRUE, FALSE)) %>%
  ungroup()

dictionaries$full_dictionary <- full_dictionary


# write out file ----------------------------------------------------------

# write_xlsx(dictionaries, "C:/Users/gbushman/Documents/Projects/misc/legislative-analysis/keyword-dictionaries.xlsx")
