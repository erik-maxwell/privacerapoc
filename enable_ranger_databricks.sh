#!/bin/bash

# databricks fs mkdirs dbfs:/databricks/privacerapoc/init
# databricks fs cp --overwrite  enable_ranger_databricks.sh  dbfs:/databricks/privacerapoc/init/


PRIVACERA_BASE_DOWNLOAD_URL=https://privacera.s3.amazonaws.com/poc_ds_2.0/cloud

#E.g. BASE_RANGER_URL=http://172.1.2.3:6080
BASE_RANGER_URL=http://52.157.182.106:6080

#E.g. BASE_SOLR_URL=http://172.1.2.3:8983
BASE_SOLR_URL=http://52.157.182.106:8983

# Optional
#E.g. CUST_CONF_URL="/dbfs/privacera/${env}/databricks_cust_conf.zip" in case of dbfs
#E.g. CUST_CONF_URL="http://example.com/cust_conf.zip" in case of public endpoint
CUST_CONF_URL=

SETUP_SCRIPT="${PRIVACERA_BASE_DOWNLOAD_URL}/setup_ranger_databricks2.sh"
PRIVACERA_PACKAGE="${PRIVACERA_BASE_DOWNLOAD_URL}/privacera_databricks.tar.gz"
CLUSTER_NAME=privacerapoc

set -x
sudo wget $SETUP_SCRIPT -O setup_ranger_databricks2.sh
sudo chmod a+x setup_ranger_databricks2.sh
sudo ./setup_ranger_databricks2.sh  ${BASE_SOLR_URL}/solr/ranger_audits ${BASE_RANGER_URL} ${CLUSTER_NAME} ${PRIVACERA_PACKAGE} ${CUST_CONF_URL}
