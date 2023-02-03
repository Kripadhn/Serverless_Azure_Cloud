Problem: You need to build stateful, long-running workflows that can survive interruptions and failures.

Solution: Use Azure Durable Functions to build stateful, long-running workflows that can survive interruptions and failures. Azure Durable Functions is an extension of Azure Functions that provides the ability to write stateful functions in a serverless environment. Durable Functions provides an orchestration pattern for building workflows that can run for long periods of time, persist state, and continue from where they left off after an interruption.

Example Code (in C#):
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.Azure.WebJobs;
using Microsoft.Extensions.Logging;

namespace MyFunctionApp
{
    public static class MyOrchestrator
    {
        [FunctionName("MyOrchestrator")]
        public static async Task<List<string>> Run(
            [OrchestrationTrigger] DurableOrchestrationContext context,
            ILogger log)
        {
            var outputs = new List<string>();

            // Call an activity function to get the list of tasks.
            var tasks = await context.CallActivityAsync<List<string>>("MyTaskList", null);

            // Iterate through all of the tasks and run them in parallel.
            var parallelTasks = new List<Task<string>>();
            foreach (var task in tasks)
            {
                parallelTasks.Add(context.CallActivityAsync<string>("MyTask", task));
            }
            await Task.WhenAll(parallelTasks);

            // Return the result of all tasks.
            foreach (var parallelTask in parallelTasks)
            {
                outputs.Add(parallelTask.Result);
            }

            return outputs;
        }
    }
}
