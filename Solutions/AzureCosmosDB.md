Problem: You need to store and query large amounts of data with low latency.

Solution: Use Azure Cosmos DB to store and query large amounts of data with low latency. Azure Cosmos DB provides a fully managed, globally distributed NoSQL database service that supports multiple data models and APIs, including MongoDB, Cassandra, and SQL.

Example Code (in C#):

using Microsoft.Azure.Cosmos;

namespace MyFunctionApp
{
    public static class MyFunction
    {
        private static readonly string EndpointUri = "YOUR_COSMOSDB_URI";
        private static readonly string PrimaryKey = "YOUR_COSMOSDB_KEY";
        private static readonly string DatabaseId = "YOUR_DATABASE_ID";
        private static readonly string ContainerId = "YOUR_CONTAINER_ID";

        public static async Task Run()
        {
            CosmosClient client = new CosmosClient(EndpointUri, PrimaryKey);

            Database database = await client.CreateDatabaseIfNotExistsAsync(DatabaseId);
            Container container = await database.CreateContainerIfNotExistsAsync(ContainerId, "/id");

            ItemResponse<dynamic> response = await container.ReadItemAsync<dynamic>("ItemId", new PartitionKey("ItemId"));
            dynamic item = response.Resource;

            Console.WriteLine("Item retrieved:");
            Console.WriteLine(item);
        }
    }
}
