2,height = input("what is the height of the room")
length = input("what is the length of the room")
width = input("what is the width of the room")

abswalls = input ("what is the absoprtion coefficient of the walls ")
absceiling = input ("what is the absoprtion coefficient of the ceiling")
absfloor = input ("what is the absoprtion coefficient of the floor ")

areawalls = 2*(length*height)+ 2*(width*height)
areaceiling = width*length
areafloor = width*length

wallstotabs = areawalls*abswalls
ceilingtotabs = areaceiling*absceiling
floortotabs = areafloor*absfloor

totabs = wallstotabs+ceilingtotabs+floortotabs
volume = length*height*width

T60pt1 = 0.161*volume
t60pt2 = totabs
T60 = (T60pt1/t60pt2)