#include <iostream>
#include <string>    //  This library is used to access function related to the string:
#include <algorithm> // Perform various function like the sorting, searhing removing and modifiying the  element
#include <ctime>     // This is used for obtaining the current time, date and month
#include <random>    // Library used for genertating of the pesudo number
using namespace std;
void printArt();
int main()
{

    printArt();
    cout << "\n\n";
    cout << "Welcome to Password Generator" << endl;

    // User inputs:
    while (true)
    {
        int num_letters, num_numbers, num_symbols;
        cout << "How many letters do you want in your password? ";
        cin >> num_letters;
        cout << endl;
        cout << "How many numbers do you want in your password? ";
        cin >> num_numbers;
        cout << endl;
        cout << "How many symbols do you want in your password? ";
        cin >> num_symbols;
        cout << endl;
        //  Data used for generation of password:
        string letters_upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        string letters_lower = "abcdefghijklmnopqrstuvwxyz";
        string numbers = "0123456789";
        string symbols = "!@#$%^&*()_+-=[]{}|;:',.<>?";

        // Seed the random number generator using time
        mt19937 generator(time(0)); // This is an algorithm used for generation of random numbers. The time(0) for retriving the current
                                    // time in nanosecond for generation random number.

        // Shuffle each category separately
        shuffle(letters_upper.begin(), letters_upper.end(), generator);
        shuffle(letters_lower.begin(), letters_lower.end(), generator);
        shuffle(numbers.begin(), numbers.end(), generator);
        shuffle(symbols.begin(), symbols.end(), generator);

        // Select the desired number of characters from each category
        string password = letters_upper.substr(0, num_letters) +
                          letters_lower.substr(0, num_letters) +
                          numbers.substr(0, num_numbers) +
                          symbols.substr(0, num_symbols);

        // Shuffle the password string to ensure randomness
        shuffle(password.begin(), password.end(), generator);
        cout << "This is your password requirements:   \n\n";
        cout << password << endl;
        int program;
        cout << "Enter (1) for contiuing and (0) to exit; ";
        cin >> program;
        if (program == 0)
        {
            return false;
        }
    }
    system("pause");
}

void printArt() // Function for printing the ascii art:
{
    cout
        << R"(
 /$$$$$$$                            /$$                                                       
| $$__  $$                          | $$                                                       
| $$  \ $$  /$$$$$$  /$$$$$$$   /$$$$$$$  /$$$$$$  /$$$$$$/$$$$                                
| $$$$$$$/ |____  $$| $$__  $$ /$$__  $$ /$$__  $$| $$_  $$_  $$                               
| $$__  $$  /$$$$$$$| $$  \ $$| $$  | $$| $$  \ $$| $$ \ $$ \ $$                               
| $$  \ $$ /$$__  $$| $$  | $$| $$  | $$| $$  | $$| $$ | $$ | $$                               
| $$  | $$|  $$$$$$$| $$  | $$|  $$$$$$$|  $$$$$$/| $$ | $$ | $$                               
|__/  |__/ \_______/|__/  |__/ \_______/ \______/ |__/ |__/ |__/                               
                                                                                               
                                                                                               
                                                                                               
 /$$$$$$$                                                                      /$$             
| $$__  $$                                                                    | $$             
| $$  \ $$ /$$$$$$   /$$$$$$$ /$$$$$$$ /$$  /$$  /$$  /$$$$$$   /$$$$$$   /$$$$$$$             
| $$$$$$$/|____  $$ /$$_____//$$_____/| $$ | $$ | $$ /$$__  $$ /$$__  $$ /$$__  $$             
| $$____/  /$$$$$$$|  $$$$$$|  $$$$$$ | $$ | $$ | $$| $$  \ $$| $$  \__/| $$  | $$             
| $$      /$$__  $$ \____  $$\____  $$| $$ | $$ | $$| $$  | $$| $$      | $$  | $$             
| $$     |  $$$$$$$ /$$$$$$$//$$$$$$$/|  $$$$$/$$$$/|  $$$$$$/| $$      |  $$$$$$$             
|__/      \_______/|_______/|_______/  \_____/\___/  \______/ |__/       \_______/             
                                                                                               
                                                                                               
                                                                                               
  /$$$$$$                                                     /$$                              
 /$$__  $$                                                   | $$                              
| $$  \__/  /$$$$$$  /$$$$$$$   /$$$$$$   /$$$$$$  /$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$       
| $$ /$$$$ /$$__  $$| $$__  $$ /$$__  $$ /$$__  $$|____  $$|_  $$_/   /$$__  $$ /$$__  $$      
| $$|_  $$| $$$$$$$$| $$  \ $$| $$$$$$$$| $$  \__/ /$$$$$$$  | $$    | $$  \ $$| $$  \__/      
| $$  \ $$| $$_____/| $$  | $$| $$_____/| $$      /$$__  $$  | $$ /$$| $$  | $$| $$            
|  $$$$$$/|  $$$$$$$| $$  | $$|  $$$$$$$| $$     |  $$$$$$$  |  $$$$/|  $$$$$$/| $$            
 \______/  \_______/|__/  |__/ \_______/|__/      \_______/   \___/   \______/ |__/            
                                                                                               
                                                                                               
                                                                                               
)";
}
