//Make sure this is correct
start_z = 6;
end_z = 11;
t_max = 19;
path = "/Users/heesoo/Desktop/spinning_disk_TPN/D41_bx/ppk28TRP/2014_07_01/fly4/h2/";
//path = getDirectory("Choose a Directory");

setBatchMode(true);
path_parts = path + "All_Parts" + File.separator;
newDir = path + "temp_noreg" + File.separator;

if (!File.exists(newDir)) {
	File.makeDirectory(newDir);
} 

for (t=0; t<=t_max; t++){
	if (t < 10){t_name = "T0" + t + "-";}
	else {t_name = "T" + t + "-";}	

	for (z=start_z; z<=end_z; z++) {
		if (z < 10) { Z_name = "000"+z+".tif";}
		else {Z_name = "00"+z+".tif";}

		open(path_parts + t_name + Z_name);
	}
	run("Images to Stack", "name="+t_name+start_z+"_"+end_z+" title=[] use");
	saveAs("tiff", newDir + getTitle);
	run("Z Project...", "start=[] stop=[] projection=[Max Intensity]");
	saveAs("tiff", newDir + getTitle);

	close();
	close();
}

for (t=0; t<=t_max; t++){
	if (t < 10){t_name = "MAX_T0" + t + "-";}
	else {t_name = "MAX_T" + t + "-";}

	fname = t_name + start_z + "_" + end_z + ".tif";
	open(newDir + fname);
}

run("Images to Stack", "name=flat_noreg_"+start_z+"_"+end_z+" title=[] use");
saveAs("tiff", newDir + getTitle);
//close();
setBatchMode(false);