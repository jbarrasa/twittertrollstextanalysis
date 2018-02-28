// the "hate"graph (words co-occurring with the word 'hate')
MATCH p = (:Word { text: "hate"})-[co:CO_OCCURS]-(w) 
WHERE co.freq > 15
RETURN * limit 100

// most highly connected (largest co-ocurence) words
MATCH (n:Word) 
return n.text, size((n)-[:CO_OCCURS]-()) as degree
order by degree desc limit 100


// list of words co-occurring with 'money' ordered by frequency
MATCH (:Word { text: "money"})-[co:CO_OCCURS]-(w) 
return w.text, co.freq AS freq
order by freq desc limit 100
