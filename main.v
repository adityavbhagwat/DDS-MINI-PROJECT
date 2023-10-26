
module choose_lift(
    input [2:0] lift1_floor,
    input [2:0] lift1_md,
    input lift1_im,
    input [2:0] lift2_floor,
    input [2:0] lift2_md,
    input lift2_im,
    input [2:0] req_floor,
    output reg [1:0] chosen_lift
);
wire dir1, dir2;
reg [2:0] dif1;
reg [2:0] dif2;
assign dir1 = (lift1_md > lift1_floor);
assign dir2 = (lift2_md > lift2_floor);

always @*
begin

//BOTH ARE AT REST
if(~lift1_im && ~lift2_im) 
begin
    if (lift1_floor == req_floor) 
    begin
        chosen_lift = 2'b01;
    end

    else if (lift2_floor == req_floor)
    begin
        chosen_lift = 2'b10;
    end

    else 
    begin
        if (lift1_floor > req_floor) dif1 <= (lift1_floor - req_floor);
        else dif1 <= (req_floor - lift1_floor);

        if (lift2_floor > req_floor) dif2 <= (lift2_floor - req_floor);
        else dif2 <= (req_floor - lift2_floor);

        if (dif1 < dif2) chosen_lift = 2'b01;
        else chosen_lift = 2'b10;
    end
        end


        //BOTH ARE MOVING
        if(lift1_im && lift2_im) 
        begin
            if ((req_floor > lift1_floor) == dir1) chosen_lift = 2'b01;
            else if ((req_floor > lift2_floor) == dir2) chosen_lift = 2'b10;

            else
            begin 
            if (lift1_md > req_floor) dif1 = lift1_md - req_floor;
            else dif1 = req_floor - lift1_md;

            if (lift2_md > req_floor) dif2 = lift2_md - req_floor;
            else dif2 = req_floor - lift2_md;

            if (dif1 < dif2) chosen_lift = 2'b01;
            else chosen_lift = 2'b10;

        end
end

//one moving, one not
else
begin
    if(lift1_im)
    begin
        if ((req_floor > lift1_floor) == dir1) chosen_lift = 2'b01;
        else chosen_lift = 2'b10;
    end

else
begin
    if ((req_floor > lift2_floor) == dir2) chosen_lift = 2'b10;
    else chosen_lift = 2'b01;
end
        end
    end
    endmodule



module update_lifts(
        output reg [2:0] lift1_floor,
        output reg [2:0] lift1_md,
        output reg lift1_im,
        output reg [2:0] lift2_floor,
        output reg [2:0] lift2_md,
        output reg lift2_im,
        output reg [2:0] req_floor
    );

    wire [1:0] chosen_lift;
    reg [1:0] lift_choice;
    choose_lift cl(lift1_floor, lift1_md, lift1_im, lift2_floor, lift2_md, lift2_im, req_floor, chosen_lift);
    initial
    begin
        lift_choice[0] = chosen_lift[0];
        lift_choice[1] = chosen_lift[1];
    end


    always @*
    begin

    if (req_floor > 3'b101) lift_choice = 2'b00;


    if (lift_choice == 1)
    begin
        if(~lift1_im)
        begin
            lift1_md = req_floor;
            lift1_im = 1;
        end

        else
        begin
            if(lift1_md > lift1_floor) 
            begin
                if (req_floor > lift1_md) lift1_md = req_floor;
            end

        else if (req_floor < lift1_md) lift1_md = req_floor;
    end
    end

    if (lift_choice == 2)
    begin
        if(~lift2_im)
        begin
            lift2_md = req_floor;
            lift2_im = 1;
        end

        else
        begin
            if(lift2_md > lift2_floor) 
            begin
                if (req_floor > lift2_md) lift2_md = req_floor;
            end

        else if (req_floor < lift2_md) lift2_md = req_floor;
    end
    end


    if(lift1_im) 
    begin
        lift1_floor += (lift1_md > lift1_floor);
        lift1_floor -= (lift1_md < lift1_floor);
    end

    if(lift2_im) 
    begin
        lift2_floor += (lift2_md > lift2_floor);
        lift2_floor -= (lift2_md < lift2_floor);
    end
end

endmodule;


