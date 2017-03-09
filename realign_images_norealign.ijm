setBatchMode(true);

//Make sure this is correct
num_z = 11;
path = getDirectory("Choose a Directory");

path2 = path + "All_Parts" + File.separator;
filename = getFileList(path2);
newDir2 = path + "New Stack norealign" + File.separator;
if (!File.exists(newDir2)) {
	File.makeDirectory(newDir2);
} 


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
	
	saveAs("tiff", newDir2 + getTitle);
	close();
}

