setBatchMode(true);
path = getDirectory("Choose a Directory");
filename = getFileList(path); 

//MAKE SURE THIS IS CORRECT!!
num_z = 15;

for (i=0; i<filename.length; i++) { 
	if(endsWith(filename[i], ".tiff")) { 
		num_files = num_files+1;
		open(path+filename[i]);
		run('Stack to Images');

		for (j=0; j<num_z; j++) {
			temp = filename[i];
			saveAs("tiff", path + temp[end-7:end]);
			close();
		}
		//close();
	}
}