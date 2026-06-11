// Autosplitter for Dreamworks Dragons: Wild Skies

state("Wild Skies")
{
	//int coins : "mono-1-vc.dll", 0x00203964, 0x10, 0x184, 0x8, 0x84, 0x6C, 0x10, 0x354;
	int loadingDragon : "mono-1-vc.dll", 0x001EE6AC, 0x40, 0xFC0, 0xC, 0x18, 0x0, 0xC, 0xC;
	int staticDragon : "mono-1-vc.dll", 0x001EE6AC, 0x40, 0xFC0, 0x0, 0xC, 0xC;
}

init
{
	vars.split = 1; //!< Tracks in which split the run is at
	vars.tutoStart = false; //!< Tracks if the riding tutorial with Toothless has begun
	print("INIT");
}

startup
{
	print("STARTUP");
}

update
{
	// When the game begins after being reset, loadingDragon may have
	// the value 0, which would pause the timer. This solves that.
	if (current.staticDragon == 5) {
		vars.tutoStart = true;
	}
	return true;
}

// The "loadingDragon" variable goes to zero when loading.
isLoading
{
	if (vars.tutoStart && current.loadingDragon == 0) {
		return true;
	}
	return false;
}

split
{
	int currentSplit = vars.split; //!< Just so that the switch statement works
	switch (currentSplit)
	{
		case 1: // Tame the Deadly Nadder
			if (old.staticDragon == 5 && current.staticDragon == 1) {
			++vars.split;
			return true;
			}
			break;
		case 2: // Tame the Hideous Zippleback
			if (old.staticDragon != 3  && current.staticDragon == 3) {
				++vars.split;
				return true;				
			}
			break;
		case 3: // Tame the Monstrous Nightmare
			if (old.staticDragon != 4 && current.staticDragon == 4) {
				++vars.split;
				return true;
			}
			break;
		case 4: // Tame the Night Fury; Finish the run.
			if (old.staticDragon != 5 && current.staticDragon == 5) {
				return true;
			}
			break;
		default:
			return false;
	}
}
