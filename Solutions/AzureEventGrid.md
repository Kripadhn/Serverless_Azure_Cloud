Problem: You need to react to events across multiple services and resources in real-time.

Solution: Use Azure Event Grid to manage event routing and delivery between event producers and event consumers. Azure Event Grid supports a wide range of event sources, including Azure services and custom event sources.

Example Code (in C#):
using Microsoft.Azure.EventGrid.Models;

public static async Task Main(string[] args)
{
    EventGridSubscriber eventGridSubscriber = new EventGridSubscriber();
    await eventGridSubscriber.SubscribeToEventGridEvents();
}

public class EventGridSubscriber
{
    public async Task SubscribeToEventGridEvents()
    {
        // Your code here to handle the event
    }
}
