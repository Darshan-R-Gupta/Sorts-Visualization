import processing.sound.*;
import java.util.*;
int low = 10;  //The least value a bar can get;
long comparisons = 0;//The number of comparisons
long array_access =0;//The number of times it accesses OR changes the elements of the array

SinOsc sin;

TriOsc fin;  //The final sound;

float wid;
Bars b;
boolean swapped = true;
int array_length =400;
int counter =0;  //The i variable
int counter2 = 0;  //The j variable
int counter3 = 0;  //The k variable (if needed)
Stack<Integer> stack;   //Stack for iterative version of recursive functions
int gap =1;  //The gaping between the bars

int hk=0;
float SinFreq=0;
boolean made_final_sound = false;  //The sound when it has finished sorting
char curr_sort = 'q'; //b for bubble sort
                      //s for selection sort
                      //i for insertion sort
                      //d for double selection sort
                      //c for cocktail shaker sort
void setup(){
  colorMode(HSB,100);
  fullScreen();
  //size(800,600);
  counter = 0;
  counter2 =0;
  if(curr_sort =='i')  counter =1;
  wid = width/array_length;
  b = new Bars(int(width/(wid+gap)) -1, wid );  

     // create and start the oscillator.
  
  sin = new SinOsc(this);
  sin.play();
  sin.amp(1.0);

  fin = new TriOsc(this);
//  fin.play();
  fin.freq(0); 
  fin.amp(1.0);
  counter = 0;
  counter2 = b.arr.size();
  stack = new Stack<Integer>();
  //quick_sort(0,b.arr.size());
  fill(100);
  noStroke();
}
void draw(){
  background(0);
  if(curr_sort == 'b'){
    deep_bubble_sort();   
    textSize(30);
     fill(100,100,100);
     text("Bubble Sort with small dataset (just to visualize it properly):",50,50);
     
  }
  else if(curr_sort == 'B')
   {
     textSize(30);
     fill(100,100,100);
     text("Bubble Sort:",50,50);
     bubble_sort();  
   }
  else if(curr_sort == 's'){
    selection_sort();
     textSize(30);
     fill(30,100,100);
     text("Selection Sort:",50,50);
  }
  else if(curr_sort == 'i'){
    insertion_sort();
    
     textSize(30);
     fill(80,100,100);
     text("Insertion Sort:",50,50);
  }
  else if(curr_sort == 'd'){
    double_selection_sort();
    textSize(30);
    fill(80,100,100);
    text("Double Selection Sort:",50,50);
  }
  else if(curr_sort == 'c'){
    cocktail_shaker_sort();
    textSize(30);
    fill(80,100,100);
    text("Cocktail Shaker Sort:",50,50);
  } //<>//
  else if(curr_sort == 'h'){
    heap_sort();
    textSize(30);
    fill(80,100,100);
    text("Heap sort:",50,50);
  }
  else{
    quick_sort(  ); 
    textSize(30);
    fill(80,100,100);
    text("Quick Sort:",50,50);
  }
  b.display();
  
 sin.freq(SinFreq);
 //text(SinFreq, 50, 250);
/* if(b.sorted && !made_final_sound){

     b.arr.get(hk).selected= true;
     fin.freq( map(b.arr.get(hk).value,0,height, 20.0, 1000.0) );
      if(b.arr.size()> 50){
        hk+=5;
      }
      else{
          hk++;
      }
      if(hk >= b.arr.size()){
       made_final_sound = true;
       fin.freq(0);
        hk = 0;  
      }
  }*/
  fill(100,0,100);
  textSize(20);
  text("\nComparisons: " + comparisons + "\n"+ "Array access: " + array_access
        +"\nArray Length: " + b.arr.size() , 50,50);
}

//if any sorting key is being pressed
boolean sorting_key_pressed(char c){
  return (c == 'b' || c == 'B' || c == 's' || c == 'S' || c == 'i' || c == 'I'
          || c == 'D' || c == 'd' || c == 'c' || c == 'C' || c == 'q' || c == 'Q' || c == 'h' || c == 'H');
}
void keyPressed(){ //<>//
  if(key == ' '){
    counter= 0;
    counter2 =0;
    made_final_sound = false;
    b = new Bars(int(width/(wid+gap)) -1, wid );
    comparisons = 0;
    array_access =0;
    swapped = true;
  }
  else if(sorting_key_pressed(key) ){
    counter =0 ;
    counter2 =0;
    comparisons = 0;
    array_access = 0;
   SinFreq =0;
  made_final_sound = false;
    if(key == 'B' || key == 'b'){
       if(key == 'B')
       {//Normal visualisation
         array_length = 400;
         curr_sort = 'B';
       }
       else{//Showing the process
        array_length = 30;
        curr_sort = 'b';
       counter2 =1;  
     }
    }
    else if(key =='s' || key == 'S'){
      array_length = 400;
      curr_sort = 's';
    }
    else if(key == 'i' || key == 'I'){
      array_length = 400;
      curr_sort = 'i';
    }
    else if (key == 'd' || key == 'D'){
        array_length = 400;
        curr_sort = 'd';
    }
    else if(key == 'q' || key == 'Q'){
      array_length = 400;
      stack = new Stack<Integer>();
      curr_sort = 'q';
    }
    else if(key == 'H' || key == 'h'){
      array_length = 400;
      curr_sort = 'h';
    }
    else{
        array_length = 400;
        swapped = true;
        curr_sort = 'c';
    }
    wid= width/array_length;    
    
    b = new Bars(int(width/(wid+gap)) -1, wid  );
  }
}
