import sys

_, *argv = sys.argv


def show(year, month, direction):
    max_dir_count = max(direction.values())
    dir_list = [kv[0] for kv in direction.items() if kv[1] == max(direction.values())]
    count = 0
    print(f"{year[0]}年 ", end='')
    if len(month) == 1:
        if len(str(month[0])) == 1:
            print(f" ", end='')
        print(f"{month[0]}月: ", end='')
    else:
        print(f"年間: ", end='')
    if len(str(max_dir_count)) == 1:
        print(f"  ", end='')
    elif len(str(max_dir_count)) == 2:
        print(f" ", end='')
    print(f"{max_dir_count}回", end='')
    if round(max_dir_count/(i-1)*100, 2) < 10:
        print(f"(  ", end='')
    else:
        print(f"( ", end='')
    print(f"{round(max_dir_count/(i-1)*100,2)}%) ", end='')
    for direction in dir_list:
        if count != 0:
            print("・", end='')
        print(direction, end='')
        count += 1
    print('')

for target_file in argv:
    year = []
    month = []
    direction={"北":0, "北北東":0, "北東":0, "東北東":0, "東":0, "東南東":0, "南東":0, "南南東":0, "南":0, "南南西":0, "南西":0, "西南西":0, "西":0, "西北西":0, "北西":0, "北北西":0}
    i = 0

    with open(target_file) as f:
        while True:
            line = f.readline()
            field = line.rstrip('\n').split(",")
            if not line:
                break
            if i != 0:
                date = field[0].split("/")
                year.append(date[0])
                month.append(date[1])
                direction[field[7]] += 1
            i += 1
        show(list(set(year)), list(set(month)), direction)
