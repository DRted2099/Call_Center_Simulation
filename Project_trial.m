clc;
clear;
close all;

%Call_resolution = [];
%Call_res_eff = [];
%j = [];
Department1 = {};
Department2 = {};
Department3 = {};
Department4 = {};
Department5 = {};
 

for i = 1:54
    call_per_week = poissrnd(394); %Avg for 12 weeks
    call_dept = [round(0.2*call_per_week), round(0.21*call_per_week), round(0.18*call_per_week), round(0.19*call_per_week), round(0.22*call_per_week)];

    for i1 = 1:call_dept(1)
       
        x1 = {Martha, Dan,Stewart,Greg, Joe, Becky, Diane, Jim};
        idx = randi(numel(x1));
        Emp = x1(idx);
        %Employee = cellfun(@(x) zeros(1,4),cell(i1,1),'un',0)
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




%%

%Waitime
W1 = cellfun(@(x) x(1,2), Department1);
W2 = cellfun(@(x) x(1,2), Department2);
W3 = cellfun(@(x) x(1,2), Department3);
W4 = cellfun(@(x) x(1,2), Department4);
W5 = cellfun(@(x) x(1,2), Department5);

sx = size(W1);
sy = size(W2);
a = max(sx(1),sy(1));
z1 = [[W1;zeros(abs([a 0]-sx))],[W2;zeros(abs([a,0]-sy))]];

sx = size(z1);
sy = size(W3);
a = max(sx(1),sy(1));
z2 = [[z1;zeros(abs([a 0]-sx))],[W3;zeros(abs([a,0]-sy))]];

sx = size(z2);
sy = size(W4);
a = max(sx(1),sy(1));
z3 = [[z2;zeros(abs([a 0]-sx))],[W4;zeros(abs([a,0]-sy))]];

sx = size(z3);
sy = size(W5);
a = max(sx(1),sy(1));
Wait_time = [[z3;zeros(abs([a 0]-sx))],[W5;zeros(abs([a,0]-sy))]];
%--------------------------------------------------------------------
%Call duration

D1 = cellfun(@(x) x(1,3), Department1);
D2 = cellfun(@(x) x(1,3), Department2);
D3 = cellfun(@(x) x(1,3), Department3);
D4 = cellfun(@(x) x(1,3), Department4);
D5 = cellfun(@(x) x(1,3), Department5);

sx = size(D1);
sy = size(D2);
a = max(sx(1),sy(1));
z1 = [[D1;zeros(abs([a 0]-sx))],[D2;zeros(abs([a,0]-sy))]];

sx = size(z1);
sy = size(D3);
a = max(sx(1),sy(1));
z2 = [[z1;zeros(abs([a 0]-sx))],[D3;zeros(abs([a,0]-sy))]];

sx = size(z2);
sy = size(D4);
a = max(sx(1),sy(1));
z3 = [[z2;zeros(abs([a 0]-sx))],[D4;zeros(abs([a,0]-sy))]];

sx = size(z3);
sy = size(D5);
a = max(sx(1),sy(1));
Duration = [[z3;zeros(abs([a 0]-sx))],[D5;zeros(abs([a,0]-sy))]];

%---------------------------------------------------------------------------

Wash_mch_d = sum(Duration(:,1))/3600;
Toast_d = sum(Duration(:,2))/3600;
Fri_d = sum(Duration(:,3))/3600;
AC_d = sum(Duration(:,4))/3600;
TV_d = sum(Duration(:,5))/3600;

D = [Wash_mch_d, Toast_d, Fri_d, AC_d, TV_d];

Dept = categorical({'Washing Machine','Toaster','Fridge','AC' 'TV'});
Dept = reordercats(Dept,{'Washing Machine','Toaster','Fridge','AC' 'TV'});

bar(Dept,D);

Total_D = sum(D)/3600;

%----------------------------------------------------------

%%
Counter_W = [M_c, S_c, Da_c, G_c, Jo_c, B_c, Di_c, Ji_c];

Mar_Washing = sum(Mar_Washing);
Stew_Washing = sum (Stew_Washing);
Da_Washing = sum(Da_Washing);
Gre_Washing = sum(Gre_Washing);
Jo_Washing = sum(Jo_Washing);
Bec_Washing = sum(Bec_Washing);
Dia_Washing = sum(Dia_Washing);
Ji_Washing = sum(Ji_Washing);

Employee_Washing_D = [Mar_Washing, Stew_Washing, Da_Washing, Gre_Washing, Jo_Washing...
    , Bec_Washing, Dia_Washing, Ji_Washing];
Employee = categorical({'Martha','Stewart','Dan','Greg' 'Joe', 'Becky', 'Diane', 'Jim'});
Employee = reordercats(Employee,{'Martha','Stewart','Dan','Greg' 'Joe', 'Becky', 'Diane', 'Jim'});

figure;
bar(Employee,Employee_Washing_D);





%%
Duration = [D1,D2,D3,D4,D5];

sizes = cell2mat(cellfun(@size, YourCell(:), 'uniform', 0));
maxcols = max(sizes(:,2));
combined = cell2mat(cellfun(@(M) [M, zeros(size(M,1), maxcols-size(M,2))], YourCell(:), 'uniform', 0));




    
            
