#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define ROWS 800
#define COLS 800

void fill_random(int array[ROWS][COLS], int max);
void copyByRows(int src[ROWS][COLS], int dst[ROWS][COLS]);
void copyByCols(int src[ROWS][COLS], int dst[ROWS][COLS]);

int main(void){

	srand(time(NULL));
	
	//Initial arrays
	int A[ROWS][COLS];
	int B[ROWS][COLS];
	int C[ROWS][COLS];

	//Initial variables for time spent 
	double time_spent_rows = 0.0;
	double time_spent_cols = 0.0;
	
	//Filling array with random integers
	fill_random(A, 10);

	//Copy by Rows
	clock_t beginRows = clock();	//Tracking when the copyByRows function begins
	copyByRows(A, B);
	clock_t endRows = clock();		//Tracking when copyByRows function ends
	//Difference between clock ticks at beginning and end of running the function divided by
	//the CLOCKS_PER_SEC to convert into seconds
	time_spent_rows += (double)(endRows - beginRows) / CLOCKS_PER_SEC;
	printf("It took %f seconds to copy row by row.\n", time_spent_rows);

	//Copy by Columns
	clock_t beginCols = clock();    //Tracking when the copyByCols function begins
        copyByCols(A, C);
        clock_t endCols = clock();              //Tracking when copyByCols function ends
        //Difference between clock ticks at beginning and end of running the function divided by
        //the CLOCKS_PER_SEC to convert into seconds
        time_spent_cols += (double)(endCols - beginCols) / CLOCKS_PER_SEC;
        printf("It took %f seconds to copy column by column.\n", time_spent_cols);


	return 0;
}

//fill_random fills a 2D array with random integers with a max number.

void fill_random(int array[ROWS][COLS], int max){
	for (int i = 0; i < ROWS; i++){
		for (int j = 0; j < COLS; j++){
			array[i][j] = (rand() % max) + 1;
		}
	}

}

//copyByRows copies the source array into the destination array row by row

void copyByRows(int src[ROWS][COLS], int dst[ROWS][COLS]){
	for(int i = 0; i < ROWS; i++){
		for(int j = 0; j < COLS; j++){
			dst[i][j] = src [i][j];
		}
	}
}

//copyByCols copies the source array into the destination array column by column

void copyByCols(int src[ROWS][COLS], int dst[ROWS][COLS]){
        for(int j = 0; j < ROWS; j++){
                for(int i = 0; i < COLS; i++){
                        dst[i][j] = src [i][j];
                }
        }
}



