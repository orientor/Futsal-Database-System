from aditya import *
from suyash import *
from tushar import *
def query_1(con, cur):
    naam = input("Enter name:")
    wins = input("Enter no. of wins")
    losses = input("Enter number of losses")
    draws = input("Enter no. of draws")
    if(check_name(naam) and  (check_positive_int(wins, "win")) and  (check_positive_int(losses, "losses")) and  (check_positive_int(draws, "draws"))):
        query = f"INSERT INTO team(name, wins, losses, draw) VALUES('{naam}', {wins}, {losses}, {draws});"
        print(query)
    else:
        return 1
    print(query)
    try:
        cur.execute(query)
    except Exception as e:
        print(e)
    con.commit()
    print("Successfully Inserted into database")

def query_3(con, cur):
    team_name = input("Enter team_name:")
    first_name = input("Enter first name:")
    middle_name = input("Enter middle name:")
    last_name = input("Enter last name:")
    dob = input("Enter D.O.B in YYYY-MM-DD:")
    jersey_no = input("Jersey Number:")
    total_goals = input("Enter number of goals:")
    position = input("Enter position(One of (forward,midfielder,defence,goalkeeper): ")
    is_cpt = input("Is this player the new captain: (0,1)")
    if position == "goalkeeper":
        position = "goalrakshak"
    if(check_team(team_name, con, cur) and check_name_without_space(first_name) and check_name_without_space(middle_name) and check_name_without_space(last_name)
        and datecheck(dob) and  check_positive_int(jersey_no, "Jersey no.") and check_positive_int(total_goals, "Total goals") and check_position(position)):
        query = f"INSERT INTO player(team_name, first_name, middle_name, last_name, dob, jersey_no, total_goals, position)"
        query += f" VALUES('{team_name}', '{first_name}', '{middle_name}', '{last_name}', '{dob}', {jersey_no}, {total_goals}, '{position}');"
        print(query)
    else:
        return 1
    print(query)
    try:
        cur.execute(query)
    except Exception as e:
        print(e)
        return 1
    query = f"INSERT INTO {position}(pjn, team_name) VALUES ('{jersey_no}', '{team_name}');"
    try:
        cur.execute(query)
    except Exception as e:
        print(e)
        return 1
    if is_cpt=='1':
        delete_captain(team_name, con, cur)
        query = f"INSERT INTO team_captain(pjn, team_name) VALUES ('{jersey_no}','{team_name}');"
        cur.execute(query)
    con.commit()
    print("Successfully Inserted into database")

def query_15(con, cur):
    team_name = input("Team: ")
    if not (check_team(team_name, con, cur)):
        return
    query = f"SELECT * from team;"
    cur.execute(query)
    table.append("name wins losses draw score\n")
    for row in cur:
        score = str(2*int(row['wins'])+int(row['draw']))
        table.append([row['name'], row['wins'], row['losses'], row['draw'], score])
    
