Scriptname _Camp_CampfireType_CracklingScript extends ObjectReference  

import CampUtil

int burn_duration = 6

bool property isDeadwood = false auto
bool property isFirewood = false auto

Furniture property _Camp_Campfire auto
Activator property _Camp_Fuel_Crackling_DeadwoodLit auto
Activator property _Camp_Fuel_Crackling_FirewoodLit auto
Activator property _Camp_Fuel_Crackling_DeadwoodUnlit auto
Activator property _Camp_Fuel_Crackling_FirewoodUnlit auto
Light property _Camp_Campfire_Light_4 auto
MiscObject property this_item auto
Actor property PlayerRef auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == PlayerRef
		ObjectReference f = Game.FindClosestReferenceOfTypeFromRef(_Camp_Campfire, PlayerRef, 500.0)
		if f
			f.Activate(PlayerRef)
			if isDeadwood
				(f as CampCampfire).SetFuel(_Camp_Fuel_Crackling_DeadwoodLit,		\
											_Camp_Fuel_Crackling_DeadwoodUnlit,		\
											_Camp_Campfire_Light_4, burn_duration)
			elseif isFirewood
				(f as CampCampfire).SetFuel(_Camp_Fuel_Crackling_FirewoodLit, 		\
											_Camp_Fuel_Crackling_FirewoodUnlit, 	\
											_Camp_Campfire_Light_4, burn_duration)
			endif
		endif
		PlayerRef.RemoveItem(this_item, 1, true)
	endif
endEvent