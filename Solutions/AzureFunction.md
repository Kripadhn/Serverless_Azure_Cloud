Problem: You need to run small pieces of code in response to events such as a new message in a queue or a new HTTP request.

Solution: Use Azure Functions to run code in response to events. Azure Functions can run a variety of programming languages and can be triggered by a wide range of event sources, including HTTP requests, message queues, and timers.

Example Code (in C#):

[FunctionName("Function1")]
public static void Run([QueueTrigger("queue", Connection = "AzureWebJobsStorage")]string myQueueItem, ILogger log)
{
    log.LogInformation($"C# Queue trigger function processed: {myQueueItem}");
}
