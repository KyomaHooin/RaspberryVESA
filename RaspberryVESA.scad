//
// RPi 3A+ VESA mount kit.
//

include <rpi.scad>;

$fn=50;

vesa=100;
vesaDia=10;
vesaHeight=3.5;

piX=65;
piY=56;
piThick=1.27;
piHoleDia=2.75;
piHoleOffset=3.5;

function radius(x) = x*cos(45)/(1-cos(45));

x_radius=radius(piY/2-vesaDia*sqrt(2));
y_radius=radius(piX/2-vesaDia*sqrt(2));

difference() {
    translate([vesa/2,(vesa-piY)/2-x_radius,0]){
        rotate([0,0,45]){
            cube([(2*x_radius+piY)/sqrt(2),(2*x_radius+piY)/sqrt(2), vesaHeight]);
        }
    }
    //X-OUTER CUT
        translate([vesa/2,(vesa-piY)/2-x_radius,0])cylinder(r=x_radius,h=vesaHeight);    
        translate([vesa/2,(vesa+piY)/2+x_radius,0])cylinder(r=x_radius,h=vesaHeight);    
    //Y-CUT
    translate([(vesa-piY)/2-x_radius,(vesa-piY)/2-x_radius,0]){
        rotate([0,0,45]){
            cube([(2*x_radius+piY)/sqrt(2),(2*x_radius+piY)/sqrt(2), vesaHeight]);
        }
    }
    translate([vesa/2+(2*x_radius+piY)/2,(vesa-piY)/2-x_radius,0]){
        rotate([0,0,45]){
            cube([(2*x_radius+piY)/sqrt(2),(2*x_radius+piY)/sqrt(2), vesaHeight]);
        }
    }
}

difference() {
   translate([vesa/2,(vesa-piX)/2-y_radius,0]){
        rotate([0,0,45]){
            cube([(2*y_radius+piX)/sqrt(2),(2*y_radius+piX)/sqrt(2), vesaHeight]);
        }
    }
    //Y-OUTER CUT
        translate([(vesa-piX)/2-y_radius,vesa/2,0])cylinder(r=y_radius,h=vesaHeight);    
        translate([(vesa+piX)/2+y_radius,vesa/2,0])cylinder(r=y_radius,h=vesaHeight);    
    //X-CUT
    translate([vesa/2,(vesa-piX)/2-y_radius,0]){
    rotate([0,0,45]){
            cube([(2*y_radius+piX)/sqrt(2)/2,(2*y_radius+piX)/sqrt(2)/2, vesaHeight]);
        }
    }
    translate([vesa/2,vesa/2,0]){
        rotate([0,0,45]){
            cube([(2*y_radius+piX)/sqrt(2)/2,(2*y_radius+piX)/sqrt(2)/2, vesaHeight]);
        }
    }
}

//PI
color("red"){
    translate ([(vesa-piX)/2,(vesa-piY)/2,5]) cube([piX, piY, vesaHeight]);
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
