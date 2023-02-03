{
  "$connections": {
    "value": [
      {
        "name": "office365",
        "id": "/subscriptions/{subscription-id}/resourceGroups/{resource-group}/providers/Microsoft.Web/connections/office365",
        "connectionId": "{connection-id}",
        "connectionName": "office365"
      }
    ]
  },
  "definition": {
    "$schema": "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
      "$connections": {
        "defaultValue": {
          "office365": {
            "connectionId": "{connection-id}",
            "connectionName": "office365",
            "id": "/subscriptions/{subscription-id}/resourceGroups/{resource-group}/providers/Microsoft.Web/connections/office365"
          }
        },
        "type": "Object"
      }
    },
    "triggers": {
      "Recurrence": {
        "type": "Recurrence",
        "recurrence": {
          "frequency": "Day",
          "interval": 1
        },
        "inputs": {
          "host": {
            "connection": {
              "name": "@parameters('$connections')['office365']['connectionId']"
            }
          },
          "method": "post",
          "path": "/datasets/default/triggers/Recurrence/run"
        },
        "kind": "Http"
      }
    },
    "actions": {
      "Send_an_email": {
        "type": "ApiConnection",
        "inputs": {
          "host": {
            "connection": {
              "name": "@parameters('$connections')['office365']['connectionId']"
            }
          },
          "method": "post",
          "path": "/datasets/default/triggers/Recurrence/run",
          "queries": {
            "to": "user@example.com",
            "subject": "Test subject",
            "body": "Test body"
          }
        },
        "runAfter": {
          "Recurrence": [
            "Succeeded"
          ]
        },
        "metadata": {
          "flowSystemMetadata": {
            "swaggerOperationId": "SendEmail"
          }
        }
      }
    }
  }
}
