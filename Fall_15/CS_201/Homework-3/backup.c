#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<pthread.h>

int MAX_RAND = 64;
int COUNT = 1000;
int BUFFER_MAX = 16;

// If this isn't enough space, I'll be shocked
int unculled[1500];
int culled[1000];

int unculled_length;
int page_fault_count;

// Page Fault Percents
double fifo_culled;   //  FIFO      culled    %
double fifo_unculled; //  FIFO      unculled  %

double opt_culled;    //  Optimized culled    %
double opt_unculled;  //  Optimized unculled  %

int buffer[16] = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};

void init_buffer() {
  int b;
  for (b=0;b<BUFFER_MAX;b++) {
    buffer[b] = -1;
  }
}

int genNum() {
    int random_value;
    random_value = rand() % (MAX_RAND);
    
    return random_value;
}

int gBufferIndex(int val_to_check) {
  int m; // Local buffer count
  for (m=0;m<BUFFER_MAX;m++) {
    if (buffer[m] == val_to_check) return -2;
    if (buffer[m] == -1) return m;
  }
  
  return -1;
}

// Initialize main
int main(int argc, char* argv[]) {
  // Check if the number of inputs is correct 
  if (argc != 1) {
      printf("Invalid inputs. Exiting\n");
      return 0;
  }
  
  // Seed the rand
  srand(time(NULL));
  
  // Main loop incrementers
  int i=0; // unculled counter
  int j=0; // culled counter
  int k=0; // duplicate counter
  int l=0; // buffer counter
  int m=0;
  
  int prev_num;
  
  // Generate 1000 random numbers
  while (j<COUNT) {
    int new_num = genNum();

    unculled[i] = new_num;

    printf("#%d\t|\tunculled [%d]\t|\t", i, unculled[i]);

    if (new_num != prev_num) {
      // Mark the index of the number to cull
      culled[j] = new_num;

      printf("culled [%d]\n", culled[j]);

      j++;
    } else {
      printf("DUPLICATE\n");
      k++;
    }

    prev_num = new_num;
    i++;
  }
  
  unculled_length = i;
  
  printf("%d DUPLICATED NUMBERS\n", k);
  
  // FIFO –––––––––––
  printf("\nFIFO\n\n");
  
  // Culled
  page_fault_count = 0;
  
  int page_for_buffer;
  int first_in=0;
  int index_return;
  
  for (j=0;j<COUNT;j++) {
    page_for_buffer = culled[j];
    
    // Get the available index to place the 
    index_return = gBufferIndex(page_for_buffer);
    
    if (index_return >= 0) {
//      printf("Inserting %d at buffer location  %d\n", page_for_buffer, index_return);
      buffer[index_return] = page_for_buffer;
    } else if (index_return == -1) {
      first_in = first_in % BUFFER_MAX;
//      printf("No available spaces. Inserting %d at buffer location %d\n", page_for_buffer, first_in);
      buffer[first_in] = page_for_buffer;
      first_in++;
      page_fault_count++;
    }
  }
  
  // Calculate page fault %
  fifo_culled = (page_fault_count / COUNT) * 100;
  
  printf("Page Faults: %d\n", page_fault_count);
  printf("List Length: %d\n", COUNT);
  
  printf("Culled Percentage: %3.2f%%\n\n", fifo_culled);
  
  l=0;
  page_fault_count = 0;
  init_buffer();
  first_in = 0;
  
  // Unculled
  for (i=0;i<unculled_length;i++) {
    page_for_buffer = unculled[i];
    
    // Get the available index to place the 
    index_return = gBufferIndex(page_for_buffer);
    
    if (index_return >= 0) {
//      printf("Inserting %d at buffer location  %d\n", page_for_buffer, index_return);
      buffer[index_return] = page_for_buffer;
    } else if (index_return == -1) {
      first_in = first_in % BUFFER_MAX;
//      printf("No available spaces. Inserting %d at buffer location %d\n", page_for_buffer, first_in);
      buffer[first_in] = page_for_buffer;
      first_in++;
      page_fault_count++;
    }
  }
  
  // Calculate page fault %
  fifo_unculled = (page_fault_count / unculled_length) * 100;
  
  printf("Page Faults: %d\n", page_fault_count);
  printf("List Length: %d\n", unculled_length);
  
  printf("Unculled Percentage: %3.2f%%\n\n", fifo_unculled);
  
  l=0;
  page_fault_count = 0;
  init_buffer();
  
  // Optimal –––––––––––
  printf("\nOptimal\n\n");
  
  int curr_index;
  int length_per_page[16];
  int curr_buffer;
  int curr_max_length;
  
  // Culled
  for (j=0;j<COUNT;j++) {
    page_for_buffer = culled[j];
    index_return = gBufferIndex(page_for_buffer);
    
    if (index_return >= 0) {
      buffer[index_return] = page_for_buffer;
    } else if (index_return == -1) {
      curr_index = j;
      for (m=0;m<BUFFER_MAX;m++) {
        while (buffer[m] != culled[curr_index]) curr_index++;
        length_per_page[m] = curr_index - j;
        printf("#%d\tCurrent List Numbers: %d\t\tNumber in List: %d\t\tClosest Index: %d\t\tCurrent Length: %d\n", m, buffer[m], culled[curr_index], curr_index, length_per_page[m]);
      }
      
      for (m=0;m<BUFFER_MAX;m++) {
        if (length_per_page[m] > curr_max_length) curr_max_length = m;
      }
      
      printf("Inserting %d in buffer location %d\n", culled[j], curr_max_length);
      buffer[curr_max_length] = culled[j];
      printf("\n\n");
      page_fault_count++;
    }
  }
  
  // Calculate page fault %
  opt_culled = (page_fault_count / COUNT) * 100;
  
  printf("Page Faults: %d\n", page_fault_count);
  printf("List Length: %d\n", COUNT);
  
  printf("Unculled Percentage: %3.2f%%\n\n", opt_culled);
}