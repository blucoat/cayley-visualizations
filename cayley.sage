# Let's make some graphs

def cayley_color_graph(G, S):
    ''' Create the cayley color graph of the group G with generating
    set S.
    '''

    vertices = list(G)

    # If we're deeling with quotients of free groups, we need to explicitely
    # simplify the product.
    if isinstance(G, sage.groups.finitely_presented.FinitelyPresentedGroup):
        k = G.rewriting_system()
        k.make_confluent()
        edges = [(g, k.reduce(s*g), s) for g in G for s in S]
    else:
        edges = [(g, s * g, s) for g in G for s in S]
        
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

