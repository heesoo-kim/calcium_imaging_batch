//setBatchMode(true);
path = getDirectory("Choose a Directory");
filename = getFileList(path);

for (i=0; i<filename.length; i++) { 
	if(startsWith(filename[i], 'flat_')) { 
		open(path+filename[i]);
		Fname = filename[i];
	}
}

run("Z Project...", "start=1 stop=4 projection=[Average Intensity]");
imageCalculator("Subtract create 32-bit stack", Fname, "AVG_"+Fname);
imageCalculator("Divide create 32-bit stack", "Result of "+Fname, "AVG_"+Fname);
selectWindow("Result of Result of "+Fname);

saveAs("Tiff", path+"dfof_"+Fname);
