import java.util.*;

class Untitled {
	public static void main(String[] args) {
		int[][][] graph = makeGraph();
		Dijkstra(graph, 0, 7);
	}
	
	public static int[][][] makeGraph() {
		// graph[i] <-- node index
		// graph[i][j] <-- edges
		// graph[i][j][0] <-- edge value
		// graph[i][j][1] <-- target node index
		int graph[][][] = {
			{{9,2},{14,6},{15,7}}, 	//0
			{{23,3}},				//1
			{{19,8}},				//2
			{{6,3},{6,8}},			//3
			{{11,4},{16,8}},		//4
			{{18,3},{30,5},{5,7}},	//5
			{{20,5},{44,8}},		//6
			{{}}					//7
		};
		
		return graph;
	}
	
	public static void Dijkstra(int[][][] graph, int start, int target) {
		int[] cloud = new int[8];
		int current_node = start;
		
		// Add the start node to the cloud
		cloud[0] = current_node;
		
		int[] edges_list = graph[start]
	}
}