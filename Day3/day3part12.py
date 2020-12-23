def count(n, m):
    totalTrees = 0
    with open("day3.txt", "r") as file:
        currentIndex = n
        line = file.readline()
        lineSize = len(line) - 2
        for line in file:
            for i in range(m):
                line = file.readline()
            if line[currentIndex] == "#":
                totalTrees += 1
            if currentIndex+n > lineSize:
                currentIndex = currentIndex + n - lineSize - 1
            else:
                currentIndex += n
    return totalTrees

print(count(1,0)*count(3,0)*count(5,0)*count(7,0)*count(1,1))