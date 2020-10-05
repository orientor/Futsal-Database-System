from aditya import *
from suyash import *
from tushar import *
def suy(ch, con, cur):
    if(ch==5):
        query_5(con,cur)
    if(ch==9):
        query_9(con,cur)
    if(ch==14):
        query_14(con,cur)
    if(ch==21):
        query_21(con,cur)
    if(ch==22):
        query_22(con,cur)


def query_5(con, cur):
    team1 = input("Enter First Team:")
    team2 = input("Enter Second Team")
    stadium = input("Enter the first phone number of the stadium")
    ref = input("Enter referee ID")
    dat=input("Enter date of the match")
    if((check_name(team1) and  check_name(team2) and  check_number(stadium) and ref.isnumeric() and datecheck(dat))):
        query = f"INSERT INTO futsal_match(match_date, sfpn) VALUES('{dat}', '{stadium}');"
        try:
            cur.execute(query)
        except Exception as e:
            print(e)
            return 0
        print(query)
        con.commit()
        id=cur.lastrowid
        print("ID ISSSS", id)
        query = f"INSERT INTO team_match(team_name, match_id) VALUES('{team1}', {id});"
        print(query)
        try:
            cur.execute(query)
        except Exception as e:
            print(e)
        con.commit()
        query = f"INSERT INTO team_match(team_name, match_id) VALUES('{team2}', {id});"
        print(query)
        try:
            cur.execute(query)
        except Exception as e:
            print(e)
        con.commit()
        query = f"INSERT INTO referee_match(referee_id, match_id) VALUES({ref}, {id});"
        print(query)
        try:
            cur.execute(query)
        except Exception as e:
            print(e)
        con.commit()
        query=f"select jersey_no from player where team_name='{team1}';"
        cur.execute(query)
        for row in cur:
            query2=f"INSERT INTO player_match(pjn, match_id, team_name) VALUES({int(row['jersey_no'])}, {id}, '{team1}');"
            cur.execute(query2)
            con.commit()
        query=f"select jersey_no from player where team_name='{team2}';"
        cur.execute(query)
        for row in cur:
            query2=f"INSERT INTO player_match(pjn, match_id, team_name) VALUES({int(row['jersey_no'])}, {id}, '{team2}');"
            cur.execute(query2)
            con.commit()
        query = f"UPDATE referee SET matches_judged=matches_judged+1 WHERE referee_id={ref};"
        cur.execute(query)
        query = f"UPDATE stadium SET nomp=nomp+1 WHERE fpn='{stadium}';"
        cur.execute(query)
        con.commit()

    else:
        print("Something is wrong")
        return 1
    print(query)
    con.commit()

    print("Inserted into database")

def query_9(con, cur):
    first_name=input("Enter first name")
    middle_name=input("Enter middle name")
    last_name=input("Enter last name")
    team_name = input("Enter the Team of the coach to be replaced")
    experience=int(input("Enter experience of the coach"))
    gender=input("Enter M or F")
    query = f"UPDATE coach SET experience = {experience}, gender='{gender}' WHERE team_name='{team_name}';"
    try:
        cur.execute(query)
    except Exception as e:
        print(e)
        print("The Team does not exist.")
        return
    query = f"UPDATE coach_name SET first_name='{first_name}', middle_name='{middle_name}', last_name='{last_name}' WHERE team_name='{team_name}';"
    try:
        cur.execute(query)
    except Exception as e:
        print(e)
        print("The Team does not exist.")
        return
    con.commit()

def query_14(con, cur):
    team_name=input("Enter team name")
    jersey=int(input("Enter jersey number"))
    match_id=int(input("Enter match ID"))
    query1=f"SELECT * FROM goal_scored WHERE pjn={jersey} AND team_name='{team_name}' AND match_id='{match_id}';"
    try:
        val=cur.execute(query1)
        print(val)
        if val==0:
            query=f"INSERT INTO goal_scored(pjn, team_name, match_id, nog) VALUES ({jersey}, '{team_name}', '{match_id}', 1);"
        else:
            query = f"UPDATE goal_scored SET nog = nog + 1 WHERE pjn={jersey} AND team_name='{team_name}' AND match_id='{match_id}' ;"
        cur.execute(query)
        query = f"UPDATE futsal_match SET total_goals = total_goals + 1 WHERE match_id='{match_id}' ;"
        cur.execute(query)
        query = f"UPDATE player SET total_goals = total_goals + 1 WHERE jersey_no={jersey} AND team_name='{team_name}' ;"
        cur.execute(query)
        con.commit()
    except Exception as e:
        print(e)
        print("Invalid details")

def query_21(con, cur):
    team_name=input("Enter team name")
    query = f"SELECT * from team WHERE name='{team_name}';"
    cur.execute(query)
    table = list()
    table.append(["team name","wins","losses", "draw", "score"])
    for row in cur:
        score = 2*int(row['wins'])+int(row['draw'])
        score = str(score)
        table.append([row['name'], row['wins'], row['losses'], row['draw'], score])
    print_table(table)

def query_22(con, cur):
    match_id = input("Enter match ID: ")
    try:
        match_id = int(match_id)
    except ValueError:
        print("You have to enter integer")
        return
    query1=f"SELECT team_name from team_match WHERE match_id='{match_id}';"
    try:
        cur.execute(query1)
    except Exception as e:
        print(e)
    i=0
    team1=team2=loser=match_date=total_goals=winner_id=""
    for row in cur:
        if i==0:
            team1=row['team_name']
        else:
            team2=row['team_name']
        i=i+1
    query = f"SELECT * from futsal_match WHERE match_id={match_id};"
    cur.execute(query)
    table = list()
    table.append(["Match_id","Date","Total Goals", "Winner", "Loser", "Stadium"])
    for row in cur:
        if(team1==row['winner_id']):
            loser=team2
        else:
            loser=team1
        query=f"SELECT name FROM stadium WHERE fpn='{row['sfpn']}';"
        match_date=row['match_date']
        total_goals=row['total_goals']
        winner_id=row['winner_id']
    cur.execute(query)
    for row in cur:
        stadname=row['name']
    table=list()
    table.append(["match id", "match date", "winner" ,"loser", "total goals", "stadium"])
    if winner_id is None:
        table.append([match_id, match_date, "TIED","TIED", total_goals, stadname])
    else:
        table.append([match_id, match_date, winner_id,loser, total_goals, stadname])
    print_table(table)
