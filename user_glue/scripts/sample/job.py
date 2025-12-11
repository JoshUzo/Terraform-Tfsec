#
import sys
from awsglue.utils import getResolvedOptions
from awsglue.context import GlueContext
from awsglue.job import Job
from pyspark.context import SparkContext

# Glue passes JOB_NAME automatically
args = getResolvedOptions(sys.argv, ["JOB_NAME"])

sc = SparkContext()
glue_context = GlueContext(sc)
spark = glue_context.spark_session

job = Job(glue_context)
job.init(args["JOB_NAME"], args)

print("=== Glue job started successfully ===")
print(f"Job name: {args['JOB_NAME']}")

# Simple Spark operation (no S3 reads)
data = [("hello", 1), ("world", 2)]
df = spark.createDataFrame(data, ["word", "count"])
df.show()

print("=== Glue job completed successfully ===")

job.commit()
