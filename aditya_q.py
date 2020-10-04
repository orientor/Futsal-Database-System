from aditya import *
from suyash import *
from tushar import *
def query_1(con, cur):
    naam = input("Enter name:")
    wins = input("Enter no. of wins")
    losses = input("Enter number of losses")
    draws = input("Enter no. of draws")
    if(1 or (not check_name(naam) and  not check_positive_int(wins) and  not check_positive_int(losses) and  not check_positive_int(draws))):
        print("KRO")
        z = input("NEWGER")
        query = f"INSERT INTO team(name, wins, losses, draws) VALUES({naam}, {wins}, {losses}, {draws});"
        print(query)
        y =input("Negro")
    else:
        print("NIGGGGGGGGGGGGGGG")
        y = input("NAGGER")
        return 1
    print(query)
    cur.execute(query)
    #con.commit()
    print("Inserted into database")
    x = input("NIGGER")
    
