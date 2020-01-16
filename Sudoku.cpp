#include <iostream>
#include <fstream>
using namespace std;

bool noZero(int board[9][9]) {
    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
            if (board[i][j] == 0){
                return false;
            }
        }
    }
    return true;
}

bool has1(bool canBe[10]) {
    int numTrue = 0;
    for (int i = 0; i < 10; i++) {
        if (canBe[i]) {
            numTrue++;
        }
    }
    return numTrue == 1;
}

void printBoard(int board[9][9]) {
    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
            cout << board[i][j] << " ";
        }
        cout << endl;
    }
    cout << endl;
}

int main() {
    int board[9][9];
    ifstream text("C:\\Users\\CalPC\\Projects\\Suduko\\text.txt");
    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
            text >> board[i][j];
        }
    }

    while (!noZero(board)) {
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                if (board[i][j] == 0) {
                    bool canBe[10];
                    for (int o = 0; o < 10; o++) {
                        canBe[o] = true;
                    }
                    canBe[0] = false;
                    //check column
                    for (int o = 0; o < 9; o++) {
                        canBe[board[i][o]] = false;
                    }
                    //check row
                    for (int o = 0; o < 9; o++) {
                        canBe[board[o][j]] = false;
                    }
                    //check box
                    for (int o = 0; o < 9; o++) {
                        int x;
                        int y;
                        if(i < 3) {
                            x = 0;
                        } else if(i < 6) {
                            x = 3;
                        } else {
                            x = 6;
                        }
                        if(j < 3) {
                            y = 0;
                        } else if (j < 6) {
                            y = 3;
                        } else {
                            y = 6;
                        }
                        for (int x1 = x; x1 < x + 3; x1++){
                            for (int y1 = y; y1 < y + 3; y1++){
                                canBe[board[x1][y1]] = false;
                            }
                        }
                    }
                    if (has1(canBe)) {
                        int newNum = 0;
                        for (int t = 0; t < 10; t++) {
                            if (canBe[t]) newNum = t;
                        }
                        board[i][j] = newNum;
                        cout << "x=" << i + 1 << ", y=" << j + 1 << ", The new number is " << newNum << endl;
                        printBoard(board);

                    }
                }
            }
        }
    }


    return 0;
}