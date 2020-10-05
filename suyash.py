from datetime import datetime, date

def gender(gen):
    if gen=='M' or gen=='F':
        return 1
    print("GENDER CAN ONLY BE M OR F")
    return 0

def datecheck(date):
    try:
        date = datetime.strptime(date, '%Y-%m-%d')
    except ValueError:
        raise ValueError("Incorrect data format, should be YYYY-MM-DD")
        return 0

    now=datetime.now()
    if(date>now):
        print("YOU CANNOT BE dob IN FUTURE")
        return 0
    return 1

def playeragecheck(dob):
    try:
        datetime.strptime(dob, '%Y-%m-%d')
    except ValueError:
        raise ValueError("Incorrect data format, should be YYYY-MM-DD")
        return 0

    today=datetime.now()
    age=today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day))
    if(age<18):
        print("PLAYER MUST BE ATLEAST 18 YEARS OLD")
        return 0
    return 1
