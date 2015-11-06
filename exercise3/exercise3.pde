PImage water;
PImage flower_danger;
PImage flower_safe;
PImage flower_warning;

int []numbers= new int [25];
int []numbers_hps=new int [5];
void setup()
{
  size(500,500);
  water= loadImage("water.png");
  flower_danger=loadImage("flower_danger.png");
  flower_safe=loadImage("flower_safe.png");
  flower_warning=loadImage("flower_warning.png");
}

void draw()
{
  background(255);
  for(int i=0;i<numbers.length;i++){
    image(water, numbers[i],i*20 );
  }
  
  for(int i=24;i>=0;i--){
    if(i==0){
    numbers[i]=mouseX;
    }else{
    numbers[i]=numbers[i-1];
    }
  }
  for(int i =0;i<numbers_hps.length;i++){
    if(numbers[24]>=50+i*80 && numbers[24]<=50+i*80+flower_danger.width){
      numbers_hps[i]+=10;
    }else{
      numbers_hps[i]--;
    }
    if(numbers_hps[i]>100){
      numbers_hps[i]=100;
    }
  }
  
  for(int i =0;i<numbers_hps.length;i++){
    if(numbers_hps[i]>80){
      image(flower_safe, 50+i*80, height-flower_safe.height);
    }else if(numbers_hps[i]<=80 && numbers_hps[i]>40){
      image(flower_warning, 50+i*80,height-flower_warning.height);
    }else{
      image(flower_danger,50+i*80, height-flower_danger.height);
    }
  }
  
}
