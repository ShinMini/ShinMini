#include <iostream>
#include <string>
using namespace std;

void gotoDir(string choice) {
    if (choice == "mini" || choice == "1") {
        cout << "cd ~/Workspace/personal" << endl;
    } else if (choice == "work" || choice == "2") {
        cout << "cd ~/Workspace/sotatek" << endl;
    } else if (choice == "down" || choice == "3") {
        cout << "cd ~/Downloads" << endl;
    } else if (choice == "desk" || choice == "4") {
        cout << "cd ~/Desktop" << endl;
    } else if (choice == "memo" || choice == "5") {
        cout << "cd ~/Desktop/memo" << endl;
    } else {
        cout << "Invalid parameter: " << choice << endl;
    }
}

int main(int argc, char *argv[]) {
    string choice;
    if(argc == 2) {
       choice = argv[1];
    } else {
        cout << "Where do you want to go?" << endl;
        cout << "1. mini\n2. work\n3. down\n4. desk\n5. memo" << endl;
        cout << "Please choose the number: ";
        cin >> choice;
    }

    gotoDir(choice);
    return 0;
}
