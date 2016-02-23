#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<pthread.h>

#define bool char
#define true 1
#define false 0

typedef struct node_t {
    struct node_t* next;
    struct node_t* prev;
    int value;
    int num;
} node;

void *generateNum(int max_rand) {
    int random_value;
    random_value = rand() % (max_rand);
    
    return (void *)random_value;
}

void *checkAround(node* curr_node) {
    node* prev_node = curr_node->prev;
    node* next_node = curr_node->next;
    
    int curr_value = curr_node->value;
    int prev_value = prev_node->value;
    int next_value = next_node->value;
    
    while (abs(curr_value - next_value) < 8 || abs(curr_value - prev_value) < 8) {
        curr_value = rand() % 100;
    }
    
    return (void *)curr_value;
}

int main(int argc, char* argv[]) {
    // Check if the number of inputs is correct 
    if (argc != 3) {
        printf("Invalid inputs. Exiting\n");
        return 0;
    }

    // Initialize Count and max_rand (FROM ARGV[])
    int count = atoi(argv[1]);
    int max_rand = atoi(argv[2]);
    
    pthread_t threads[count];
    pthread_t threads2[count];
    
    void *status;
    void *status2;
    
    if (max_rand < 100) {
        printf("Count must be greater than or equal to 100. Exiting\n");
        return 0;
    }

    // Seed the rand
    srand(time(NULL));
    
    node* first = malloc(sizeof(node));
    first->next = NULL;
    first->value = rand() % max_rand;
    first->num = 0;

    node* current_node = first;
    
    // Generate the random values and put them in the linked list 
    for (int i=1; i<count; i++) {
//        printf("Generating node num %d\n", i + 1);
//        pthread_create(&threads[i], NULL, generateNum, (void *)max_rand);
//        pthread_join(threads[i], &status);
//        
//        node* next_node = new_node;
//        
//        new_node = malloc(sizeof(node));
//        
//        next_node->prev = new_node;
//        new_node->next = next_node;
//        new_node->value = (int)status;
//        new_node->num = i;
        
        // Save the memory location
        node* next_node_loc = current_node;
        
        node* new_node = malloc(sizeof(node));
        current_node->prev = new_node;
        
        // Get the new random value
        pthread_create(&threads[i], NULL, generateNum, (void *)max_rand);
        pthread_join(threads[i], &status);
        
        new_node->next = next_node_loc;
        // new_node->prev = // This will get put in 2 lines above on the next iteration
        new_node->value = (int)status;
        new_node->num = i;
        
        current_node = new_node;
    }
    
    current_node->prev = NULL;
    
    node* working_node = first;
    int i = 0;
    // Go through the linked list and delete any that are within 8 of each other
    while(working_node != NULL) {
        pthread_create(&threads2[i], NULL, checkAround, (void *)working_node);
        pthread_join(threads2[i], &status2);\
        
        working_node->value = (int)status2;
        working_node = working_node->prev;
        i++;
    }
    
    working_node = first;
    while(working_node != NULL) {
        int v = working_node->value;
        printf("%d\n", v);
        working_node = working_node->prev;
        free(working_node);
    }
    
    printf("Finished. Exiting\n");
    
    // Exit 
    return 0;
}