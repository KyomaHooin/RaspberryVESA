//
// RPi 3A+ VESA mount kit.
//

include <rpi.scad>;

$fn=50;

vesa=100;
vesaDia=5;
vesaHeigth=3;
piX=65;
piY=56;
piThick=1.27;
piHoleDia=2.75;
piHoleOffset=3.5;

// M4
//cylinder(r1=5, r2=7.5, h=2.2);

//translate([(vesa-piX)/2,(vesa-piY)/2,vesaHeigth]) rpi();

//translate([2,2,0])cylinder(r=2,h=piThick);


//minkowski() {
//union() {
//translate ([(vesa+2*vesaDia-piX)/2,(vesa+2*vesaDia-piY)/2,0]) cube([piX, piY, vesaHeigth]);

//hull() {
//translate([vesaDia, vesaDia, 0]) cylinder(r=vesaDia, h=vesaHeigth);
//translate([100+vesaDia,100+vesaDia,0]) cylinder(r=vesaDia, h=vesaHeigth);
//}

//hull() {
//translate([100+vesaDia,vesaDia,0]) cylinder(r=vesaDia, h=vesaHeigth);
//translate([vesaDia,100+vesaDia,0]) cylinder(r=vesaDia, h=vesaHeigth);
//}
//}

//translate([0,0,0])cylinder(r=3,h=vesaHeigth);
//}