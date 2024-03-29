import java.util.*;

class Untitled {
	public static void main(String[] args) {
		int[][][] graph = makeGraph();
		Primm(graph, 0, 7);
	}
	
	public static int[][][] makeGraph() {
		// graph[i] <-- node index
		// graph[i][j] <-- edges
		// graph[i][j][0] <-- edge value
		// graph[i][j][1] <-- target node index
		int graph[][][] = {
			{{9,1},{14,5},{15,6}}, 	//0
			{{23,2}},				//1
			{{19,7}},				//2
			{{6,2},{6,7}},			//3
			{{11,3},{16,7}},		//4
			{{18,2},{30,4},{5,6}},	//5
			{{20,4},{44,7}},		//6
			{}					//7
		};
		
		return graph;
	}
	
	public static void Primm(int[][][] graph, int start, int target) {
		ArrayList cloud = new ArrayList();
		
		int edge_to_delete = 0;
		
		// Current Node
		int c = start;
		
		// This is the list of nodes and the distance to each one
		int[] distance_to_node = new int[8];
		
		// these are the edges we will consider
		int[][] edges = new int[30][2];
		int curr_pos = 0;
		
		// Add the start node to the cloud
		cloud.add(c);
		
		// While the cloud does not have every node
		while (cloud.size() < 9) {
			int shortest_path = 50;
			int shortest_path_node = 1;
			
			System.out.println("CLOUD CONTAINS NODES: " + cloud);
			
			// Add all the edges around the current node to 'edges'
			System.out.println("EDGES AROUND NODE " + c + ":");
			for (int i=0;i<graph[c].length;i++) {
				System.out.print(graph[c][i][0] + "->" + graph[c][i][1]+ "\n");
				edges[curr_pos][0] = graph[c][i][0];
				edges[curr_pos][1] = graph[c][i][1];
				curr_pos++;
			}
			
			// Get the shortest path in edges
			System.out.println("EDGES");
			for (int i=0;i<curr_pos;i++) {
				System.out.println(edges[i][0] + "->" + edges[i][1]);
				if (edges[i][0] < shortest_path && !cloud.contains(edges[i][1])) {
					edge_to_delete = i;
					shortest_path = edges[i][0];
					shortest_path_node = edges[i][1];
				}
			}
			c = shortest_path_node;
			edges[edge_to_delete][0] = 9999999;
			edges[edge_to_delete][1] = 9999999;
			
			cloud.add(c);
		}
	}
}
