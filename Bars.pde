class Bar{
  float value;  //The height of the bar
  float wid;
  boolean selected;  //Is the bar selected for comparison
  float x;  //The x location of the bar
  Bar(float w, float l, float val, boolean sel){
    wid = w;
    selected = sel;
    value = val;
    x = l;
  }
  Bar(float w,float l){
    wid = w;
    rand();
    selected = false;
    x = l;
  }
  void rand(){
    value = random(low,height);
  }
  
  void display(){
     if(selected){
       fill(0,0,100);
       rect(x,0,wid, height);
     }
     else{
        float hue = map(value, low, height, 10,100 );
        fill(hue,100,100);
     }
     rect(x, height - value, wid, value );
     selected = false;
  }
  
}
class Bars{
  ArrayList<Bar> arr;
  boolean sorted;  //If the array is already sorted   
  Bars(int n, float w){
    arr = new ArrayList<Bar>();
    wid=  w;
    randomize();
    sorted = false;
    for(int i =0; i < n; ++i)
    {  
       Bar a = new Bar(wid, i*(wid+gap)+wid/2 );
       arr.add(a );
    }
  } 
  void randomize(){
    for(int i= arr.size()-1; i >= 0; --i){
      Bar a = arr.get(i);  
      a.rand();
    }
  }
  void display(){
    for(int i = 0; i < arr.size(); ++i){
      Bar a = arr.get(i);
      a.display();
    }
  }
 }
