# Let's make some graphs

def cayley_color_graph(G, S):
    ''' Create the cayley color graph of the group G with generating
    set S.
    '''

    # This is inefficient, but ensures that things work out for finitely
    # presented groups, where simplifications don't happen automatically
    vertices = list(G)
    edges = [(g, h, s) for g in G for h in G for s in S if h == s * g]
        
    return DiGraph([vertices, edges])

def simple_cayley_graph(G, S):
    ''' Create the simple cayley color graph '''
    return cayley_color_graph(G, S).to_undirected()

# We can make groups in a few different ways
# As a subgroup of a permutation:
D5 = DihedralGroup(5)
cay_D5 = cayley_color_graph(D5, D5.gens())
cay_D5.show(color_by_label=True, edge_labels=False)

# As a finitely presented group:
F.<f, g> = FreeGroup()
D5_fp = F / [f^5, g^2, f*g*f*g]
cay_D5_fp = cayley_color_graph(D5_fp, D5_fp.gens())
cay_D5_fp.show(color_by_label=True, edge_labels=True)
# This has the advantage that the labels are closer to
# what you write in math

# We can also show either one in 3d:
cay_D5.show3d(color_by_label=True)

# Abelian groups can be dealt with in a special way
Z2xZ5 = AbelianGroup([2,5])
cay_Z2xZ5 = cayley_color_graph(Z2xZ5, Z2xZ5.gens())
cay_Z2xZ5.show(color_by_label=True, edge_labels=True)
