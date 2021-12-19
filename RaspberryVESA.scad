//
// RPi 3A+ VESA mount kit.
//

include <rpi.scad>;

$fn=80;

vesa=100;
vesaDia=10;
vesaHeight=4;

caseThick=2;
caseX=piX+2*caseThick+0.5;
caseY=piY+2*caseThick+0.5;
caseHeight=caseThick+10;

spacerHeight=2;

function radius(x) = x*cos(45)/(1-cos(45));

x_radius=radius(caseY/2-vesaDia*sqrt(2));
y_radius=radius(caseX/2-vesaDia*sqrt(2));

//module bottom_spacer() {
//
//    difference() {
//        difference() {
//            cylinder(r=4,h=spacerHeight);
//            translate([0,0,spacerHeight/2])cylinder(d=1.5,h=spacerHeight);
//        }
//        translate([0,0,2]) {
//            rotate_extrude() {
//                translate([4,0,0])circle(r=2);
//            }
//        }
//    }
//}

//bottom_spacer();

//module vesa_bottom() {

//difference() {
//    translate([vesa/2,(vesa-caseY)/2-x_radius,0]){
//        rotate([0,0,45]){
//            cube([(2*x_radius+caseY)/sqrt(2),(2*x_radius+caseY)/sqrt(2), vesaHeight]);
//        }
//    }
//    //X-OUTER CUT
//        translate([vesa/2,(vesa-caseY)/2-x_radius,0])cylinder(r=x_radius,h=vesaHeight);    
//        translate([vesa/2,(vesa+caseY)/2+x_radius,0])cylinder(r=x_radius,h=vesaHeight);    
    //Y-CUT
//    translate([(vesa-caseY)/2-x_radius,(vesa-caseY)/2-x_radius,0]){
//        rotate([0,0,45]){
//           cube([(2*x_radius+caseY)/sqrt(2),(2*x_radius+caseY)/sqrt(2), vesaHeight]);
//        }
//    }
//    translate([vesa/2+(2*x_radius+caseY)/2,(vesa-caseY)/2-x_radius,0]){
//        rotate([0,0,45]){
//            cube([(2*x_radius+caseY)/sqrt(2),(2*x_radius+caseY)/sqrt(2), vesaHeight]);
//        }
//    }
//}

//difference() {
//   translate([vesa/2,(vesa-caseX)/2-y_radius,0]){
//        rotate([0,0,45]){
//            cube([(2*y_radius+caseX)/sqrt(2),(2*y_radius+caseX)/sqrt(2), vesaHeight]);
//        }
//    }
//    //Y-OUTER CUT
//        translate([(vesa-caseX)/2-y_radius,vesa/2,0])cylinder(r=y_radius,h=vesaHeight);    
//        translate([(vesa+caseX)/2+y_radius,vesa/2,0])cylinder(r=y_radius,h=vesaHeight);    
    //X-CUT
//    translate([vesa/2,(vesa-caseX)/2-y_radius,0]){
//    rotate([0,0,45]){
//            cube([(2*y_radius+caseX)/sqrt(2)/2,(2*y_radius+caseX)/sqrt(2)/2, vesaHeight]);
//        }
//    }
//    translate([vesa/2,vesa/2,0]){
//        rotate([0,0,45]){
//            cube([(2*y_radius+caseX)/sqrt(2)/2,(2*y_radius+caseX)/sqrt(2)/2, vesaHeight]);
//        }
//    }
//}

//PI
//color("red"){
//     difference() {
//        translate ([(vesa-caseX)/2,(vesa-caseY)/2,vesaHeight]) cube([caseX, caseY, piThick]);
//        translate ([(vesa-caseX)/2+caseThick,(vesa-caseY)/2+caseThick,vesaHeight-1]) cube([piX, piY, piThick+2]);
//    }
//}

//difference() {
//    //VESA1
//    hull() {
//        translate([0,0,0]) cylinder(r=vesaDia, h=vesaHeight);
//        translate([vesa,vesa,0]) cylinder(r=vesaDia, h=vesaHeight);
//    }
//    //M4
//    translate([0,0,-3.5])cylinder(r=4,h=10);
//    translate([0,0,vesaHeight-2.2])cylinder(r1=4, r2=7.3, h=2.2);
//    translate([vesa,vesa,-3.5])cylinder(r=4,h=10);
//    translate([vesa,vesa,vesaHeight-2.2])cylinder(r1=4, r2=7.3, h=2.2);
//}

//difference() {
//    //VESA2
//    hull() {
//        translate([vesa,0,0]) cylinder(r=vesaDia, h=vesaHeight);
//        translate([0,vesa,0]) cylinder(r=vesaDia, h=vesaHeight);
//    }
//    //M4
//    translate([vesa,0,-3.5])cylinder(r=4,h=10);
//    translate([vesa,0,vesaHeight-2.2])cylinder(r1=4, r2=7.3, h=2.2);
//    translate([0,vesa,-3.5])cylinder(r=4,h=10);
//    translate([0,vesa,vesaHeight-2.2])cylinder(r1=4, r2=7.3, h=2.2);
//}

//}


//module vesa_top() {
//        difference() {
//        minkowski() {
//            cube([piX,piY,caseHeight]);
//            sphere(r=2);
//        }
//        // filler
//        translate([caseThick,caseThick,caseThick]) {
//            minkowski() {
//                cube([piX-2*caseThick,piY-2*caseThick,caseHeight+5]);
//                sphere(r=2);
//            }
//        }
//        //cut
//        translate([-caseThick,-caseThick,caseHeight]) {
//            cube([caseX,caseY,caseThick]);
//        }
//        // pi
//        translate([0,piY,caseHeight]) rotate([0,180,180])rpi(edge=5);  
//    }
//}


//module case_bottom() {
//difference(){
//minkowski() {
//    cube([piX+1,piY+1,4]);
//    cylinder(r=2,h=2);
//}
//        // filler
//        translate([caseThick,caseThick,-1]) {
//            minkowski() {
//                cube([piX+1-2*caseThick,piY+1-2*caseThick,12]);
//                 cylinder(r=2,h=12);
//            }
//       }
//}
//}

//translate([0.5,0.5,0])rpi();
//vesa_top();

// spacer
//translate([(vesa-piX)/2+piHoleOffset,(vesa-piY)/2+piHoleOffset,vesaHeight]) bottom_spacer();
//translate([(vesa-piX)/2+piHoleOffset,(vesa-piY)/2+piY-piHoleOffset,vesaHeight]) bottom_spacer();
//translate([(vesa-piX)/2+piX-piHoleOffset,(vesa-piY)/2+piHoleOffset,vesaHeight]) bottom_spacer();
//translate([(vesa-piX)/2+piX-piHoleOffset,(vesa-piY)/2+piY-piHoleOffset,vesaHeight]) bottom_spacer();

//vesa_bottom();

//translate([(vesa-piX)/2,(vesa-piY)/2,vesaHeight]) case_bottom();

//translate([(vesa-piX)/2,(vesa-piY)/2,vesaHeight]){
//    translate([piX,0,caseHeight])rotate([0,180,0]) vesa_top();
//}
//translate([(vesa-piX)/2,(vesa-piY)/2,vesaHeight+spacerHeight]) {
//    translate([piX,piY,0])rotate([0,0,180]) rpi();
//}
