setBatchMode(true);
path = getDirectory("Choose a Directory");
path_parts = path + "All_Parts_Reg" + File.separator;
newDir = path + "realigned_byTIME" + File.separator;

if (!File.exists(newDir)) {
	File.makeDirectory(newDir);
} 

//Make sure this is correct
start_z = 1;
end_z = 16;

for (t=0; t<=19; t++){
	if (t < 10){t_name = "0" + t + "-";}
	else {t_name = "" + t + "-";}	

	for (z=start_z; z<=end_z; z++) {
		if (z < 10) { Z_name = "000"+z+".tif";}
		else {Z_name = "00"+z+".tif";}

		open(path_parts + t_name + Z_name);
	}
	run("Images to Stack", "name="+t_name+start_z+"_"+end_z+" title=[] use");
	saveAs("tiff", newDir + getTitle);
	
	close();
}

//close();
setBatchMode(false);