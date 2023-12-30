#include<iostream>
#include<windows.h>
using namespace std;
int main()
{
	short minutes, seconds;
	int time;
	do
	{
		cout<<"enter seconds ::" ;
		cin>>seconds;
	}
	while(seconds>59);
	do{
		cout<<" enter minuts :: " ;
		cin>>minutes;
	}
	while(minutes>59);
	time=(minutes!=0)? minutes*60:0;
	time+=seconds;
	for(int i=time; i>0; i--)
	{

		system("cls");
		cout<<" the time remaining is 0:" <<minutes << ":" << seconds <<endl;
		minutes=(i%60==0)? --minutes:minutes;
		seconds = (seconds==0)? 59: --seconds;
		system("TIMEOUT 1");
	   
	}
	system("cls");
	cout<<" ******************* " << endl;
	cout<<" | " << "  timer ended! " <<" | " << endl;
	cout<<" | " << "  lasted for   " <<" | " << endl;
    cout<<" | " << "  " << time<<" " <<"seconds " <<"    | " << endl;
	cout<<" ******************* " << endl; 
	return 0;
}




