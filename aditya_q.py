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
        and playeragecheck(dob) and  checkgz(jersey_no, "Jersey no.") and check_positive_int(total_goals, "Total goals") and check_position(position)):
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

def query_4(con, cur):
    team_name = input("Team name: ")
    jersey_no = input("jersey_no")
    delete_player(team_name, jersey_no, con, cur)

def delete_player(team_name, jersey_no, con, cur):
    if not (check_team(team_name, con, cur) and check_positive_int(jersey_no,"Jersey no.")):
        return 1
    jersey_no = int(jersey_no)
    cpt = get_team_captain(team_name,con,cur)
    query = f"DELETE FROM team_captain WHERE pjn={jersey_no} AND team_name='{team_name}';";
    cur.execute(query);
    for x in ['goalrakshak', 'forward', 'defence', 'midfielder']:
        query = f"DELETE FROM {x} WHERE pjn={jersey_no} AND team_name='{team_name}';"
        cur.execute(query)
    con.commit()
    query = f"DELETE from player WHERE team_name='{team_name}' AND jersey_no={jersey_no};"
    try:
        cur.execute(query)
    except Exception as e:
        print(e)
        print("This player has played one or matches. He has been set in history hence cannot be deleted.")
        return 0
    con.commit()
    return 1

def query_2(con, cur):
    team_name = input("Team name: ")
    if not (check_team(team_name, con, cur)):
        return 1
    query = f"SELECT jersey_no from player WHERE team_name='{team_name}';"
    cur.execute(query)
    for row in cur:
        jersey_no=row['jersey_no']
        if not (delete_player(team_name, jersey_no, con, cur)):
            return
    query = f"DELETE FROM team WHERE name='{team_name}';"
    try:
        cur.execute(query)
    except:
        print("This player has played one or matches. He has been set in history hence cannot be deleted.")
        return 0
    con.commit()
    return 1

def query_11(con, cur):
    ref_id = input("Referee id:")
    try:
        ref_id=int(ref_id)
    except:
        print("Referee id should be integer.")
    query=f"DELETE FROM referee WHERE referee_id={ref_id};"
    try:
        cur.execute(query)
    except Exception as e:
        print(e)
        print("The referee has now been set in history and hence cannot be deleted.")
        return 0
    con.commit()

def query_6(con, cur):
    match_id = input("match_id")
    try:
        match_id=int(match_id)
    except:
        print("id should be integer")
        return
    winner_id=input("winner_id:")
    loser_id=input("loser id:")
    if(not (check_team(winner_id,con,cur) and check_team(loser_id,con,cur))):
        print("One of the team names is incorrect")
        return 0
    query = f"UPDATE futsal_match SET winner_id = '{winner_id}' WHERE match_id={match_id};"
    try:
        cur.execute(query)
    except Exception as e:
        print(e)
        print("The match id does not exist.")
        return
    if not (check_team(winner_id,con,cur) and check_team(winner_id,con,cur)):
        return
    query = f"UPDATE team SET wins = wins + 1 WHERE name='{winner_id}';"
    cur.execute(query)
    query = f"UPDATE team SET losses = losses + 1 WHERE name='{loser_id}';"
    cur.execute(query)
    con.commit()

def query_16(con, cur):
    sco = input("Min score: ")
    try:
        sco = int(sco)
    except ValueError:
        print("You have to enter integer")
        return
    query = f"SELECT * from team;"
    cur.execute(query)
    table = list()
    table.append(["name","wins","losses", "draw", "score"])
    for row in cur:
        score = 2*int(row['wins'])+int(row['draw'])
        if(score<sco):
            continue
        score = str(score)
        table.append([row['name'], row['wins'], row['losses'], row['draw'], score])
    print_table(table)

def query_15(con, cur):
    team_name = input("Team: ")
    if not (check_team(team_name, con, cur)):
        return
    query = f"SELECT * from player WHERE team_name='{team_name}';"
    cur.execute(query)
    table = list()
    table.append(["team_name" , "first_name", "middle_name", "last_name", "dob" , "age", "jersey_no", "total_goals","position" ])
    for row in cur:
        try:
            age = get_player_age(row['dob'])
        except:
            age="not defined"
        table.append([row["team_name" ],row[ "first_name"],row[ "middle_name"],row[ "last_name"],row[ "dob" ],str(age),row[ "jersey_no"],row[ "total_goals"],row["position" ]])
    print_table(table)
    query=f"SELECT * FROM team_captain where team_name='{team_name}';"
    cap=0
    cur.execute(query)
    for row in cur:
        cap=row['pjn']
    if(cap==0):
        print("There is no captain of this team!")
    else:
        print("Team captain is Jersey No ", cap)


def query_7(con,cur):
    match_id = input("Enter match id")
    try:
        match_id=int(match_id)
    except:
        print("Match id should be integer")
        print(0)
    query = f"SELECT team_name FROM team_match WHERE match_id={match_id};"
    try:
        cur.execute(query)
    except Exception as e:
        print(e)
        print("Wrong match id")
        return 0
    com = list()
    for row in cur:
        temp=row['team_name']
        query=f"UPDATE team SET draw = draw + 1 WHERE name='{temp}';"
        com.append(query)
    for x in com:
        cur.execute(x)
    con.commit()
