// Autosplitter for Dreamworks Dragons: Wild Skies

state("Wild Skies")
{
	//int coins : "mono-1-vc.dll", 0x00203964, 0x10, 0x184, 0x8, 0x84, 0x6C, 0x10, 0x354;
	int loadingDragon : "mono-1-vc.dll", 0x001EE6AC, 0x40, 0xFC0, 0xC, 0x18, 0x0, 0xC, 0xC;
	int staticDragon : "mono-1-vc.dll", 0x001EE6AC, 0x40, 0xFC0, 0x0, 0xC, 0xC;
	//int mutton : "mono-1-vc.dll", 0x00203964, 0x10, 0x1AC, 0, 0x14, 0x60, 0x40, 0x790;
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
	switch (vars.split)
	{
		case 1:
			if (old.staticDragon == 5 && current.staticDragon == 1) {
			vars.split++;
			return true;
			}

		// [TODO] Implement remaining timer split triggers
		case 2:
			return false;
		case 3:
			return false;
		case 4:
			return false;

		default:
			return false;
	}
}
