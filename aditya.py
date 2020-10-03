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

def check_positive_int(num, varname):
    if(type(num)==str):
        try:
            num = int(num)
        except ValueError:
            print('Error: {varname} should be integer')
            return 1;
    if(num >= 0):
        print(f"Error: {varname} should be greater than zero.")
