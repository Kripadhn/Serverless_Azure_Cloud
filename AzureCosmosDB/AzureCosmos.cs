# C#
using Microsoft.Azure.Cosmos;

CosmosClient client = new CosmosClient("<CosmosDB-URI>", "<CosmosDB-Key>");
Container container = client.GetContainer("<Database-Name>", "<Container-Name>");

// Add, retrieve, or update data in the container.
