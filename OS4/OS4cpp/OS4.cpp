/*O for this algorithm is (!n)*/

#include <iostream>
using namespace std;

int main()
{
	setlocale(LC_ALL, "Russian");
	int unique = 0, i, j, sizeArr;
	cout << "Äëèíà ìàññèâà: ";
	cin >> sizeArr;
	int *arr = new int[sizeArr];

	for (i = 0; i < sizeArr; i++) {
		cin >> arr[i];
	}
	for (i = 0; i != sizeArr; i++) {
		for (j = i; j != sizeArr; j++ ) {
			if ((i != j) && (arr[i] == arr[j])) {
				unique += 1;
				break;
			}
		}
	}
	cout <<"Êîëè÷åñòâî óíèêàëüíûõ ýëåìåíòîâ: " << (sizeArr - unique);
}
