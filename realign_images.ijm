setBatchMode(true);
path = getDirectory("Choose a Directory");
path2 = path + "All_Parts" + File.separator;
filename = getFileList(path2);
newDir = path + "All_Parts_Reg" + File.separator;
newDir2 = path + "New Stack" + File.separator;
if (!File.exists(newDir)) {
	File.makeDirectory(newDir);
} 
if (!File.exists(newDir2)) {
	File.makeDirectory(newDir2);
} 
//Make sure this is correct
num_z = 11;

for (z=1; z<=num_z; z++) {
	if (z < 10) {
		Z_name = "00"+z+".tif";
	}
	else {
		Z_name = "0"+z+".tif";
	}

	for (i=0; i<filename.length; i++) { 
		if(endsWith(filename[i], Z_name)) { 
			open(path2+filename[i]);
		}
	}
	run("Images to Stack", "name="+Z_name+" title=[] use");
	run("StackReg", "transformation=[Rigid Body]");
	
	saveAs("tiff", newDir2 + getTitle);
	
	run("Stack to Images");
	for (i=0; i<20; i++) {
		saveAs("tiff", newDir + getTitle);
		close();
	}
}

