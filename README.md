# Salesforce App

Steps to test iterative DEV for an embedded app (template-to-app, app-to-template):

1.  update url's in sfdx-project.json to match your local server, authenticate to your local dev hub
2.  Create a DE org with the namespace "wave_de", and add this to the dev hub's namespace registry.  This allows scratch orgs to be created with this namespace
3.  Run the scratchOrgInit.sh script to create a scratch org, push the contents of this repo into it and create an app using the auto installer. 
4.  Grab the app id from the output in the above script.
5.  Open workbench - you can get the session id to login by running sfdx force:org:open (or it is displayed in the output from scratchOrgInit.sh)
6.  Embedded app templates are filtered out so you need to get by a specific url with the dev name:
		View the template with this URL : /services/data/v49.0/wave/templates/wave_de__Mortgage_Calculator?options=ViewOnly
7.  To make this app the master app for the embedded app you need execute a PUT on this url:
         /services/data/v49.0/wave/templates/wave_de__Mortgage_Calculator?options=ViewOnly
         with this body (substitute the ID with the correct app id):
         {"folderSource":{"id":"00lxx000000j9gbAAA"}}
         After this runs the 'folderSource' should be populated
8.  Now you can make changes to the app, and keep running the PUT above to have them applied to the template
9.  To bring the changes to your file system workspace, run sfdx force:source:pull
10.  If changes are made locally on template json files, run sfdx force:source:push
11.  To update the app from the template changes you can run update through the autoinstaller in workbench:
		data tab, insert, object Type 'WaveAutoInstallRequest', single record
		FolderId=00lxx000000j9gbAAA, RequestStatus=Enqueued, RequestType=WaveAppUpdate, TemplateApiName=wave_de__Mortgage_Calculator
		click 'confirm insert', and to view status click the link of the ID created
12.  Now the app is updated!
