#include <unistd.h>
#include <stdio.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <time.h>
void display_info(char *max_name, struct stat max_file) {
    int max_size = max_file.st_size, max_max = max_file.st_blocks * max_file.st_blksize;
    float max_frag = ((float)max_max - (float)max_size) / (float)max_max;
    time_t max_atime = max_file.st_atime; 
    printf("\nInformation for %s\n---------------------------\n\nFile Size: \t\t%d bytes\nFile Fragmentation: \t%3.2f%%\n\nLast Access Time: %s\n", max_name, max_size, (max_frag*100), ctime(&max_atime));
}
int main(int argc, char **argv) {
    if(argc != 1) { printf("Too many arguments. Exiting\n"); return 1; }
    struct stat fred, pete, dave;
    char *fredFile = "/CS201/class/fred", *peteFile = "/CS201/class/pete", *daveFile = "/CS201/class/dave";
    if(stat(fredFile,&fred) < 0 || stat(peteFile,&pete) < 0 || stat(daveFile,&dave) < 0) { printf("Error with files. Stopping.\n"); return 1; }
    int fred_size = fred.st_size, pete_size = pete.st_size, dave_size = dave.st_size;
    if (fred_size > pete_size && fred_size > dave_size) display_info(fredFile, fred);
    if (pete_size > fred_size && pete_size > dave_size) display_info(peteFile, pete);
    if (dave_size > fred_size && dave_size > pete_size) display_info(daveFile, dave);
    return 0;
}