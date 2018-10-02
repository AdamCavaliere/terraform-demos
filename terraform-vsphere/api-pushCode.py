import requests
import tarfile
import os
import json
tfeURL = "https://ptfe.this-demo.rocks"
org = "SE_Org"
AtlasToken = os.environ["PTFE_TOKEN"]
workspaceName = "SE_Demo_Example"
headers = {'Authorization': "Bearer " + AtlasToken, 'Content-Type' : 'application/vnd.api+json'}
workspaceID_URL = tfeURL + "/api/v2/organizations/" + org + "/workspaces/" + workspaceName

configVersion = json.dumps({"data":{"type":"configuration-version"}})

# Get Current Working Directory
cwd = os.getcwd()

def make_tarfile(source_dir):
    with tarfile.open("./terraConfig.tar.gz", "w:gz") as tar:
        tar.add(source_dir, arcname=os.path.sep)
    return(source_dir + "/terraConfig.tar.gz")

tfeWorkspaceID = requests.get(workspaceID_URL, headers=headers)
workspaceID = json.loads(tfeWorkspaceID.text).get('data').get('id')
tfeUploadURL = tfeURL + "/api/v2/workspaces/" + workspaceID + "/configuration-versions"
uploadURL_JSON = requests.post(tfeUploadURL,data=configVersion, headers=headers)
uploadURL = json.loads(uploadURL_JSON.text).get('data').get('attributes').get('upload-url')
filename = make_tarfile(cwd)

with open(filename, 'rb') as data:
    results = requests.put(uploadURL, data=data)

os.remove(filename)
print(results.status_code)



