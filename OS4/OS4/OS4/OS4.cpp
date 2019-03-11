// OS4.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include "pch.h"
#include <iostream>
using namespace std;

int main()
{
	int N;
	int arr[] = { 1, 4, 2, 1, 1, 3, 5 };
	cout << "Digit number: ";
	cin >> N;


	for (int i = 0; i < sizeof(arr); i++)
		for (int j = 0; j < sizeof(arr); j++)
			if (arr[i] == arr[j])
				cout << "double";
			else
				cout << "unique";
	return 0;
}


