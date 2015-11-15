PImage img ;
int radius = 10 ; 
int ileft=0,iright=0,jtop=0,jdown=0;
int sumr=0,sumg=0,sumb=0,a=0,lochead=0,locend=0;
boolean drawSwitch = false; //

void setup () {
  size(300, 300) ;
  img = loadImage("p1.jpg") ;  
  image(img, 0, 0 ) ;
}

void draw() {
  if (mousePressed == true){ 
    drawSwitch=true;
    
       if (mouseX>5){
         ileft=mouseX-5;
       }else {ileft=mouseX;
       }
       if (mouseX<width-5){
         iright=mouseX+5;
       }else {iright=width;
       }
       if (mouseY>5){
         jtop=mouseY-5;
       }else {jtop=mouseY;
       }
       if (mouseY<height-5){
         jdown=mouseY-5;
       }else {jdown=height;
       }
   
     lochead=ileft+jtop*width;
     locend=iright+jdown*width;
     
     loadPixels();
     for (int a=lochead;a<locend;a++){
       sumr+=red(img.pixels[a]);
       sumg+=green(img.pixels[a]);
       sumb+=blue(img.pixels[a]);
     }   
     sumr=sumr/(locend-lochead);
     sumg=sumg/(locend-lochead);
     sumb=sumb/(locend-lochead);
   }
   
   if (drawSwitch==true){   //draw ellipse
     drawSwitch=false;
   //updatePixels();
   colorMode(RGB);
   noStroke();
   fill(sumr,sumg,sumb);
   ellipse(mouseX,mouseY,10,10);
   }
}
