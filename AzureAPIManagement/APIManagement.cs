# C#
using Microsoft.Azure.APIManagement.CSharp.Models;

var apiClient = new ApiClient("<API-Management-Instance>");
var result = await apiClient.Api.GetApiByNameAsync("<API-Name>", "<API-Version>");

// Access the API details from the result object.
