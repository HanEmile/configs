import urllib.request

url = "https://www.pwaworldtour.com/index.php?id=920"
file_name = "pwa_ranking.html"

urllib.request.urlretrieve(url, file_name)

counter = 0

rank_list = []

# 0 = wave men
# 1 = slalom men
# 2 = freestyle men
# 3 = wave women
# 4 = slalom women
# 5 = freestyle women

pod = list( [[], [], [], [], [], []] for _ in range(0, 6) )

with open(file_name) as doc:
    for line in doc:
        if "pwa-ranking-top10" in line:
            rank_list.append(counter)
        counter += 1

# print(rank_list)

with open(file_name) as doc:
    data = doc.readlines()

    # i = diciplines
    for i in range(0, 6):

        # j = places
        for j in range(0, 6):
            a = data[rank_list[i]+7+(6 * j)]
            b = a.split("<")
            c = b[2].split(">")
            pod[i][j].append(c[1])

for i in range(0, 6):
    if (i == 0):
        print("wave men:\n")
    if (i == 1):
        print("slalom men:\n")
    if (i == 2):
        print("freestyle men:\n")

    if (i == 3):
        print("wave women:\n")
    if (i == 4):
        print("slalom women:\n")
    if (i == 5):
        print("freestyle women:\n")

    for j in range(0, 6):
        for value in pod[i][j]:
            print(str(j+1) + " " + str(value.replace("&quot;", "'")))

    print("\n")
