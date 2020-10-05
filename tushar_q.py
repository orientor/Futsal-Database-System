from aditya import *
from suyash import *
from tushar import *

def tushar(ch,con,cur):
    if ch==8:
        query_8(con,cur)
    elif ch==10:
        query_10(con,cur)
    elif ch==12:
        query_12(con,cur)
    elif ch==13:
        query_13(con,cur)
    elif ch==17:
        query_17(con,cur)
    elif ch==18:
        query_18(con,cur)
    elif ch==19:
        query_19(con,cur)
    elif ch==20:
        query_20(con,cur)
    elif ch==23:
        query_23(con,cur)
    return 1



def query_10(con, cur):
    first_name = input("Enter first_name:")
    middle_name = input("Enter middle name:")
    last_name = input("Enter last name:")
    matches_judged = input("Enter matches judged:")

    if(check_name_without_space(first_name) and check_name_without_space(middle_name) and check_name_without_space(last_name)
        and check_positive_int(matches_judged, "matches_judged")):
        query = f"INSERT INTO referee(matches_judged, first_name, middle_name, last_name) VALUES({matches_judged}, '{first_name}', '{middle_name}', '{last_name}');"
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

##########################################################################################>>>>>>>>>>>>>>>>>>>>>>> REFEREE ID WASN'T OUTPUTTED




##################################################### S P E C T A T O R ##########################################################################

def query_12(con, cur):
    first_name = input("Enter first_name:")
    middle_name = input("Enter middle name:")
    last_name = input("Enter last name:")
    match_id = input("Enter match_id for which tickets ave to be booked:")    ###############################>>>>>>>>>>>>>> CHECK IF THIS MATCH ID IS VALID            ####### CHECKED IG
    try:
        total_no = int(input("Enter total number of phone numbers:"))
    except:
        print("Total number should be string.")

    if(check_name_without_space(first_name) and check_name_without_space(middle_name) and check_name_without_space(last_name) and check_positive_int(total_no, "total_no")) == 0:
        return 0
    num=list()
    for i in range (0,total_no):
        print(i,".")
        num.append(input("Number:"))
        if (check_number(num[i])==0):
            return 0

    spfpn=num[0]
    fpn=num[0]

    query = f"INSERT INTO spectator(fpn, first_name, middle_name, last_name) VALUES('{fpn}', '{first_name}', '{middle_name}', '{last_name}');"
    print(query)
    try:
        cur.execute(query)
    except Exception as e:
        print(e)


    query = f"INSERT INTO spectator_match(match_id, spfpn) VALUES({match_id}, '{spfpn}');"
    print(query)
    try:
        cur.execute(query)
    except Exception as e:
        print(e)

    for i in range (1,total_no):
        fpn=num[0]
        pn=num[i]
        query = f"INSERT INTO spectator_number(fpn, pn) VALUES('{fpn}', '{pn}');"
        print(query)
        try:
            cur.execute(query)
        except Exception as e:
            print(e)

        
    con.commit()
    print("Successfully Inserted into database")







################################################### S T A D I U M ###################################################

def query_13(con, cur):
    name = input("Enter stadium name:")
    matches_played = input("Enter number of matches played:")
    building_name = input("Enter building name:")
    street_name = input("Enter street name:")
    area = input("Enter area:")
    city = input("Enter city:")

    if(check_name(name) and check_add(building_name,street_name,area,city) and check_positive_int (matches_played, "matches_played")) == 0:
        return 0
    try:
        total_no = int(input("Enter total number of phone numbers:"))
    except ValueError:
        print("total no should be integer.")
        return 0

    if (check_positive_int(total_no,"total_no")==0):
        return 0
    num=list()
    for i in range (0,total_no):
        print(i,". ")
        num.append(input("Enter number:"))
        if (check_number(num[i])==0):
            return 0

    fpn=num[0]
    query = f"INSERT INTO stadium(name, nomp, fpn) VALUES('{name}', {matches_played}, '{fpn}');"
    print(query)
    try:
        cur.execute(query)
    except Exception as e:
        print(e)
        return



    query = f"INSERT INTO stadium_address(building_name, street_name, area, city, fpn) VALUES('{building_name}','{street_name}','{area}','{city}', {fpn});"
    print(query)
    try:
        cur.execute(query)
    except Exception as e:
        print(e)
        return

    for i in range (1,len(num)):
        fpn=num[0]
        pn=num[i]
        query = f"INSERT INTO stadium_number(fpn, pn) VALUES({fpn}, {pn});"
        print(query)
        try:
            cur.execute(query)
        except Exception as e:
            print(e)
            return

    con.commit()
    print("Successfully Inserted into database")





########################################################## C O A C H ##############################################

def query_8(con, cur):
    team_name = input("Enter team_name:")
    first_name = input("Enter first_name:")
    middle_name = input("Enter middle_name:")
    last_name = input("Enter last_name:")
    gen = input("Enter gender")
    experience = input("Enter experience:")

    if(check_name(team_name) and check_name_without_space(first_name) and check_name_without_space(middle_name) and check_name_without_space(last_name)
        and check_positive_int(experience, "experience") and gender(gen)):
        q1 = f"INSERT INTO coach(team_name, experience, gender) VALUES('{team_name}', {experience}, '{gen}');"
        q2 = f"INSERT INTO coach_name(Team_name, first_name, middle_name, last_name) VALUES('{team_name}', '{first_name}', '{middle_name}', '{last_name}');"
        #print(query)
    else:
        return 1
    #print(query)
    try:
        cur.execute(q1)
        cur.execute(q2)
    except Exception as e:
        print(e)
    con.commit()
    print("Successfully Inserted into database")





#################################################### R E T R I E V E L S ##########################################

def query_17(con, cur):
    
    sco = -1
    query = f"SELECT * from player;"
    cur.execute(query)
    
    for row in cur:
        tg = int(row['total_goals'])
        if(sco<tg):
            sco=tg
    print(sco)
    table = list()
    table.append(["team_name","first_name","middle_name", "last_name", "dob", "age", "jersey_no", "total_goals", "position"])
    cur.execute(query);
    for row in cur:
        print("YO")
        tg = int(row['total_goals'])
        if(tg==sco):
            age = get_player_age(row['dob'])
            table.append([row['team_name'], row['first_name'], row['middle_name'], row['last_name'], row['dob'], str(age), row['jersey_no'], row['total_goals'], row['position']])

    print_table(table)


def query_18(con, cur):

    name = input("Enter name of player to search for :")
    query = f"SELECT * from player;"
    cur.execute(query)

    table = list()
    table.append(["team_name","first_name","middle_name", "last_name", "dob", "age", "jersey_no", "total_goals", "position"])

    for row in cur:
        naam=row['first_name']+" "+row['middle_name']+" "+row['last_name']
        if name not in naam:
            continue
        else:
            age = get_player_age(row['dob'])
            table.append([row['team_name'], row['first_name'], row['middle_name'], row['last_name'], row['dob'], str(age), row['jersey_no'], row['total_goals'], row['position']])

    print_table(table)

def query_19(con, cur):
    query = f"SELECT * from team ORDER BY 2*wins+draw DESC;"
    cur.execute(query)
    table = list()
    table.append(["name","wins","losses", "draw", "score"])
    for row in cur:
        score = 2*int(row['wins'])+int(row['draw'])
        score = str(score)
        table.append([row['name'], row['wins'], row['losses'], row['draw'], score])
    print_table(table)

def query_20(con, cur):
    x = input("Enter x, to get top x teams:")
    try:
        x=int(x)
    except:
        print("X should be integer")
        return 0
    
    query = f"SELECT * from team ORDER BY 2*wins+draw DESC;"
    cur.execute(query)

    sz=0
    for row in cur:
        sz=sz+1

    if (sz<x):
        print("There are only ","")
        print(sz," teams, enter a smaller x")
        return
    
    table = list()
    table.append(["name","wins","losses", "draw", "score"])

    cnt=0
    cur.execute(query)
    for row in cur:
        if (cnt<x):
            score = 2*int(row['wins'])+int(row['draw'])
            score = str(score)
            table.append([row['name'], row['wins'], row['losses'], row['draw'], score])
            cnt=cnt+1

    print_table(table)

################################### A N A L Y S I S ############################################

def query_23(con, cur):
    query = f"select t.name, c.first_name, c.middle_name, c.last_name from coach_name c, team t where t.name=c.team_name order by 2*wins+draw desc;"
    cur.execute(query)

    sz=0
    for row in cur:
        sz=sz+1

    ctr=min(3,sz)

    table = list()
    table.append(["Sno.","team_name","first_name","middle_name","last_name"])

    cnt=0
    cur.execute(query)
    for row in cur:
        if (cnt<ctr):
            sno = cnt+1
            sno = str(sno)
            table.append([sno, row['name'], row['first_name'], row['middle_name'], row['last_name']])
            cnt=cnt+1

    print_table(table)
