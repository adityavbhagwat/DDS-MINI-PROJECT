# DDS-MINI-PROJECT
Elevator Scheduling and controller system
Abstract:
Motivation leading up to the project Multi-storied buildings now-a-days generally have elevator systems with them. These elevator systems need precise smart and greedy control to carry out the task assigned to them in a most efficient and time saving manner. In this work more focus has been given to develop an algorithm for elevator control system which can be used to implement an arbitrary “N” floor building’s elevator control as well. Our goal is to design and simulate a working elevator system implemented via logic gates , and then possibly extend it to multiple lifts together upto an “N-storeyed” Building.
Working 

The model takes input of request floor as well as the  current floors in which lift 1 and lift 2 are located , as well as the state of motion of the lifts and their direction of traversal. The model efficiently calculates and allots the best possible lift to the user’s input. 
The simulation of this circuit is well implemented through Iverilog in a behavioural abstraction using effective statements such as always(*) blocks and nested if-else if statements . Adder and subtractors are also used in calculating the nearest lift configuration as per the user’s lift request floor

![image](https://github.com/adityavbhagwat/DDS-MINI-PROJECT/assets/132674080/d674ec46-d4c4-454a-8a5d-6ba89ef2eb4c)
Some of the testcases explanation :
In the first case , both the lifts are at rest. 
Lift 1 is situated in floor 0 and Lift 2 in Floor 4. The request is from floor 1, which is closer to Lift 1 and hence the output 1. In the second example, the users request is from floor 3 which is closer to lift2 and thus the OP of 2

In case both are in motion, then the output is decided based on the range of current lift floor and their max destinations. The lift’s range in which the user’s request lies, is triggered. If no such lift is found, then the lift which is closest to the request floor after completing its journey is triggered. Testcases 7 and 8 are given in the above table which handles simulataneous journey scenario

In case if one lift is at rest and the other  is in motion, we just need to analyse if the user request lies inside the range of lift which is in motion or if it is along the direction of motion of the lift. If Yes , then it is always optimal to Allot the moving lift, else the lift which is stationery is allotted. This case is also shown in the testcases 9,10
