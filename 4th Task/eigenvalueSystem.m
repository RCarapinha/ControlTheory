function [] = eigenvalueSystem()
    global A
    eignA = eig(A);
    %Plot of the eigenvalues)
    plot(real(eignA),imag(eignA),'o');
    title('Eigenvalue plot of the A matrix');
    ylabel('Imaginary Axis');
    xlabel('Real Axis');
end