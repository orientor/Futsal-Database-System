from datetime import datetime, date

def gender(gen):
    if gen=='M' or gen=='F':
        return 0
    print("GENDER CAN ONLY BE M OR F")
    return 1

def datecheck(date):
    try:
        datetime.datetime.strptime(date, '%Y-%m-%d')
    except ValueError:
        raise ValueError("Incorrect data format, should be YYYY-MM-DD")
        return 1

    now=date.today()
    if(date>now):
        print("YOU CANNOT BE dob IN FUTURE")
        return 1
    return 0

def playeragecheck(dob):
    try:
        datetime.datetime.strptime(dob, '%Y-%m-%d')
    except ValueError:
        raise ValueError("Incorrect data format, should be YYYY-MM-DD")
        return 1

    today=date.today()
    age=today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day))
    if(age<18):
        print("PLAYER MUST BE ATLEAST 18 YEARS OLD")
        return 1
    return 0