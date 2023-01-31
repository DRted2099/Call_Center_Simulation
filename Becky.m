function j = Becky()
    
    p = binornd(1,0.84);

    
    if p ~= 1
        wait_time = 0;
        call_dur = 0;
        x = 0;
    else
        wait_time = randi([10,124]);
        call_dur = randi([36,418]);
        resol = binornd(1,0.90);
        if resol == 1
            x = 1;
        else
            x = 0;
        end
    end
    
    j = [6, wait_time,call_dur,x];

end