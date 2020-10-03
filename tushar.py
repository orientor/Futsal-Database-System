def check_number(num):

    if len(num) != 10:
        print("Error: Number should have 10 digits")
        return 1
    
    for i in num:
        if not (i.isdigit()):
            print("Error: Number can only contain integers")
            return 1
    
    return 0

def check_add(bname, sname, area, city):

    if len(bname) == 0:
        print("Error: Building name can not be empty")
        return 1

    if len(sname) == 0:
        print("Error: Street name can not be empty")
        return 1

    if len(area) == 0:
        print("Error: Area name can not be empty")
        return 1

    if len(city) == 0:
        print("Error: City name can not be empty")
        return 1

    for i in bname:
        if not (i.isalpha() or i==' '):
            print("Error: Building Name can only contain alphabets or spaces")
            return 1

    for i in sname:
        if not (i.isalpha() or i==' '):
            print("Error: Street Name can only contain alphabets or spaces")
            return 1

    for i in area:
        if not (i.isalpha() or i==' '):
            print("Error: Area Name can only contain alphabets or spaces")
            return 1

    for i in city:
        if not (i.isalpha() or i==' '):
            print("Error: City Name can only contain alphabets or spaces")
            return 1

    return 0


check_number("1234567890")
