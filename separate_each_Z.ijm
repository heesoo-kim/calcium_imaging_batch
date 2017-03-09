setBatchMode(true);

//MAKE SURE THIS IS CORRECT!!
num_z = 11;
path = getDirectory("Choose a Directory");

filename = getFileList(path);
newDir = path + "All_Parts" + File.separator;
if (File.exists(newDir)) exit("Destination directory already exists; remove it and then run this macro again");
File.makeDirectory(newDir); 


for (i=0; i<filename.length; i++) { 
	if(endsWith(filename[i], ".tiff")) { 
		num_files = num_files+1;
		open(path+filename[i]);
		run('Stack to Images');

		for (j=0; j<num_z; j++) {
			saveAs("tiff", newDir + getTitle);
			close();
		}
		//close();
	}
}
