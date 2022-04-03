#include <bits/stdc++.h>
using namespace std;

int main() {
    cout << "Enter what do you want to search" << endl;
    
    string searchData;
    getline(cin, searchData);

    replace(searchData.begin(), searchData.end(), ' ', '_');

    string filename("wikipedia.txt");
    ofstream file_out;
    
    file_out.open(filename, std::ios_base::app);

    cout << "Adding the wikipedia url address to file" << endl;
    string wikipediaUrl = "https://en.wikipedia.org/wiki/" + searchData;

    file_out << wikipediaUrl << endl;

    cout << "wikipedia Url added to file" << endl;

    return 0;
}
