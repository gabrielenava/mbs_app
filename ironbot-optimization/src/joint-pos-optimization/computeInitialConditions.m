function uInit = computeInitialConditions(w_H_b,jointPos,jetIntensities)

    % COMPUTEINITIALCONDITIONS calculates the initial conditions for the
    %                          nonlinear optimization solver.
    %
    % FORMAT:  uInit = computeInitialConditions(w_H_b,jointPos,jetIntensities)
    %
    % INPUTS:  - w_H_b: [4 x 4] from world to base transformation matrix;
    %          - jointPos: [ndof x 1] joint positions;
    %          - jetIntesities: [njets x 1] jets thrust forces magnitude;
    %    
    % OUTPUTS: - uInit: [6+ndof+njets x 1] initial conditions for the
    %                   optimization procedure.
    %
    % Author : Gabriele Nava (gabriele.nava@iit.it)
    % Genova, Dec 2018

    %% ------------Initialization----------------
    
    % the variables to be optimized are collected in a vector as follows:
    %
    %   u = [basePos; baseRot; jointPos; jetIntensities]
    %
    % baseRot is parametrized using Euler angles (roll pitch yaw)
    
    % get basePos and baseRot
    basePos      = w_H_b(1:3,4);
    w_R_b        = w_H_b(1:3,1:3);
    
    % convert the base rotation to Euler angles 
    rollPitchYaw = rollPitchYawFromRotation(w_R_b);
    
    % initial conditions for the optimization problem
    uInit = [basePos; rollPitchYaw; jointPos; jetIntensities];
end