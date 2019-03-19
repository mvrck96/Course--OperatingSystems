#include "pch.h"
#include <iostream>
using namespace std;

int main(){
	setlocale(LC_ALL, "Russian");

	int i, sizeArr, buff = 0, distinct = 0;
	cout << "Длина массива: ";
	cin >> sizeArr;
	int *arr = new int[sizeArr];

	for (i = 0; i < sizeArr; i++) {
		cin >> arr[i];
	}

	for (int i = 0; i < sizeArr; i++) {
		if (arr[i] != -1) {
			buff = arr[arr[i]];
			arr[arr[i]] = -1;
		}

		while (buff != -1) {
			buff = arr[buff];
			arr[buff] = -1;
		}
	}

	for (int i = 0; i < sizeArr; i++) {
		if (arr[i] == -1)
			distinct++;
	}
	cout << distinct;
	return 0;
}
