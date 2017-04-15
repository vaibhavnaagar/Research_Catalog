#!/usr/bin/python3
import MySQLdb
import urllib.request
import xmltodict, sys, json, ssl

db = MySQLdb.connect(host="localhost",    # your host, usually localhost
                     user="root",         # your username
                     passwd="steinsgate",  # your password
                     db="research_catalogue")        # name of the data base

# Cursor object that will let
# execute all the queries
cur = db.cursor()

category = "vision"
num = 100
if len(sys.argv) > 1:
    category = sys.argv[1]
    num = sys.argv[2] if len(sys.argv) > 2 else 100

print("Searching Research Papers for category \'" + category + "\' ...")

context = ssl._create_unverified_context()
api_url = 'http://export.arxiv.org/api/query?search_query=all:' + category + '&start=0&max_results=' + str(num)
with urllib.request.urlopen(api_url, context=context) as url:
    s = url.read()
papers = xmltodict.parse(s, xml_attribs=True)

# Inserting new Category
cur.execute("SELECT c_id FROM category WHERE c_name='" + str(category) + "'")
c_id = cur.fetchone()
if c_id is None:
    cur.execute("INSERT INTO category (c_name) VALUES ('" + category +"')")
    db.commit()
    c_id = cur.lastrowid
else:
    c_id = c_id[0]

research_papers = papers["feed"]["entry"] if type(papers["feed"]["entry"]) is list else [papers["feed"]["entry"]]

result = dict();

for i, paper in enumerate(research_papers):
    #print(type(papers['feed']['entry'][0]))
    r_name = ''.join(paper.get("title", "").splitlines()).replace("'", "").replace('"', "").encode('ascii', 'ignore').decode()
    r_doi = paper.get("arxiv:doi", dict()).get("#text", "").replace("'", "").replace('"', "").encode('ascii', 'ignore').decode()
    if r_doi == "" or r_name == "":
        continue
    r_year = paper["published"][:4].encode('ascii', 'ignore').decode()
    r_pdf = paper["link"][-1]["@href"].replace("'", "").replace('"', "").encode('ascii', 'ignore').decode()
    r_list = [r_name, r_doi, r_year, r_pdf]
    #print("INSERT INTO research_paper (r_name, r_doi, r_year, r_pdf) VALUES ('" + "','".join(r_list) +"')")
    try:
        cur.execute("INSERT INTO research_paper (r_name, r_doi, r_year, r_pdf) VALUES ('" + "','".join(r_list) +"')")
        db.commit()
    except:
        print("Insertion Error ! Paper already exist in database with DOI: ", r_doi)
        continue

    r_id = cur.lastrowid
    # Insert authors and make connection
    authors = paper["author"] if type(paper["author"]) is list else [paper["author"]]
    for author in authors:
        a_name = author["name"].replace("'", "").replace('"', "").encode('ascii', 'ignore').decode()
        a_institute = author.get("arxiv:affiliation", dict()).get("#text", "").replace("'", "").replace('"', "").encode('ascii', 'ignore').decode()
        cur.execute("INSERT INTO author (a_name, a_institute) VALUES ('" + "','".join([a_name, a_institute]) +"')")
        db.commit()
        a_id = cur.lastrowid
        cur.execute("INSERT INTO written_by (r_id, a_id) VALUES ('" + "','".join([str(r_id), str(a_id)]) +"')")
        db.commit()

    # Using summary as keywords and then update key maps
    summary = ''.join(paper["summary"].splitlines()).replace("'", "").replace('"', "").encode('ascii', 'ignore').decode()
    cur.execute("INSERT INTO words (word) VALUES ('" + summary +"')")
    db.commit()
    w_id = cur.lastrowid
    cur.execute("INSERT INTO key_map (r_id, w_id) VALUES ('" + "','".join([str(r_id), str(w_id)]) +"')")
    db.commit()

    # Mapping Category to paper
    cur.execute("INSERT INTO correspond_to (r_id, c_id) VALUES ('" + "','".join([str(r_id), str(c_id)]) +"')")
    db.commit()
    result[i] = dict(title=r_name, doi=r_doi)
    print("Research Paper of DOI:", r_doi, " is successfully inserted!")

db.close()
#print(json.dumps(result))
