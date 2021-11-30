//
//  main.cpp
//  lab5asmcpp
//
//  Created by Artyom on 22.11.21.
//

#include <iostream>
#include <iomanip>
using namespace std;

int main() {
    
    int N;
    
    cout << "Enter N (N <= 10): ";
    cin >> N;
    
    if(N > 10){
        cout << "Wrong Input!" << endl;
        return 0;
    }
    
    if(N <= 0){
        cout << "Wrong Input!" << endl;
        return 0;
    }
    
    cout << endl;
    
    int **matrix = new int*[N];
    for(int i = 0; i < N; ++i) {
        matrix[i] = new int[N];
    }
    
    //int **array = new int[N][N];
    
    for(int i = 0; i < N; i++){
        for(int j = 0; j < N; j++){
            cout << "["<< i + 1 <<"]"<<"["<< j + 1 <<"]" << " = ";
            cin >> matrix[i][j];
        }
    }
    
    cout << endl << "Matrix: " << endl;
    
    for(int i = 0; i < N; i++){
        for(int j = 0; j < N; j++){
            cout << setw(4) << matrix[i][j];
        }
        cout << endl;
    }
    
    cout << endl;
    
    cout << "Upper Triangle: ";
    
    float tempUpper = 0;
    
    for (int i = 0; i < N; i++){
        for (int j = 0; j < N; j++){
            if (i > j){
            }
            else if(i == j){
            }
            else{
                //if(tempUpper == 0){
                //    tempUpper = matrix[i][j];
                // }
                if(tempUpper < matrix[i][j]){
                    tempUpper = (float)matrix[i][j];
                }
                
                cout << setw(4) << matrix[i][j];
            }
        }
    }
    
    cout << endl;
    cout << "Max element at upper triangle: " << tempUpper;
    cout << endl << endl;
    
    cout << "Lower Triangle: ";
    float tempLower = INT_MAX;
    
    for (int i = 0; i < N; i++){
        for (int j = 0; j < N; j++){
            if (i < j){
            }
            else if(i == j){
            }
            else{
                if(tempLower > matrix[i][j]){
                    tempLower = (float)matrix[i][j];
                }
                cout << setw(4) << matrix[i][j];
            }
        }
    }
    
    cout << endl;
    cout << "Min element at lower triangle: " << tempLower;
    cout << endl << endl;
    
    
    float border = (tempUpper - tempLower) * 0.1;
    
    cout << "10% is: " << border << endl << endl;
    
    do{
        
        
        float tempUpperAuto = tempUpper - tempUpper * 0.3;
        float tempLowerAuto = tempLower + tempLower * 0.3;
        
        //auto tempUpperAuto = tempUpper;
        //auto tempLowerAuto = tempLower;
        
        //tempUpperAuto  -= temp1;
        // tempLowerAuto += temp2;
        
        cout << "Max - 30%: " << tempUpperAuto << endl;
        cout << "Min + 30%: " << tempLowerAuto << endl;
        
        cout << endl;
        
        tempUpper = tempUpperAuto;
        tempLower = tempLowerAuto;
    }
    while (tempUpper - tempLower > border);
    
    cout << "Difference lower than 10%" << endl;
    
    
    for(int i = 0; i < N; ++i) {
        delete [] matrix[i];
    }
    delete [] matrix;
    
    return 0;
}
