$fn = 90;
w = 30;
fc_mount_l = 26;
mount_r = 6.0/2;
INF = 100;
round_r = 3;
base_w_2 = sin(45) * fc_mount_l;

module bottom(base_h){
	translate([-base_w_2, 0, 0]) cylinder(h = base_h, r = mount_r, center=true);
	translate([base_w_2, 0, 0]) cylinder(h = base_h, r = mount_r, center=true);
	rotate([0, 0, 45]) cube([w, w, base_h], center=true);
}
module top(){
	translate([0, 0, 20]) rotate([-10, 0, 0]) cube([15, 24, 1], center=true);
}
module fill(){
		hull(){
			bottom(20);
			top();
		}
}

module carve(){
	intersection(){
		fill();
		bottom(100);
	}
}
module smooth(){
	minkowski(){
		carve();
		sphere(round_r);
	}
}

module flat_bottom(){
	difference(){
		smooth();
		translate([0, 0, -INF/2]) cube([INF, INF, INF], center=true);
	}
}


flat_bottom();
//top();
//carve();
//fill();
