package com.pe.ibm.ws;

import com.ibm.watson.developer_cloud.retrieve_and_rank.v1.RetrieveAndRank;
import com.ibm.watson.developer_cloud.retrieve_and_rank.v1.model.SolrCluster;
import com.ibm.watson.developer_cloud.retrieve_and_rank.v1.model.SolrCluster.Status;
import com.ibm.watson.developer_cloud.retrieve_and_rank.v1.model.SolrClusterOptions;

public class WatsonRetrieveAndRank {

	
	public static void main(String[] arg) throws InterruptedException {
		retrieveAndRank();
	}
	
	
	public static void retrieveAndRank() throws InterruptedException {
		RetrieveAndRank service = new RetrieveAndRank("84e9f36d-3936-4557-8c18-40e52b5b4ea0","lMGIjPnjU5cF");

		// 1 create the Solr Cluster
		SolrClusterOptions options = new SolrClusterOptions("ClusterDemo01", 1);
		SolrCluster cluster = service.createSolrCluster(options).execute();
		System.out.println("Solr cluster: " + cluster);

		// 2 wait until the Solr Cluster is available
		while (cluster.getStatus() == Status.NOT_AVAILABLE) {
		  Thread.sleep(10000); // sleep 10 seconds
		  cluster = service.getSolrCluster(cluster.getId()).execute();
		  System.out.println("Solr cluster status: " + cluster.getStatus());
		}

		// 3 list Solr Clusters
		System.out.println("Solr clusters: " + service.getSolrClusters().execute());
	}
	
	
	
}
