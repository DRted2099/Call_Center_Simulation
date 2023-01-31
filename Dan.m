function j = Dan()
    
    p = binornd(1,0.84);
    
    
    if p ~= 1
        wait_time = 0;
        call_dur = 0;
        x = 0;
    else
        wait_time = randi([10,125]);
        call_dur = randi([33,417]);
        resol = binornd(1,0.90);
        if resol == 1
            x = 1;
        else
            x = 0;
        end
    end
    
    j = [3, wait_time,call_dur,x];

end