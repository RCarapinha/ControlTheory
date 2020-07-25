function [] = BodePlotSystem()

    global A B C;
    
    doublependulumsys=ss(A,B,C,0);
    bode(doublependulumsys,[10.^-2;10.^2]);
    
    %System is unstable! By the bode criterion, in the phase crossover
    %frequency(=180º), the gain of the system is above 0dB, so therefore
    %this system is unstable.
end