spinning disk calcium imaging README

separate_each_Z
	This function takes all time-based tif images and saves out a new tif for each time and slice.
	Choose the directory where all the 00.tif-19.tif images are.
	Make sure to edit the number of z slices!!!
	Saves out in the "All_Parts" folder numbered as follows:
		TT_00SS.tif
		TT = time point (generally, 00-19)
		SS = z slice number (01 - n)

realign_images
	This function makes an "All_Parts_Reg" and a "New Stack" directory. Goes through the "All_Parts" directory and uses rigid realign to make sure that each z slices is realigned to the first time point. All realigned parts are saved in "All_Parts_Reg" while the new stacks (20 time frames long) are saved in "New Stack"
	Select main directory first.
	Make sure that number of z slices is correct.

remake_stacks
	Makes a "temp" directory. Goes through the "All_Parts_Reg" directory and makes a max projection for user-defined start and end z.


make_into_stack
	An old function that goes through the "All_Parts" directory and new n tifs (number of slices), each 20 time points long. I do not recommend using this function