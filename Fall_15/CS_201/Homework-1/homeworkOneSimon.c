#include<stdio.h>
#include<stdlib.h>
#include<time.h>

int main(int argc, char* argv[]) {
    // Check if the number of inputs is correct 
    if (argc != 3) {
        printf("Invalid inputs. Exiting\n");
        return 0;
    }

    // Initialize Count and max_rand (FROM ARGV[])
    int count = atoi(argv[1]);
    int max_rand = atoi(argv[2]);    

    // Initialize array of randoms
    int rand_array[count];

    // Seed the rand
    srand(time(NULL));

    // Generate the random values and put them in the array 
    for (int i=0;i<count;i++) {
        // Comment below to not include maximum rand in possibilities
        int random_value = rand() % (max_rand);

        // Uncomment below to include maximum rand in possibilities
        // int random_value = rand() % (max_rand);  
        rand_array[i] = random_value; 
    }

    // Go through the array and print the random values we just created
    for (int j=0;j<count;j++) {
        printf("%d\n", rand_array[j]);
    }
    
    // Exit 
    return 0;
}
