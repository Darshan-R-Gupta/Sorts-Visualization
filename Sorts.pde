import java.util.Arrays;
void selection_sort() {
  if (!(counter < b.arr.size() )) {
    counter = 0;
    b.sorted = true;
  }  
  if (! (counter2 < b.arr.size()) ) {
    counter2 = counter;
  }
  int initial = counter2;
  if (!b.sorted) {
    Bar min = b.arr.get( counter2 ); 
    array_access++;
    for (int i =counter2; i < b.arr.size(); ++i) {
      Bar a = b.arr.get(i);
      array_access++;
      comparisons++;
      if (min.value > a.value) {
        min.selected = false;
        min = a;
        min.selected = true;
      }

      SinFreq += a.value;
    }
    Bar a2 = b.arr.get( initial );
    float temp = min.value;
    min.value = a2.value;
    a2.value = temp;
    a2.selected = true;
    array_access += 2;
    //a2 is new minimum and min is a2;
    SinFreq = map(SinFreq, (b.arr.size()-counter)*low, (b.arr.size()-counter)*height, 20.0, 800.0);
    counter++;
  } else {
    SinFreq = 0;
  }
  counter2++;
}

void double_selection_sort() {
  //Select the max and min in the array and swap it in the last and first positions respec.
  if (!(counter < b.arr.size()/2)) {
    counter =0;
    b.sorted = true;
  }
  if (!b.sorted)
  {
    int max_ind = counter;
    int min_ind = counter;
    int j;
    for (j = counter+1; j < b.arr.size()-counter; ++j) {
      Bar a = b.arr.get(j); 
      comparisons++;//For the max_ind;
      array_access+=2;  //For the below comparison;
      if (b.arr.get(max_ind).value < a.value) {
        max_ind = j;
      } else if (b.arr.get(min_ind).value > a.value) {
        min_ind = j;
        comparisons++;  //If the above comparisons is false
        array_access+=2;   //For the above comparison
      }
    }
    Bar max = b.arr.get(max_ind);
    Bar a1 = b.arr.get(b.arr.size() - counter-1);
    float temp =  max.value;
    max.value = a1.value;
    a1.value = temp;

    if (b.arr.size()-counter-1 == min_ind) {
      min_ind = max_ind;
    }
    Bar a2 = b.arr.get(counter);
    Bar min = b.arr.get(min_ind);
    temp = min.value;
    min.value = a2.value;
    a2.value = temp;
    array_access+= 4;//For the above swapping purposes
    a1.selected = true;
    a2.selected = true;
    SinFreq = map(abs(a1.value - a2.value), 0, height, 20.0, 800.0); 
    counter++;
  } else {
    SinFreq = 0;
  }
  counter2++;
}





//Implementation of Insertion sort
void insertion_sort() {

  if (!(counter < b.arr.size() )) {
    counter =0;
    counter2 =0;
    b.sorted = true;
  }

  if (!b.sorted) {  
    Bar a1 = b.arr.get(counter);
    a1.selected = true;
    array_access++;

    counter2 = counter-1; 

    float temp = a1.value;
    SinFreq += temp;
    int count =0;  //Just to track the no of times the loop executes
    while (counter2 >=0 && b.arr.get(counter2).value > temp) {
      array_access++;  //For the above comparison
      count++;
      comparisons++;
      Bar a2 = b.arr.get( counter2 );
      a2.selected = true;
      array_access++;
      SinFreq += a2.value;
      for (int i= 0; i < b.arr.size(); ++i) {
        if (i != counter && i != counter2)          b.arr.get(i).selected = false;
      }
      Bar a = b.arr.get(counter2 +1);
      a.value = a2.value;
      array_access++;
      counter2--;
    }
    SinFreq = map(SinFreq, temp, (count )*height, 20.0, 800.0);
    Bar b1 = b.arr.get(counter2 +1 );
    b1.value = temp;
    array_access++;
    counter++;
  } else {
    SinFreq =0;
  }
}

//Implementation of bubble sort
void bubble_sort() {

  if (!(counter < b.arr.size()-1) ) {
    counter =0 ;
    b.sorted = true;
  }
  if (! (counter2 < b.arr.size()-counter-1) ) {
    counter2 =0;
    counter++;
  }
  if (!b.sorted) {
    comparisons++;
    array_access+=2;
    Bar a1 = b.arr.get(0), a2 = b.arr.get(1);
    int j;
    for (j = 0; j < b.arr.size() - counter- 1; ++j) {
      a1.selected = false;
      a2.selected = false;
     
      a1 = b.arr.get(j);
      a2 = b.arr.get(j+1);
      array_access+=2;
      SinFreq = map(abs(a1.value+a2.value), 2*low, 2*height, 20.0,800.0);
      a1.selected = true;
      a2.selected = true;
       counter2++;
      comparisons++;
      
      if (a1.value > a2.value) {

        float temp = a1.value;
        a1.value = a2.value;
        a2.value = temp;
        array_access+= 2;
      };
    }
  } else {
    SinFreq =0 ;
  }
}
//Just to show how a bubble sort works with smaller dataset
void deep_bubble_sort(){
if (!(counter < b.arr.size()-2) ) {
    counter =0 ;
    b.sorted = true;
  }
  if (! (counter2 < b.arr.size()-counter-1) ) {
    counter2 =0;
    counter++;
  }
  if (!b.sorted) {
    Bar a1 = b.arr.get(counter2);
    Bar a2 = b.arr.get(counter2+1);
    SinFreq = map(abs(a2.value + a1.value), 2*low, 2*height, 20.0, 800.0);
    comparisons++;
    array_access+=2;
    a1.selected = true;
    a2.selected = true;

    if (a1.value > a2.value) {

      float temp = a1.value;
      a1.value = a2.value;
      a2.value = temp;
      array_access+= 2;

    }
  } else {
    SinFreq =0 ;
  }
  counter2++;
}
void cocktail_shaker_sort() {
   if(!swapped){
     b.sorted = true;
   }
  if (! (counter2 < b.arr.size()-counter-1) ) {
    counter2 =0;
  }
  if(! (counter3>0) ){
    counter3 = b.arr.size() - counter - 2;
  }
  if (!b.sorted) {
    int count =0 ;  //Just to count how much time the Sinfreq is incremented
    comparisons++;
    array_access+=2;
    Bar a1 = b.arr.get(0), a2 = b.arr.get(1);
    int j;
    
    swapped = false;
    for (j = 0; j < b.arr.size() - counter- 1; ++j) {
      a1 = b.arr.get(j);
      a2 = b.arr.get(j+1);
      array_access+=2;
      counter2++;
      comparisons++;
      
      if (a1.value > a2.value) {

        float temp = a1.value;
        a1.value = a2.value;
        a2.value = temp;
        array_access+= 2;
        swapped = true;
      SinFreq += a1.value +a2.value;
        count+=2;
      }
    }
    for (int k = b.arr.size()-counter-2; k >0; --k) {
      a1 = b.arr.get(k);
      a2 = b.arr.get(k-1);
      array_access+=2;
      
      counter3--;
      comparisons++;
      if (a1.value < a2.value) {

        float temp = a1.value;
        a1.value = a2.value;
        a2.value = temp;
        array_access+= 2;
        swapped = true;
        SinFreq += a1.value + a2.value;
      count+=2;
      }
    }
    SinFreq = map( SinFreq, count*low/2, count*height/2, 20.0 , 800.0); 
  } else {
    SinFreq =0 ;
  }
}

int part( int l, int r){
    int i = l;
    int j = r;
    float pivot = b.arr.get(l).value;
    SinFreq = map(abs(pivot), 0, height, 20.0, 800.0);
    b.arr.get(l).selected = true;
    array_access++;
    while(i < j){
        do{ i++;  comparisons++; array_access++; }while(i  < b.arr.size() && pivot > b.arr.get(i).value );
        do{ j--;  comparisons++; array_access++; }while(j > 0 && b.arr.get(j).value > pivot);
        if(i < j && j < b.arr.size()){
            float temp = b.arr.get(i).value;
            b.arr.get(i).value = b.arr.get(j).value;
            b.arr.get(j).value = temp;
            b.arr.get(j).selected = true;
            b.arr.get(i).selected = true;
           array_access+=2;
            // float temp = b.arr.get(i).value;
            // b.arr.get(i).value = b.arr.get(j).value;
            // b.arr.get(j).value = temp;
        }
        
    }
    
    float temp = b.arr.get(l).value;
          b.arr.get(l).value =  b.arr.get(j).value;
          b.arr.get(j).value = temp;
          array_access++;
    // float temp = b.arr.get(l).value;
    // b.arr.get(l).value = b.arr.get(j).value;
    // b.arr.get(j).value = temp;
    return j;
}
void quick_sort(  ){

   //println("called for: " + l + " : " + r);
    // int next_pivot = part(arr,l,r);
//   quick_sort(arr,l,next_pivot);
//   quick_sort(arr,next_pivot+1,r);
  if(b.sorted)  return;
  int l = 0;
  int r = b.arr.size();
  
    //int stack[] = new int[r-l+1];
  if(!b.sorted && stack.empty()){
    stack.push(l);  //stack[++top] = l;
    stack.push(r);  //stack[++top] = r;
  }
    //System.out.println(top);
    if(!stack.empty()){
        r = stack.pop();
        l = stack.pop();
        int pivot = part(l,r);
        //System.out.println("Pivot is: " + pivot);
        if(pivot-1 > l){
            stack.push(l);  //stack[++top] = l;
            stack.push(pivot);  //stack[++top] = pivot;
        }
        if( pivot +1< r ){
            stack.push(pivot+1);  //stack[++top] = pivot+1;
            stack.push(r);  //stack[++top] = r;
        }
    } 
    if(stack.empty()){
      b.sorted = true;
    }
}

void heapify(){
    int n = b.arr.size();
    for(int i = n-1; i >= 0; --i){
        int j = i;
        while(j <n){
            int child = 2*(j)+1;
            if(child >= n-1)  break;   //no childs
            int comp_child = child;
            comparisons++;
            array_access+=2;
            if( b.arr.get(child).value > b.arr.get(child+1).value ){
                comp_child = child;
            }
            else if( child+1 < n ){
                comp_child = child+1;
            }
            comparisons++;
            array_access+=2;
            if( b.arr.get(comp_child).value > b.arr.get(j).value){
                // swap(arr[j], arr[comp_child]);
                float temp = b.arr.get(j).value;
                b.arr.get(j).value = b.arr.get(comp_child).value;
                b.arr.get(comp_child).value = temp;
                
                //b.arr.get(j).selected = true;
                //b.arr.get(comp_child).selected = true;
                Bar a1 = b.arr.get(j);
                Bar a2= b.arr.get(comp_child);
       
            }
            j = comp_child;
        }
    }
}
void delete_heap(int n){
    if(n < 0)   return ;
    int ind = 0;
    int i = 1;
    //float ele = b.arr.get(0).value;
    // swap( arr[0],arr[n-1] );
    
    float temp = b.arr.get(n-1).value;
    b.arr.get(n-1).value = b.arr.get(0).value;
    b.arr.get(0).value = temp;
    array_access+=2;
    while(i < n-1){
        int comp_ind = i;
        comparisons++;
        array_access+=2;
        if(b.arr.get(i).value > b.arr.get(i+1).value ){
            comp_ind = i;
        }
        else if(i+1 < n-1 ){
            comp_ind = i + 1;
        }
        comparisons++;
        array_access+=2;
        if( b.arr.get(comp_ind).value >  b.arr.get(ind).value){
            // swap(arr[ind], arr[comp_ind]);
            //temp = arr[ind];
            //arr[ind] = arr[comp_ind];
            //arr[comp_ind] = temp;
          
            temp = b.arr.get(ind).value;
            b.arr.get(ind).value = b.arr.get(comp_ind).value;
            b.arr.get(comp_ind).value = temp;
            
            b.arr.get(ind).selected = true;
            b.arr.get(comp_ind).selected = true;
            ind = comp_ind;
            
            //Bar a1 = b.arr.get(ind);
            Bar a2 = b.arr.get(ind);
            SinFreq = map(abs(a2.value)*2, 0, height, 20.0, 800.0);
            
        }else  break;
        i = 2*(ind) +1;
    }
}
void heap_sort(){
    if(b.sorted)  return;
    int n = b.arr.size();
    if(counter == 0)  heapify();
    else if(counter == n){
      b.sorted=true;
      return;  
    }
    // else{
    //     for(int i = 1 ; i < n; ++i){
    //         insert_heap(arr,i,compare);
    //     }
    // }
    //for(int i =0; i < n; ++i){
    delete_heap(n-counter);    
    counter++;
   
}
