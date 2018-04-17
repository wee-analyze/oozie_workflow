# oozie_workflow
Automizaing Hadoop Pig and Hive jobs, together, using Oozie

Programming languages: Pig and Hive

Pig and Hive jobs can work together with HCatalog which manages data and metadata. HCatalog store information such as where it's
store, data format and descriptions. For information about what Pig and Hive are look at my examples here

Hive https://github.com/wee-analyze/hive_logs

Pig https://github.com/wee-analyze/pig_logs

Since these Pig and Hive tools will work together they will have to execute scripts in a certain order which we can automatize
using Hadoop's Oozie. Oozie is a workflow engine and in addition can run on a time schedule or when new data comes in.
outlined in a XML file.

The data file is a log zip file that contains 213 files. The data should be place in a HDFS directory called "/data".

Oozie begins the work flow as follows:
    
    1. run Hive script to create an external table loaded directly to the to the data and an internal table which will be filled 
    with processed data by Pig (this output will be in JSON format). The tables will describe the data.
    2. run Pig script to manipulate data in the external table via HCatLoader. The script will only keep url's that contain "product",
    group by date, aggregate amount of visits, and retrieve the first and last log time. The aggregated results will then 
    be filled into the Hive internal table and the output will be available in hive's warehouse "/hive/warehouse" as a JSON file.
