Orchestrators: An orchestrator is a function that coordinates the execution of other functions. Durable Functions includes an orchestrator function that can call other functions and manage their execution.

Activity Functions: Activity functions are the individual tasks that an orchestrator function calls to perform work.

Durable Task Framework: The Durable Task Framework is a library for building long-running, stateful workflows in serverless environments.

Entity Id: An entity id is a unique identifier for a specific instance of a Durable Function. The entity id is used to manage the state and execution of a function instance.

Checkpoints: Checkpoints are saved points in the execution of a Durable Function that allow the function to resume from that point if it is restarted.