// The process name for Wild Skies is "Wild Skies"

// state("PROCESS_NAME")
// {
//  	POINTER_PATH
//  	POINTER_PATH
//  	...
// }

state("Wild Skies")
{
	int coins : "mono-1-vc.dll", 0x00203964, 0x10, 0x184, 0x8, 0x84, 0x6C, 0x10, 0x354;
	int dragon : "mono-1-vc.dll", 0x00203964, 0x10, 0x29C, 0, 8, 0x38, 0xC;
	int mutton : "mono-1-vc.dll", 0x00203964, 0x10, 0x1AC, 0, 0x14, 0x60, 0x40, 0x790;
}

init
{
	vars.split = 0;
	print("INIT");
}

startup
{
	print("STARTUP");
}

split
{
	if (vars.split == 0 && (old.mutton > current.mutton)) {
		vars.split++;
		return true;
	}

	//print("Current coins: " + current.coins);
}