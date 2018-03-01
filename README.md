# oozie_workflow
Automizaing Hadoop Pig and Hive jobs, together, using Oozie

Pig and Hive jobs can work together with HCatalog which manages data and metadata. HCatalog store information such as where it's
store, data format and descriptions. For information about what Pig and Hive are look at my examples here
Hive https://github.com/wee-analyze/hive_logs
Pig https://github.com/wee-analyze/pig_logs

Since these Pig and Hive tools will work together they will have to execute scripts in a certain order which we can automatize
using Hadoop's Oozie. Oozie is a workflow engine and in addition can run on a time schedule or when new data comes in.
outlined in a XML file.


