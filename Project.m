clc;
clear;
close all;

Department1 = {};
Department2 = {};
Department3 = {};
Department4 = {};
Department5 = {};
 
%Loop for 27 days (100 cycles)
for i = 1:2700
    call_per_day = poissrnd(70); %Generating Poisson r.v
    call_dept = [round(0.2*call_per_day), round(0.21*call_per_day), round(0.18*call_per_day),...
        round(0.19*call_per_day), round(0.22*call_per_day)]; %Number of calls each department recieves

    %Assigning random agent to a call recieved by each department
    for i1 = 1:call_dept(1)
       
        x1 = {Martha,Dan,Stewart,Greg, Joe, Becky, Diane, Jim};
        idx = randi(numel(x1));
        Emp = x1(idx);
        Department1 = [Department1 ; Emp]; 

    end
    
    for i2 = 1:call_dept(2)
        
        x1 = {Martha,Dan,Stewart,Greg, Joe, Becky, Diane, Jim};
        idx = randi(numel(x1));
        Emp = x1(idx);
        Department2 = [Department2 ; Emp];
     

    end
    
    for i3 = 1:call_dept(3)
        x1 = {Martha, Dan, Stewart,Greg, Joe, Becky, Diane, Jim};
        idx = randi(numel(x1));
        Emp = x1(idx);
        Department3 = [Department3 ; Emp];
    end
    
    for i4 = 1:call_dept(4)
        x1 = {Martha,Dan,Stewart,Greg, Joe, Becky, Diane, Jim};
        idx = randi(numel(x1));
        Emp = x1(idx);
        Department4 = [Department4 ; Emp];
    end

    for i5 = 1:call_dept(5)
        x1 = {Martha,Dan,Stewart,Greg, Joe, Becky, Diane, Jim};
        idx = randi(numel(x1));
        Emp = x1(idx);
        Department5 = [Department5 ; Emp];
    end  

end

%Combining all the data into 1 matrix
sx = size(Department1);
sy = size(Department2);
a = max(sx(1),sy(1));
z1 = [[Department1;cell(abs([a 0]-sx))],[Department2;cell(abs([a,0]-sy))]];

sx = size(z1);
sy = size(Department3);
a = max(sx(1),sy(1));
z2 = [[z1;cell(abs([a 0]-sx))],[Department3;cell(abs([a,0]-sy))]];

sx = size(z2);
sy = size(Department4);
a = max(sx(1),sy(1));
z3 = [[z2;cell(abs([a 0]-sx))],[Department4;cell(abs([a,0]-sy))]];

sx = size(z3);
sy = size(Department5);
a = max(sx(1),sy(1));
Department = [[z3;cell(abs([a 0]-sx))],[Department5;cell(abs([a,0]-sy))]];


M_c = 0;
S_c = 0;
Da_c = 0;
G_c = 0;
Jo_c = 0;
B_c = 0;
Di_c = 0;
Ji_c = 0;


emptyCells = cellfun('isempty', Department);
Department(emptyCells) = {[0,0,0,0]};

%%
%Extracting data for each agent
k = ones(1,8);
l = ones(1,8);
l1 = ones(1,8);

for j = 1:5

    for i = 1:numel(Department(:,j))

        if Department{i,j}(1,1) == 1
 
           Mar_WT(k,j) = Department{i,j}(1,2);
           Mar_CD(k,j) = Department{i,j}(1,3);
           if Department{i,j}(1,2) == 0 
                
               l(1) = l(1)+1;
           
           end
           if Department{i,j}(1,4) == 1
                
               l1(1) = l1(1)+1;
           
           end

           k(1) = k(1)+1;
           M_c = M_c + 1;
        
        end
        
        if Department{i,j}(1,1) == 2
 
           Ste_WT(k,j) = Department{i,j}(1,2);
           Ste_CD(k,j) = Department{i,j}(1,3);
           
           if Department{i,j}(1,2) == 0 
                l(2) = l(2)+1;
           end
           if Department{i,j}(1,4) == 1 
                l1(2) = l1(2)+1;
           end
           
           
           k(2) = k(2)+1;
           S_c = S_c + 1;
        
        end

        if Department{i,j}(1,1) == 3
 
           Da_WT(k,j) = Department{i,j}(1,2);
           Da_CD(k,j) = Department{i,j}(1,3);
           if Department{i,j}(1,2) == 0
                l(3) = l(3)+1;
           end
           if Department{i,j}(1,4) == 1
                l1(3) = l1(3)+1;
           end
           k(3) = k(3)+1;
           Da_c = M_c + 1;
        
        end

        if Department{i,j}(1,1) == 4
 
           Gr_WT(k,j) = Department{i,j}(1,2);
           Gr_CD(k,j) = Department{i,j}(1,3);
           if Department{i,j}(1,2) == 0
                l(4) = l(4)+1;
           end
           if Department{i,j}(1,4) == 1
                l1(4) = l1(4)+1;
           end
           k(4) = k(4)+1;
           G_c = G_c + 1;

        
        end

        if Department{i,j}(1,1) == 5
 
           Jo_WT(k,j) = Department{i,j}(1,2);
           Jo_CD(k,j) = Department{i,j}(1,3);
           if Department{i,j}(1,2) == 0
                l(5) = l(5)+1;
           end
           if Department{i,j}(1,4) == 1
                l1(5) = l1(5)+1;
           end
           k(5) = k(5)+1;
           Jo_c = Jo_c + 1;
        
        end
        
        if Department{i,j}(1,1) == 6
 
           Bec_WT(k,j) = Department{i,j}(1,2);
           Bec_CD(k,j) = Department{i,j}(1,3);
           if Department{i,j}(1,2) == 0
                l(6) = l(6)+1;
           end
           if Department{i,j}(1,4) == 1
                l1(6) = l1(6)+1;
           end
           k(6) = k(6)+1;
           B_c = B_c +1;
        
        end
        
        if Department{i,j}(1,1) == 7
 
           Dia_WT(k,j) = Department{i,j}(1,2);
           Dia_CD(k,j) = Department{i,j}(1,3);
           if Department{i,j}(1,2) == 0
                l(7) = l(7)+1;
           end
           if Department{i,j}(1,4) == 1
                l1(7) = l1(7)+1;
           end
           k(7) = k(7)+1;
           Di_c = Di_c +1;
        
        end
        
        if Department{i,j}(1,1) == 8
 
           Ji_WT(k,j) = Department{i,j}(1,2);
           Ji_CD(k,j) = Department{i,j}(1,3);
           if Department{i,j}(1,2) == 0
                l(8) = l(8)+1;
           end
           if Department{i,j}(1,4) == 1
                l1(8) = l1(8)+1;
           end
           k(8) = k(8)+1;
           Ji_c = Ji_c +1;
        
        end

        
    end
end

%%
%Average call durations for each employee in hours
T_Mar_WT = sum(Mar_WT);
T_Mar_CD = sum(Mar_CD);
T_Mar = (T_Mar_WT + T_Mar_CD)/3600;

T_Stew_WT = sum(Ste_WT);
T_Stew_CD = sum(Ste_CD);
T_Stew = (T_Stew_WT + T_Stew_CD)/3600;

T_Dan_WT = sum(Da_WT);
T_Dan_CD = sum(Da_CD);
T_Dan = (T_Dan_WT + T_Dan_CD)/3600;

T_Greg_WT = sum(Gr_WT);
T_Greg_CD = sum(Gr_CD);
T_Greg = (T_Greg_WT + T_Greg_CD)/3600;


T_Joe_WT = sum(Jo_WT);
T_Joe_CD = sum(Jo_CD);
T_Joe = (T_Joe_WT+ T_Joe_CD)/3600;


T_Becky_WT = sum(Bec_WT);
T_Becky_CD = sum(Bec_CD);
T_Becky = (T_Becky_WT + T_Becky_CD)/3600;

T_Diane_WT = sum(Dia_WT);
T_Diane_CD = sum(Dia_CD);
T_Diane = (T_Diane_WT + T_Diane_CD)/3600;

T_Jim_WT = sum(Ji_WT);
T_Jim_CD = sum(Ji_CD);
T_Jim = (T_Jim_WT + T_Jim_CD)/3600;


%Number of calls each agent attended
Counter_W = [M_c, S_c, Da_c, G_c, Jo_c, B_c, Di_c, Ji_c];


Washing_Machine = [T_Mar(1), T_Stew(1), T_Dan(1), T_Greg(1), T_Joe(1), T_Becky(1), ...
    T_Diane(1), T_Jim(1)];

Toaster = [T_Mar(2), T_Stew(2), T_Dan(2), T_Greg(2), T_Joe(2), T_Becky(2), ...
    T_Diane(2), T_Jim(2)];

Fridge = [T_Mar(3), T_Stew(3), T_Dan(3), T_Greg(3), T_Joe(3), T_Becky(3), ...
    T_Diane(3), T_Jim(3)];

AC = [T_Mar(4), T_Stew(4), T_Dan(4), T_Greg(4), T_Joe(4), T_Becky(4), ...
    T_Diane(4), T_Jim(4)];

TV = [T_Mar(5), T_Stew(5), T_Dan(5), T_Greg(5), T_Joe(5), T_Becky(5), ...
    T_Diane(5), T_Jim(5)];


Employee = categorical({'Martha','Stewart','Dan','Greg' 'Joe', 'Becky', 'Diane', 'Jim'});
Employee = reordercats(Employee,{'Martha','Stewart','Dan','Greg' 'Joe', 'Becky', 'Diane', 'Jim'});

Total_time = [sum(T_Mar) sum(T_Stew) sum(T_Dan) sum(T_Greg) sum(T_Joe) sum(T_Becky) sum(T_Diane) sum(T_Jim)];

figure;
bar(Employee,Total_time)
title('Total Call Duration')
ylabel('Call Duration')

figure;
bar(Employee,Counter_W)
title('Number of calls for each Employee')
ylabel('Number of Calls')

figure;
bar(Employee,l1)
title('Number of calls resolved by each Employee')
ylabel('Number of Calls')

figure;
bar(Employee,l)
title('Number of calls rejected by each Employee')
ylabel('Number of Calls')

figure;
bar(Employee,Washing_Machine);
title('Each Employees Call Duration in Washing Machine Dept')
ylabel('Call Duration (in hrs)')

figure;
bar(Employee,Toaster);
title('Each Employees Call Duration in Toaster Dept')
ylabel('Call Duration (in hrs)')

figure;
bar(Employee,Fridge);
title('Each Employees Call Duration in Fridge Dept')
ylabel('Call Duration (in hrs)')

figure;
bar(Employee,AC);
title('Each Employees Call Duration in AC Dept')
ylabel('Call Duration (in hrs)')

figure;
bar(Employee,TV);
title('Each Employees Call Duration in TV Dept')
ylabel('Call Duration (in hrs)')

Name = ["Martha";"Stewart";"Dan";"Greg"; "Joe"; "Becky"; "Diane"; "Jim"];
Calls_Recieved = Counter_W';
Calls_Resolved = l1';
Calls_Rejected = l';

Table = table(Name,Calls_Recieved,Calls_Resolved,Calls_Rejected);


