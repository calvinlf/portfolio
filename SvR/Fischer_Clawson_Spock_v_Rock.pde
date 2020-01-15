/* @pjs preload="rock.jpg","ammo.jpg","bomb.jpg","health.jpg","money.jpg","can.jpg","def.jpg","KaBoom.jpg"; */

int x=120;

int shield=125;
int bullets=4;

int fuel=6000;


int rand1=0;
int rand2=0;
int rand3=0;
int rand4=0;
int randfuel=0;
int rand5=0;


int d1=0;
int d2=80;
int d3=160;
int d4=240;
int dfuel=320;
int d5=320;

float speed=0;

//scorekeeping
int score=0;
int endswitch=0;

int countsp=0;
int randsp=0;
int x_sp=0;

int x_bullets=0;
int y_bullets=0;
int countbullets=4;

int timer=1;
int timer1=1;
int timer3=600;


int stayshield=125;

PImage rock;
PImage ammo;
PImage bomb;
PImage health;
PImage money;
PImage can;
PImage deff;
PImage kaboom;

void setup(){
  size(250,400);
  cursor(CROSS);
  noStroke();  
  rock = loadImage("rock.jpg");
  ammo = loadImage("ammo.jpg");
  bomb = loadImage("bomb.jpg");
  health = loadImage("health.jpg");
  money = loadImage("money.jpg"); 
  can = loadImage("can.jpg");
  deff = loadImage("def.jpg");  
  kaboom = loadImage("KaBoom.jpg"); 
}


void draw(){
  
  background(0);
  frameRate(250+speed);
  speed=speed+.001;
  
  noStroke();
  
  //score
  if(endswitch==0){score++;}
  fill(0,255,0);
  textSize(12);
  text("score:",170,35);
  text(score,210,35);
  
  //spaceship
  fill(0);
  rect(x,360,20,20);
  fill(190);
  rect(x+8,360,4,20);
  rect(x+6,360+14,8,6);
  rect(x,360+16,20,2);
  fill(0,0,200);
  rect(x,360+8,3,12);
  rect(x+17,360+8,3,12);
  fire(x,380);
  fire(x+17,380);
  x=mouseX-10;
  
  //shooting
  if(bullets>0){
    if(y_bullets>0){
  fill(180,0,255);
  rect(x_bullets,y_bullets+4,4,8);
  rect(x_bullets+4,y_bullets,4,8);
  rect(x_bullets+8,y_bullets+4,4,8);
  y_bullets--;
  }}
  if(y_bullets==1){bullets=bullets-1;}
  for(int i=50; i<countbullets*20+50; i=i+20){
  fill(180,0,255);
  rect(230-6,i+4,4,8);
  rect(230-2,i,4,8);
  rect(230+2,i+4,4,8);
  }

  
  
  
  //rocks
 debris(rand1,d1);
 if(d1==400){d1=0;}
 if (d1==0){rand1=int(random(10,220));}
 d1++;  
 
 debris(rand2,d2);
 if(d2==400){d2=0;}
 if (d2==0){rand2=int(random(10,220));}
 d2++; 
 
 debris(rand3,d3);
 if(d3==400){d3=0;}  
 if (d3==0){rand3=int(random(10,220));}
 d3++; 
 
 debris(rand4,d4);
 if(d4==400){d4=0;}
 if (d4==0){rand4=int(random(10,220));}
 d4++;  
 
 if(randfuel>250){debris(rand5,d5);}
 if(d5==400){d5=0;}
 if (d5==0){rand5=int(random(10,220));}
 d5++; 
 
 
 
 //fuel
 fill(0,255,0);
 textSize(12);
 text("fuel:",170,15);
 text(fuel,200,15);
 fuel--;
 fill(255,0,0);
 rect(randfuel,dfuel,20,20);
 image(can,randfuel,dfuel);
 if(dfuel==400){dfuel=0;}
 if (dfuel==0){randfuel=int(random(1,900));} //likelyhood of fuel
 dfuel++;
 if(randfuel>220){randfuel=260;}
 if(fuel<1000){
  timer1++;
  if(timer1==3){timer1=0;}
  if(timer1<2){
    fill(255,0,0);
    textSize(50);
    text("Low",60,170);
    text("Fuel",58,255);}}
  
 //interacation
 if(x+20>randfuel){
    if(x<randfuel+20){
      if(dfuel>340){
        if(dfuel<380){
          fuel=6000;
          randfuel=400;
          rand5=400;}}}}
 
  hit(rand1,d1);
  hit(rand2,d2);
  hit(rand3,d3);
  hit(rand4,d4);
  if(randfuel>250){
  hit(rand5,d5);}
  
  if(x_bullets<rand1+20){
    if(x_bullets+12>rand1){
      if(d1+20>y_bullets){
        if(d1<y_bullets){
           y_bullets=2;
           x_bullets=0;
           rand1=260;}}}}
  if(x_bullets<rand2+20){
    if(x_bullets+12>rand2){
      if(d2+20>y_bullets){
        if(d2<y_bullets){
           y_bullets=2;
           x_bullets=0;
           rand2=260;}}}}
  if(x_bullets<rand3+20){
    if(x_bullets+12>rand3){
      if(d3+20>y_bullets){
         if(d3<y_bullets){
           y_bullets=2;
           x_bullets=0;
           rand3=260; }}}}
  if(x_bullets<rand4+20){
    if(x_bullets+12>rand4){
      if(d4+20>y_bullets){
        if(d4<y_bullets){
           y_bullets=2;
           x_bullets=0;
           rand4=260;}}}}
  if(randfuel>250){
  if(x_bullets<rand5+20){
    if(x_bullets+12>rand5){
      if(d5+20>y_bullets){
        if(d5<y_bullets){
           y_bullets=2;
           x_bullets=0;
           rand5=260;
        }}}}}
      
  //shield bar
  fill(0,0,225);
  rect(10,10,shield,20);
  fill(0);
  textSize(24);
  text("Shield",10,30);
  
  countsp++;
  if(countsp==410){countsp=0;
                   randsp=int(random(0,100)); 
                   x_sp=int(random(10,220));}
  if(randsp>0 && randsp<11){nuke();}
        if (timer==10){timer=0;}
          if (timer>=1){timer++;
                        fill(225);
                        rect(0,0,250,400);}
  if(randsp>10 && randsp<15){heal();}
  if(randsp>15 && randsp<30){cash();}
  if(randsp>30 && randsp<45){gun();}
  if(randsp>45 && randsp<50){defend();}
          if (timer3>=1){timer3--;
                        shield=stayshield;
                        noFill();
                        strokeWeight(6);
                        stroke(225);
                        arc(x+10,370,20,20,PI,TWO_PI);
                        
                      }
  

  //death
  if(shield<=0){end();}
  if(fuel<=0){end();}  
  }
    

void mousePressed(){
      if (bullets>0) {
        if (y_bullets==0){
      x_bullets=mouseX-6;
      y_bullets=352;
      countbullets=countbullets-1;
      }}

} 


void fire(int n, int n1){
  fill(int(random(150,225)),int(random(1,150)),int(random(1,50)));
  rect(0+n,0+n1,1,1);
  fill(int(random(150,225)),int(random(1,150)),int(random(1,50)));
  rect(0+n,1+n1,1,1);
  fill(int(random(150,225)),int(random(1,150)),int(random(1,50)));
  rect(1+n,2+n1,1,1);
  fill(int(random(150,225)),int(random(1,150)),int(random(1,50)));
  rect(1+n,3+n1,1,1);  
  fill(int(random(200,225)),int(random(50)),int(random(50)));
  rect(1+n,1+n1,1,1);
  fill(int(random(200,225)),int(random(0)),int(random(0)));
  rect(1+n,0+n1,1,1);
  fill(int(random(150,225)),int(random(1,150)),int(random(1,50)));
  rect(2+n,0+n1,1,1);
  fill(int(random(150,225)),int(random(1,150)),int(random(1,50)));
  rect(2+n,1+n1,1,1);
}


void debris(int n,int n2){
  //fill(125,75,0);
  //rect(n,n2,20,20);
  image(rock,n,n2);
  }

void hit(int n,int n2){
  if(x+20>n){
    if(x<n+20){
      if(n2>340){
        if(n2<380){ 
          shield--;
        }}}}}

      

void end(){
  fill(90);
  rect(0,0,250,400);
  image(kaboom,0,116);
  fill(0,225,0);
  textSize(50);
  text("Rock",60,170);
  text("Wins!",58,255);
  endswitch++;
  textSize(12);
  text("score:",80,320);
  text(score,120,320);
  if(endswitch==1000){exit();}
}

void nuke(){
 fill(255,255,0);
 rect(x_sp,countsp,20,20);
 image(bomb,x_sp,countsp);
   if(x+20>x_sp){
    if(x<x_sp+20){
      if(countsp>340){
        if(countsp<380){
          rand1=401;
          rand2=401;
          rand3=401;
          rand4=401;
          randfuel=401;
          rand5=401;
          countsp=409;
          fill(225);
          rect(0,0,250,400);
          timer++;
          score=score+1000;
          }}}}
}

void heal(){
 fill(0,0,255);
 rect(x_sp,countsp,20,20);
 image(health,x_sp,countsp);
   if(x+20>x_sp){
    if(x<x_sp+20){
      if(countsp>340){
        if(countsp<380){
shield=125;
score=score+500;
countsp=409;
          }}}}
}

void cash(){
 fill(0,225,0);
 rect(x_sp,countsp,20,20);
 image(money,x_sp,countsp); 
   if(x+20>x_sp){
    if(x<x_sp+20){
      if(countsp>340){
        if(countsp<380){
score=score+int(random(1000,5000));
countsp=409;
          }}}}
}

void gun(){
 fill(180,0,225);
 rect(x_sp,countsp,20,20);
 image(ammo,x_sp,countsp);
   if(x+20>x_sp){
    if(x<x_sp+20){
      if(countsp>340){
        if(countsp<380){
          bullets=4;
          countbullets=4;
          countsp=409;
          }}}}
}

void defend(){
   fill(225);
 rect(x_sp,countsp,20,20);
 image(deff,x_sp,countsp);
   if(x+20>x_sp){
    if(x<x_sp+20){
      if(countsp>340){
        if(countsp<380){
  timer3=1000;
  stayshield=shield;
  countsp=409;
        }}}}

}
