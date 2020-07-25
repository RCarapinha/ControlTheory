%<a href="matlab:help init_db"></a> A script which cleans the MATLAB workspace, adds a full path to the current directory to the Matlab search path, declares global variables such as database - a variable representing a database or A, B, C, D - certain auxiliary variables.

%<a href="matlab:help read_f"></a> A function, which reads parameters of dynamical systems from the ASCII file filename and then assigns them to suitable fields of the variable database

%<a href="matlab:help read_k"></a> A function, which allows to add a new dynamical system to a database using a keyboard.

%<a href="matlab:help save_db"></a> A function, which saves the contents of a database to the ASCII file filename.

%<a href="matlab:help contents_db"></a> A function, which lists on a screen (with paging) the names of all the dynamical systems stored in a database

%<a href="matlab:help search_db"></a> A function, which lists on a screen (with paging) the names of all the systems in a database, that include the string string of characters

%<a href="matlab:help sort_N"></a> A function, which lists on a screen (with paging) the names of the systems from a database in the order of growing values of ||matrix||2, where matrix ? {'A', 'B', 'C', 'D'}.

%<a href="matlab:help stable_s"></a> A function, which lists on a screen (with paging) the names of systems from a database that are asymptotically stable.

%<a href="matlab:help impulse_i"></a> A function that implements a impulse function

%<a href="matlab:help dynamics"></a> A function representing a differential equation ?x = Ax + Bu, where u(t) = impulse i(t). A, B are global variables.

%<a href="matlab:help save_db"></a> A function, which displays a figure with two plots, one above the other. The first plot shows the output of the system name on the time interval [0, tf] for zero initial conditions and the impulse i input signal. The plot should be titled by the system name. The second plot shows state space trajectories provided the number of state variables is equal to 2 or 3. If this condition is not met then a message should appear, instead of a figure, with the information dim x > 3 or dim x < 2.
