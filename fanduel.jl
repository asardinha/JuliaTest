# This code solves for multiple baseball lineups

include("fd_data.jl")
include("FD_formulations.jl")  #this code has all the different formualations


################################################################################################################
################################################################################################################
################################################################################################################

#INPUT PARAMS
# num_lineups is the total number of lineups
num_lineups = 20;

# num_overlap is the maximum overlap of players between the lineups
num_overlap = 3

#number of hitters in the stack (number of consecutive hitters in the hitting order)
stack_size = 4;

#FORMULATION:  formulation is the type of formulation that you would like to use.
formulation = baseball_formulation

#path to the csv file with the players information (pitchers and hitters);
path_pitchers = "FDpitchers.csv"
path_hitters = "FDhitters.csv";

# path_to_output is a string  that gives the path to the csv file that will give the outputted results
path_to_output= "Fanduel_Test1.csv";




#########################################################################
# Running the code
println("Calculating Fanduel baseball linueps.\n ", num_lineups, " lineups\n","Formulation  ",formulation,
"\nOverlap = ", num_overlap,"\nStack size = ", stack_size)

tic()
create_lineups(num_lineups, num_overlap, stack_size,formulation, path_pitchers, path_hitters,  path_to_output);
telapsed = toq();

println("\nCalculated Fanduel baseball lineups.\n\tNumber of lineups = ", num_lineups, " \n\tStack size = ",stack_size,
"\n\tOverlap = ", num_overlap,"\n" )

println("Took ", telapsed/60.0, " minutes to calculate ", num_lineups, " lineups")

println("Saving data to file ",path_to_output,)

#save the projected and actual points for the lineups
#lineup_points_proj(path_to_output,path_hitters,path_pitchers,path_to_output_proj);
#lineup_points_actual(path_to_output,path_hitters,path_pitchers,path_to_output_actual);
