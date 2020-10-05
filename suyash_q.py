from aditya import *
from suyash import *
from tushar import *
def suy(ch, con, cur):
    if(ch==5):
        query_5(con,cur)


def query_5(con, cur):
    team1 = input("Enter First Team:")
    team2 = input("Enter Second Team")
    stadium = input("Enter the first phone number of the stadium")
    ref = input("Enter referee ID")
    dat=input("Enter date of the match")
    if(1 or (not check_name(team1) and  not check_name(team2) and  not check_number(stadium) and  not ref.isnumeric() and not datecheck(dat))):
        query = f"INSERT INTO futsal_match(match_date, sfpn) VALUES({dat}, {stadium});"
        try:
            cur.execute(query)
        except Exception as e:
            print(e)
        print(query)
        con.commit()
        query = f"SELECT AUTO_INCREMENT FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'futsal' AND   TABLE_NAME   = 'futsal_match';"
        id=cur.lastrowid
        print("ID ISSSS", id)
        query = f"INSERT INTO team_match(team_name, match_id) VALUES({team1}, {id});"
        print(query)
        try:
            cur.execute(query)
        except Exception as e:
            print(e)
        con.commit()
        query = f"INSERT INTO team_match(team_name, match_id) VALUES({team2}, {id});"
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
        query=f"select jersey_no from player where team_name={team1};"
        cur.execute(query)
        for row in cur:
            query2=f"INSERT INTO player_match(pjn, match_id, team_name) VALUES({int(row['jersey_no'])}, {id}, {team1});"
            cur.execute(query2)
            con.commit()
        query=f"select jersey_no from player where team_name={team2};"
        cur.execute(query)
        for row in cur:
            query2=f"INSERT INTO player_match(pjn, match_id, team_name) VALUES({int(row['jersey_no'])}, {id}, {team2});"
            cur.execute(query2)
            con.commit()
        stadium_increment(stadium)
        referee_increment(ref)

    else:
        return 1
    print(query)
    con.commit()

    print("Inserted into database")