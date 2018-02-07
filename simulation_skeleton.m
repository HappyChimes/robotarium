%% Simulator Skeleton File
% Paul Glotfelter
% 10/04/2016
% This file provides the bare-bones requirements for interacting with the
% Robotarium.  Note that this code won't actually run.  You'll have to
% insert your own algorithm!  If you want to see some working code, check
% out the 'examples' folder.

%% Get Robotarium object used to communicate with the robots/simulator
rb = RobotariumBuilder();

% Get the number of available agents from the Robotarium.  We don't need a
% specific value for this algorithm
N = rb.get_available_agents();

% Set the number of agents and whether we would like to save data.  Then,
% build the Robotarium simulator object!
r = rb.build('NumberOfAgents', N, 'Dynamics', 'SingleIntegrator', ... 
    'CollisionAvoidance', true, 'SaveData', true, 'ShowFigure', true);

% Select the number of iterations for the experiment.  This value is
% arbitrary
iterations = 1000;

% Iterate for the previously specified number of iterations
for t = 1:iterations
    
    % Retrieve the most recent poses from the Robotarium.  The time delay is
    % approximately 0.033 seconds
    x = r.get_states();
    
    %% Insert your code here!
    
    % dxi = algorithm(x);
    
    %% Send velocities to agents
    
    % The input modality for the robots will change based on the selected
    % dynamics!
    r.set_inputs(1:N, dxi);
    
    % Send the previously set velocities to the agents.  This function must be called!
    r.step();
end

% Though we didn't save any data, we still should call r.call_at_scripts_end() after our
% experiment is over!
r.call_at_scripts_end();