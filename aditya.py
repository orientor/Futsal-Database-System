def check_name(naam):
    for i in naam:
        if not ( i.isalpha() or  i==' '):
            print("Error: Name should only contain alphabets and spaces.")
            return 1
    return 0

def check_name_without_space(naam):
    for i in naam:
        if not ( i.isalpha()):
            print("Error: Name should only contain alphabets.")
            return 1
    return 0
