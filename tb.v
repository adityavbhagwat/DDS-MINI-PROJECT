`include "main.v"

module tb;
    wire [2:0] lift1_floor = 3'b010;
    wire [2:0] lift1_md = 3'b101;
    wire lift1_im = 1;
    wire [2:0] lift2_floor = 3'b100;
    wire [2:0] lift2_md = 3'b101;
    wire lift2_im = 0;
    wire [2:0] req_floor = 3'b011;
    wire [1:0] chosen_lift;
    
    choose_lift cl(lift1_floor, lift1_md, lift1_im, lift2_floor, lift2_md, lift2_im, req_floor, chosen_lift);
    //update_lifts ul(lift1_floor, lift1_md, lift1_im, lift2_floor, lift2_md, lift2_im, req_floor);
    //update_lifts ul2(lift1_floor, lift1_md, lift1_im, lift2_floor, lift2_md, lift2_im, req_floor);
    //update_lifts ul3(lift1_floor, lift1_md, lift1_im, lift2_floor, lift2_md, lift2_im, req_floor);

    initial
    begin
        $monitor("%d", chosen_lift);
    end






endmodule
