//
// RPi 3A+ VESA mount kit.
//

include <rpi.scad>;

$fn=80;

vesa=100;
vesaDia=10;
vesaHeight=4;

caseThick=2;
caseX=piX+2*caseThick;
caseY=piY+2*caseThick;

function radius(x) = x*cos(45)/(1-cos(45));

x_radius=radius(caseY/2-vesaDia*sqrt(2));
y_radius=radius(caseX/2-vesaDia*sqrt(2));

module bottom_spacer() {
    difference() {
        union() {
            //base
            cylinder(r=4,h=2);
            cylinder(r=6,h=2);
        }
        //hole
        translate([0,0,-1]) cylinder(r=2,h=4);
        // donut
        translate([0,0,2]) {
            rotate_extrude(convexity=10) {
                translate([6,0,0])circle(r=2);
            }
        }
    }
}

bottom_spacer();

module vesa_bottom() {

difference() {
    translate([vesa/2,(vesa-caseY)/2-x_radius,0]){
        rotate([0,0,45]){
            cube([(2*x_radius+caseY)/sqrt(2),(2*x_radius+caseY)/sqrt(2), vesaHeight]);
        }
    }
    //X-OUTER CUT
        translate([vesa/2,(vesa-caseY)/2-x_radius,0])cylinder(r=x_radius,h=vesaHeight);    
        translate([vesa/2,(vesa+caseY)/2+x_radius,0])cylinder(r=x_radius,h=vesaHeight);    
    //Y-CUT
    translate([(vesa-caseY)/2-x_radius,(vesa-caseY)/2-x_radius,0]){
        rotate([0,0,45]){
            cube([(2*x_radius+caseY)/sqrt(2),(2*x_radius+caseY)/sqrt(2), vesaHeight]);
        }
    }
    translate([vesa/2+(2*x_radius+caseY)/2,(vesa-caseY)/2-x_radius,0]){
        rotate([0,0,45]){
            cube([(2*x_radius+caseY)/sqrt(2),(2*x_radius+caseY)/sqrt(2), vesaHeight]);
        }
    }
}

difference() {
   translate([vesa/2,(vesa-caseX)/2-y_radius,0]){
        rotate([0,0,45]){
            cube([(2*y_radius+caseX)/sqrt(2),(2*y_radius+caseX)/sqrt(2), vesaHeight]);
        }
    }
    //Y-OUTER CUT
        translate([(vesa-caseX)/2-y_radius,vesa/2,0])cylinder(r=y_radius,h=vesaHeight);    
        translate([(vesa+caseX)/2+y_radius,vesa/2,0])cylinder(r=y_radius,h=vesaHeight);    
    //X-CUT
    translate([vesa/2,(vesa-caseX)/2-y_radius,0]){
    rotate([0,0,45]){
            cube([(2*y_radius+caseX)/sqrt(2)/2,(2*y_radius+caseX)/sqrt(2)/2, vesaHeight]);
        }
    }
    translate([vesa/2,vesa/2,0]){
        rotate([0,0,45]){
            cube([(2*y_radius+caseX)/sqrt(2)/2,(2*y_radius+caseX)/sqrt(2)/2, vesaHeight]);
        }
    }
}

//PI
color("red"){
    difference() {
        translate ([(vesa-caseX)/2,(vesa-caseY)/2,vesaHeight]) cube([caseX, caseY, piThick]);
        translate ([(vesa-caseX)/2+caseThick,(vesa-caseY)/2+caseThick,vesaHeight-1]) cube([piX, piY, piThick+2]);
    }
}

difference() {
    //VESA1
    hull() {
        translate([0,0,0]) cylinder(r=vesaDia, h=vesaHeight);
        translate([vesa,vesa,0]) cylinder(r=vesaDia, h=vesaHeight);
    }
    //M4
    translate([0,0,-3.5])cylinder(r=4,h=10);
    translate([0,0,vesaHeight-2.2])cylinder(r1=4, r2=7.3, h=2.2);
    translate([vesa,vesa,-3.5])cylinder(r=4,h=10);
    translate([vesa,vesa,vesaHeight-2.2])cylinder(r1=4, r2=7.3, h=2.2);
}

difference() {
    //VESA2
    hull() {
        translate([vesa,0,0]) cylinder(r=vesaDia, h=vesaHeight);
        translate([0,vesa,0]) cylinder(r=vesaDia, h=vesaHeight);
    }
    //M4
    translate([vesa,0,-3.5])cylinder(r=4,h=10);
    translate([vesa,0,vesaHeight-2.2])cylinder(r1=4, r2=7.3, h=2.2);
    translate([0,vesa,-3.5])cylinder(r=4,h=10);
    translate([0,vesa,vesaHeight-2.2])cylinder(r1=4, r2=7.3, h=2.2);
}

}
