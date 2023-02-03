# python
from azureml.core import Workspace, Run
ws = Workspace.from_config()
run = Run.get_context()

# Run your model training script here.
