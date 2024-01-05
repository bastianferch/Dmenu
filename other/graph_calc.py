import networkx as nx
import pydot

import matplotlib.pyplot as plt

def dot_to_graph(file_path):
    with open(file_path, 'r') as dot_file:
        dot_data = dot_file.read()

    graph = nx.DiGraph(nx.drawing.nx_pydot.read_dot(file_path))
    return graph

file_path = 'other/graph.dot'
resulting_graph = dot_to_graph(file_path)

print("Number of nodes:", len(resulting_graph.nodes))
print("Number of edges:", len(resulting_graph.edges))


