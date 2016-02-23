#include <unistd.h>
#include <stdio.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <time.h>

void display_info(char *max_name, struct stat max_file) {
    // Calculate the current size and the allocated size
    int max_size = max_file.st_size;
    int max_max = max_file.st_blocks * max_file.st_blksize;

    // Calculate the fragmentation
    float max_frag = ((float)max_max - (float)max_size) / (float)max_max;

    // Get the Last Access Time
    time_t max_atime = max_file.st_atime; 

    // Display the information
    printf("\nInformation for %s\n", max_name);
    printf("---------------------------\n\n");
    printf("File Size: \t\t%d bytes\n", max_size);
    printf("File Fragmentation: \t%3.2f%%\n\n", (max_frag*100));
    printf("Last Access Time: %s\n", ctime(&max_atime));
}
 
int main(int argc, char **argv) {
    // If the user attempts to pass in arguments, warn them that non are needed and exit.
    if(argc != 1) { printf("No arguments necessary. Exiting.\n"); return 1; }
 
    // Define stat variables
    struct stat fred, pete, dave;

    // Define file paths
    char *fredFile = "/CS201/class/fred";
    char *peteFile = "/CS201/class/pete";
    char *daveFile = "/CS201/class/dave";
    
    // Make sure the files actually exist
    // If they don't exit gracefully
    if(stat(fredFile,&fred) < 0 || stat(peteFile,&pete) < 0 || stat(daveFile,&dave) < 0) {
        printf("Error with files. Stopping.");
        return 1;
    }

    // Get the size of all the files, so we can compare them
    int fred_size = fred.st_size;
    int pete_size = pete.st_size;
    int dave_size = dave.st_size;

    // Calculate which file is the largest, and display that information
    if (fred_size > pete_size && fred_size > dave_size) display_info(fredFile, fred);
    if (pete_size > fred_size && pete_size > dave_size) display_info(peteFile, pete);
    if (dave_size > fred_size && dave_size > pete_size) display_info(daveFile, dave);
 
    return 0;
}