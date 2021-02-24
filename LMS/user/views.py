from django.shortcuts import render,redirect
from django.http import HttpResponse,JsonResponse
from django.contrib.auth import logout
from django.db import connection
import mysql.connector
from datetime import datetime, timedelta,date
import json
# Create your views here.
def test(request):
    return render(request,"user/test.html")

def checkout(request):
    j=0
    computed_cost=0.0
    for x in request.session["cart"].values():
        if x["issuing_buying"]=="Buying":
            computed_cost+=x["cost"]*x["current_quantity"]
            x["individual_total"]=x["cost"]*x["current_quantity"]
        if x["issuing_buying"]=="Issuing":
            doi=datetime.datetime.now()+datetime.timedelta(days=14)
            x["return_date"]=doi.strftime("%m/%d/%Y, %H:%M:%S")

    return render(request,"user/checkout_page.html",{"computed_cost" : computed_cost})
def index(request):
    request.session["login_status"]=True
    return render(request,"index.html")

def signin(request):
    email=request.POST.get("email")
    password=request.POST.get("password")
    if email!='' and password !='':    
        with connection.cursor() as cursor:
            #return HttpResponse("SELECT * from user where email = '{}' and password = '{}' ".format(email,password))
            cursor.execute("SELECT * from users where email = '{}' and password = '{}' ".format(email,password))
            res=cursor.fetchall()
            if len(res)==0:
                request.session["login_status"]=False
                return redirect('/login')
            else:
                request.session["uid"]=res[0][0]
                request.session["email"]=res[0][1]
                request.session["username"]=res[0][1] 
                request.session["cart"]=dict()
                request.session["cart_count"]=0
                request.session["login_status"]=True
                request.session["status"]=''
                request.session["visit"]=0
                request.session["issuing_count"]=0
                request.session["buying_count"]=0
                data={
                    "id":res[0][0],
                    "email":res[0][1],
                    "password":res[0][2],
                    "balance":res[0][3],
                    "roles":res[0][5]
                }
                if res[0][5] == 0:
                    cursor.execute("select count(*) from users")
                    u_count=cursor.fetchall()
                    cursor.execute("select count(*) from books")
                    b_count=cursor.fetchall()
                    cursor.execute("select count(*) from transactions where type = 0")
                    t_count=cursor.fetchall()
                    cursor.execute("select count(*) from transactions where type = 1")
                    n_count=cursor.fetchall()
                    data={
                        "u_count":u_count[0][0],
                        "b_count":b_count[0][0],
                        "t_count":t_count[0][0],
                        "n_count":n_count[0][0],
                    }
                    return redirect("/admin/admin_dashboard")
                elif res[0][5] == 1:
                    return redirect("/midadmin/midadmin_dashboard")
                elif res[0][5] == 2 :
                    return dashboard(request)
    else:
        return render(request,"login-register.html",{"error": "Fields Cannot Be Empty"})


def signup(request):
    name=request.POST.get("name")
    email=request.POST.get("email")
    password=request.POST.get("password")
    confirm_password=request.POST.get("confirm_password")
    phone_number=request.POST.get("phone_number")
    with connection.cursor() as cursor:
        cursor.execute("SELECT email from users")
        res=cursor.fetchall()
        print("inside")
        if name == '' or email==  '' or password== '':
            return render(request,"login-register.html",{"error" : "Fields Cannot be empty"})
        else:
            details={
                "name":name,
                "address":[],
                "dept": "" ,
                "payment":{
                    "card_number" : 0,
                    "cvv": 0,
                    "expiry":"",
                    "wallet":""
                },
                "phone_number":phone_number
            }
            details=str(details)
            if password==confirm_password and email not in res:
                sql="INSERT INTO users(email,password,balance,roles) values('{}','{}',{},{})".format(email,password,0.0,2)
                cursor.execute(sql)
                connection.commit()
                cursor.execute("UPDATE users set details = '{}' where email = '{}' ".format(details,email))
                connection.commit()
                return render(request,"login-register.html",{"success" : "Registered Successfully "})
            else:
                return HttpResponse("Hi")
def forgot_password(request):
    pass

def render_login(request):
    return render(request,"login-register.html",{"error" : "","success":""})

def login(request):
    with connection.cursor() as cursor:
        #return HttpResponse("SELECT * from users where email='{}'".format(request.user.email))
        sql="SELECT * from users where email='{}'".format(request.user.email)
        cursor.execute(sql)
        res=cursor.fetchall()
        print(res)
        if len(res)==0:
            request.session["login_status"]=False
            return redirect('/login',{"error" : "User doesnt exist "})
        else:
            request.session["uid"]=res[0][0]
            request.session["email"]=res[0][1]
            request.session["username"]=res[0][1]
            request.session["cart"]=dict()
            request.session["cart_count"]=0
            request.session["issuing_count"]=0
            request.session["buying_count"]=0
            request.session["visit"]=1
            if res[0][5]==2:
                return dashboard(request)
            elif res[0][5]==1:
                return redirect("/midadmin/midadmin_dashboard")
            else:
                return redirect("/admin/admin_dashboard")
                             
                # data={
                #             "id":res[0][0],
                #             "email":res[0][1],
                #             "password":res[0][2],
                #             "balance":res[0][3],
                #     }
                # cursor.execute("SELECT * from books")
                # res=cursor.fetchall()
                # books=dict()
                # i=0
                # for r in res:
                #     books[i]={
                #     "bid":r[0],
                #     "name":r[1],
                #     "author":r[2],
                #     "genre":r[3],
                #     "cost":r[4]
                # }
                # if r[5]>0:
                #     books[i]["available"]="Available"
                # else:
                #     books[i]["available"]="Not Available"
                # i+=1
                # print(data)
                # return redirect("/dashboard")
                # return render(request,"user/dashboard.html",{"data" : data , "books": books})
                # #return render(request,"user/dashboard.html",data)

def dashboard(request):
    request.session["visit"]+=1
    with connection.cursor() as cursor:
        cursor.execute("SELECT * from books")
        res=cursor.fetchall()
        books=dict()
        i=0
        for r in res:
            books[i]={
                "bid":r[0],
                "name":r[1],
                "author":r[2],
                "genre":r[3],
                "cost":r[4]
            }
            if r[5]>0:
                books[i]["available"]="Available"
            else:
                books[i]["available"]="Not Available"
            i+=1
        # data=dict()
        # cursor.execute("select uid,started_at,details from transactions where uid = {0} and type = {1}".format(request.session["uid"],0))
        # res=cursor.fetchall()
        # print(res)
        # today = datetime.now()
        # print(str(today))
        # return_date = res[0][1] + timedelta(days = 30)
        # print("return date =",str(return_date))
        # timedelta1 = today - res[0][1]
        # print(timedelta1)
        # details=eval(res[0][2])
        # if details["bid"][0] != '':
        #     cursor.execute("select * from books where bid = {}".format(details["bid"][0]))
        #     book_details1=cursor.fetchall()
        #     print(book_details1)
        #     data["details1"]={
        #         "bname":book_details1[0][1],
        #         "author":book_details1[0][2],
        #         "genre":book_details1[0][3],
                
        #     }
        #     data["res1"]=res
        #     # return HttpResponse(data["res1"])
        # if details["bid"][1] != '':
        #     cursor.execute("select * from books where bid = {}".format(details["bid"][1]))
        #     book_details2=cursor.fetchall()
        #     print(book_details2)
        #     data["details2"]=book_details2
        #     data["res2"]=res
        #     return HttpResponse(data["res2"])
        # print(data)
        # data=dict()
        # cursor.execute("select started_at from transactions where uid = {0} and type = {1}".format(request.session["uid"],0))
        # date_res=cursor.fetchall()
        # # return HttpResponse(date_res[0][0])
        # print(date_res)
        # if len(date_res)!=0:
        #     cursor.execute("select now()")
        #     today_date=cursor.fetchall()
        #     print(today_date[0][0])
        #     cursor.execute("select DATEDIFF('{}','{}')".format(today_date[0][0],date_res[0][0]))
        #     res=cursor.fetchall()
        #     print(res)
        #     cursor.execute("select tid,details from transactions where uid = {0} and type = {1}".format(request.session["uid"],0))
        #     details=cursor.fetchall()
        #     print(details)
        #     details1=eval(details[0][1])
        #     # print(details1["bid"][0])
        #     # for i in range(0,2):
        #         # print(details1["bid"][i])
        #     if details1["bid"][0] != '':
        #         cursor.execute("select * from books where bid = {}".format(details1["bid"][0]))
        #         book_details1=cursor.fetchall()
        #         data["details1"]=book_details1
        #         data["res1"]=res
        #         # return HttpResponse(data["res1"])
        #     if details1["bid"][1] != '':
        #         cursor.execute("select * from books where bid = {}".format(details1["bid"][1]))
        #         book_details2=cursor.fetchall()
        #         data["details2"]=book_details2
        #         data["res2"]=res
        #         # return HttpResponse(data["res2"])
        #     # return HttpResponse(data.values())
        #     # print(details1")
        #     # return HttpResponse(details1["bid"])
        #     # data={
        #     #     "book_ids":details1["bid"],
        #     #     "quantity":details1["quantity"],
        #     #     "total":details1["total"],
        #     #     "MOP": details1["MOP"],
        #     # }
        #     # for x in data.items():
        #     #     for books in x["book_ids"]:
        #             # cursor.execute("select * from books where bid = {}".format(books))
        #             # book_details=cursor.fetchall()
        #     # return HttpResponse(details1["bid"])
        #     # print(details1)
        #     # return HttpResponse(details1)
        #     # for i in range(len(details)):
        #     #     details1=eval(details[i][1])
        #     #     print(details1)

        #     # cursor.execute("select DATEDIFF('{}','{}')".format(today_date[0][0],date_res[1][0]))
        #     # res1=cursor.fetchall()
        #     # print(res1)
        #     # return HttpResponse(data["details1"])
        #     return render(request,"user/dashboard.html",{"books" : books , "data" : data }) 
        # else:
        return render(request,"user/dashboard.html",{"books": books })

def history(request):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * from transactions where uid = {} ORDER BY started_at DESC".format(request.session["uid"]))
        res=cursor.fetchall()
        if len(res)==0:
            return render(request,"user/history.html",{"error": "No Transactions Initiated "})
        else:
            data=dict()
            i=0
            for r in res:
                content=eval(r[4])
                print(content.items())
                data[i]={
                    "tid": r[0],
                    "started_at":r[3],
                    # "books_issued":content["bid"],
                    #"quantity": content["quantity"],
                    "total":content["total"],
                    'mop':''                
                    }
                if r[2]== 0:
                    data[i]["issuing_buying"]="Issuing"
                    data[i]["return_date"]=content["rdate"]
                else:
                    data[i]["issuing_buying"]="Buying"
                total=0
                j=0
                book=dict()
                for (b,v)in zip(content["bid"],content["quantity"]):
                    cursor.execute("SELECT book_name,cost from books where bid = {}".format(b))
                    books=cursor.fetchall()
                    book[j]={
                        "name":books[0][0],
                        "cost":books[0][1]*v,
                        "quantity":v
                    }
                    total+=book[j]["cost"]
                    j+=1
                data[i]["books"]=book
                data[i]["total"]=total
                i+=1
                print(data)
            return render(request,"user/history.html",{"data": data})
    

def history_filter(request,choice_id):
    with connection.cursor() as cursor:
        if choice_id=="0":
            sql = "SELECT * from transactions where uid={} order by tid desc  LIMIT 5".format(str(request.session["uid"]))
            cursor.execute(sql)
            
        elif choice_id=="1":
            cursor.execute("SELECT * from transactions where uid={} and type= 0  order by tid desc ".format(request.session["uid"]))
            
        elif choice_id=="2":
            cursor.execute("SELECT * from transactions where uid ={} and type =1 order by tid DESC".format(request.session["uid"]))  
        res=cursor.fetchall()
        
        if len(res)==0:
            return render(request,"user/history.html",{"error": "No Transactions Initiated "})
        else:
            data=dict()
            i=0
            for r in res:
                content=eval(r[4])
                #print(content)
                data[i]={
                        "tid": r[0],
                        "started_at":r[3],
                        # "books_issued":content["bid"],
                        #"quantity": content["quantity"],
                        "total":content["total"]
                }
                if r[2]== 0:
                    data[i]["issuing_buying"]="Issuing"
                    data[i]["return_date"]=content["rdate"]
                else:
                    data[i]["issuing_buying"]="Buying"
                    
                total=0
                j=0
                book=dict()
                for (b,v)in zip(content["bid"],content["quantity"]):
                    cursor.execute("SELECT book_name,cost from books where bid = {}".format(b))
                    books=cursor.fetchall()
                    book[j]={
                            "name":books[0][0],
                            "cost":books[0][1]*v,
                            "quantity":v
                        }
                    total+=book[j]["cost"]
                    j+=1
                data[i]["books"]=book
                data[i]["total"]=total
                i+=1
            print(data)
            return render(request,"user/history.html",{"data": data})
        

# def history_filter(request,choice_id):
#     with connection.cursor() as cursor:
#         if choice_id=="0":
#             sql = "SELECT * from transactions where uid={} order by started_at desc  LIMIT 5".format(str(request.session["uid"]))
#             cursor.execute(sql)
            
#         elif choice_id=="1":
#             cursor.execute("SELECT * from transactions where uid={} and type= 0  order by tid desc ".format(request.session["uid"]))
            
#         elif choice_id=="2":
#             cursor.execute("SELECT * from transactios where uid ={} and type =1 order by tid DESC".format(request.session["uid"]))  
#         res=cursor.fetchall()
#         if len(res) ==0:
#             return render(request,"user/history.html",{"error" : "No Transactions Initiated"})
#         else:
#             print(res)
#             data=dict()
#             for r in res:
#                 if r[4]==None: 
#                     return render(request,"user/history.html",{"error" : "No Transactions Initiated"})
#                 else:
#                     details=eval(r[4])
#                     data[r[0]]={
#                             "type": r[2],
#                             "date":r[3],
#                             "book_ids":details["bid"],
#                             "quantity":details["quantity"],
#                             "total":details["total"],
#                             "MOP": details["MOP"],
#                             "book_names":list()
#                     }
#                 for k,x in data.items():
#                     for books in x["book_ids"]:
#                         cursor.execute("SELECT book_name from books where bid={}".format(books))
#                         data[k]["book_names"].append(cursor.fetchall()[0][0])
                
def user_profile(request):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * from users where uid={}".format(request.session["uid"]))
        res=cursor.fetchall()
        # print(res)
        #print(res[0][4]["address"])
        details_json=eval(res[0][4])
        print(details_json)
        admin={
            "name":details_json["name"],
            "email":res[0][1],
            "password":res[0][2],
            "phone":details_json["phone_number"],
            "address":details_json["address"],
        }
        #json=str(details_json)       
        return render(request,"user/profile.html",admin)

def update_profile(request):
    with connection.cursor() as cursor:
        if request.method == 'POST':
            name=request.POST.get("name")
            email=request.POST.get("email")
            password=request.POST.get("password")
            phone=request.POST.get("phone")
            address=request.POST.get("address")
            cursor.execute("SELECT details from users where uid={}".format(request.session["uid"]))
            res=cursor.fetchall()
            details_json=eval(res[0][0])
            print(res[0][0])
            print(details_json)
            # return HttpResponse(str(details_json))
            if name != None:
                details_json["name"]=name
                details=json.dumps(details_json)
                # return HttpResponse(details)
                cursor.execute("update users set details = '{0}' where uid = {1}".format(details,request.session["uid"]))
            if email != None:
                cursor.execute("update users set email = '{0}' where uid = {1}".format(email,request.session["uid"]))
            if password != None:
                cursor.execute("update users set password = '{0}' where uid = {1}".format(password,request.session["uid"]))
            if phone != None:
                details_json["phone_number"]=phone
                details=json.dumps(details_json)
                cursor.execute("update users set details = '{0}' where uid = {1}".format(details,request.session["uid"]))
            if address != None:
                details_json["address"]=address
                details=json.dumps(details_json)
                cursor.execute("update users set details = '{0}' where uid = {1}".format(details,request.session["uid"]))
            # sql1="update users set name = '{0}', email = '{1}',password='{2}' where uid = {3}".format(name,email,password,request.session["uid"])
            return redirect("/profile")

def search_by_search_bar(request):
    request.session["search_status"]=''
    if request.method=="POST":
        search_term=request.POST.get("search_bar")
        if search_term !='':
            with connection.cursor() as cursor:
                sql="SELECT * from books where book_name like '{}'".format(search_term+"%")
                #return HttpResponse(sql)
                cursor.execute(sql)
                res=cursor.fetchall()
                #return HttpResponse(res)
                i=0
                if len(res)==0:
                    return render(request,"user/product-list.html",{"error": " "})
                data=dict()
                for r in res:
                    data[i]={
                        "id":r[0],
                        "name":r[1],
                        "author":r[2],
                        "genre":r[3],
                        "cost":r[4],
                    }
                    if r[5]==0:
                        data["status"]="Not Available"
                    else:
                        data["status"]="Available"
                    i+=1
                
                search="You searched for '{}' ".format(search_term)
                number_of_terms= "Showing {} results ".format(len(data)-1) 
                return render(request,"user/product-list.html",{"data": data,"searched_for" : search,"number_of_terms" : number_of_terms})
        
    return render(request,"user/explore.html",{"error": "Search bar cant be empty"})

def contact(request):
    return render(request,"user/contact_us.html")
def explore(request):
    with connection.cursor() as cursor:
        request.session["search_error"]=""
        cursor.execute("SELECT * from books")
        res=cursor.fetchall()
        data=dict()
        i=0
        for r in res:
            data[i]={
                "bid":r[0],
                "name":r[1],
                "author":r[2],
                "genre":r[3],
                "cost":r[4]
            }
            if r[5]>0:
                data[i]["available"]="Available"
            else:
                data[i]["available"]="Not Available"
            i+=1
        print(data)
        return render(request,'user/explore.html',{"data" : data})

def log_out(request):
    logout(request)
    return redirect("/")

# def product_list(request):
#     with connection.cursor() as cursor:
#         cursor.execute("SELECT * from books")
#         res=cursor.fetchall()
#         data = dict()
#         i=0
#         for r in res:
#             data[r[0]]={
#                 "id": r[0],
#                 "name": r[1],
#                 "author":r[2],
#                 "genre":r[3],
#                 "cost":r[4],
#                 "available_quantity":r[5]
#             }
#             i+=1
#         #print(data)
#         return render(request,'user/product-list.html',{"data": data})

def add_elements(request,pid,click):
    x=pid
    print(x)
    t=click
    print(t,type(t))
    with connection.cursor() as cursor:
        cursor.execute("SELECT * from books where bid = {}".format(x))
        r=cursor.fetchall()
        print(r)
        test=list(request.session["cart"].values())
        #print(test[0])
        #return HttpResponse(test)
        j=0
        flag=True
        for i in test:
            print("szdxhjkl;")
            print(i)
            try:
                if r[0][0] == i["id"]:
                    flag=False
                    break
            except KeyError:
                break
            j+=1
        if not flag:
            print(j)
            x=request.session["cart"][str(j)]["current_quantity"]
            x+=1
            print(x)
            del request.session["cart"][str(j)]
            request.session["cart"][str(j)]=dict()
            data={
                        "id": r[0][0],
                        "name": r[0][1],
                        "author":r[0][2],
                        "genre":r[0][3],
                        "cost":r[0][4]*x,
                        "available_quantity":r[0][5],
                        "current_quantity" : x,
                    }
            if click=="0":
                data["issuing_buying"]="Buying"
                request.session["buying_count"]+=1
            else:
            #     print(datetime.datetime.now().strftime("%m/%d/%Y, %H:%M:%S"))
                # return HttpResponse("Hi")
                data["issuing_buying"]="Issuing"
                request.session["issuing_count"]+=1

                data["issued_at"]=datetime.datetime.now().strftime("%m/%d/%Y, %H:%M:%S")
            request.session["cart"][str(j)]=data
            #request.session["cart_count"]+=1
            print(request.session.items())
            return dashboard(request)
        else:    
            data=dict()
            data={
                        "id": r[0][0],
                        "name": r[0][1],
                        "author":r[0][2],
                        "genre":r[0][3],
                        "cost":r[0][4],
                        "available_quantity":r[0][5],
                        "current_quantity" : 1
                    }
                    
            if click=="0":
                data["issuing_buying"]="Buying"
                request.session["buying_count"]+=1
            else:
                data["issuing_buying"]="Issuing"
                request.session["issuing_count"]+=1
                data["issued_at"]=datetime.datetime.now().strftime("%m/%d/%Y, %H:%M:%S")
            request.session["cart"][request.session["cart_count"]]=data
            request.session["cart_count"]+=1
            print(request.session.items())
            return dashboard(request)

def delete_all_items(request):
    del request.session["cart"]
    request.session["cart"]=dict()
    request.session["cart_count"]=0
    return dashboard(request)

def carousal(request):
    d=dict()
    for i in range(100):
        d[i]="test"
    print(d)
    return render(request,'carousal.html',{"d":d})

def search_by_filter(request):
    if request.method=="POST":
        genre=request.POST.get("genre")
        name=request.POST.get("name")
        author=request.POST.get("author")
        data=dict()
        test="Choose one"
        #return HttpResponse("test")
        #return HttpResponse(genre)
        with connection.cursor() as cursor:
            if genre!=test:
                if name!=test:
                    if author!=test:
                        cursor.execute("SELECT * from books where book_name = '{}' and author= '{}' and genre = '{}' ".format(name,author,genre))
                        res=cursor.fetchall()
                        #return HttpResponse(res)
                        search="You Searched for name = {} by author = {} of genre = {}".format(name,author,genre)
                        
                    else:
                        cursor.execute("SELECT * from books where book_name = '{}' and genre = '{}' ".format(name,genre))
                        res=cursor.fetchall()
                        #return HttpResponse(res)
                        search="You Searched for name = {} of genre = {}".format(name,author,genre)
                        
                else:
                    cursor.execute("SELECT * from books where genre = '{}' ".format(genre))
                    res=cursor.fetchall()
                    #return HttpResponse(res)
                    search="You Searched for books of genre = {}".format(genre)
                        
            elif name!=test:
                if author!=test:
                    cursor.execute("SELECT * from books where book_name = '{}' and author= '{}' ".format(name,author))
                    res=cursor.fetchall()
                    #return HttpResponse(res)
                    search="You Searched for name = {} by author = {} ".format(name,author)
                        
                else:
                    cursor.execute("SELECT * from books where book_name = '{}' ".format(name))
                    res=cursor.fetchall()
                    #return HttpResponse(res)
                    search="You Searched for name = {}".format(name)
                        
            elif author!=test:
                cursor.execute("SELECT * from books where author= '{}' ".format(author))
                res=cursor.fetchall()
                #return HttpResponse(res)
                search="You Searched for books by author = {} ".format(author) 
            else:
                request.session["search_error"]="No Field Selected"
                return redirect("/explore")
            
            number_of_terms="Number of terms searched : {} ".format(len(res))
            i=0
            data=dict()
            for r in res:
                data[i]={
                        "id":r[0],
                        "name":r[1],
                        "author":r[2],
                        "Genre":r[3],
                        "Cost":r[4],
                    }
                if r[5]==0:
                    data["status"]="Not Available"
                else:
                    data["status"]="Available"
                i+=1
                
            return render(request,"user/product-list.html",{"data": data,"searched_for" : search,"number_of_terms" : number_of_terms})
def delete_element(request,pid):
    j=0
    for x in request.session["cart"].values():
        print(x["id"],pid,type(x["id"]),type(pid))
        if int(pid)== int(x["id"]):
            print("hi")
            print(request.session["cart"])
            del x
            #request.session["cart"][str(j)]=dict()
            request.session["cart_count"]-=1
            break
        j+=1
    print(request.session["cart"])
    string="Element {} delted successfully ".format(pid)
    return redirect("/dashboard")

# def transaction(request):
#     with connection.cursor() as cursor:
#         cursor.execute("SELECT tid from transactions order by tid DESC LIMIT 1")
#         tid=cursor.fetchall()[0][0]
#         tid+=1
#         #return HttpResponse("Hi")
# #         details : {
# #     "bid": []
# #     "Quantity": []
# #     "Rdate": []
# #     "Total":
# #     "Status":
# #     "MOP":
# # }
#         print(request.session["cart"])
#         data={
#             "bid":list(),
#             "quantity":list(),
#             "rdate:":list(),
#             "total":0.0,
#             "status" : 0,
#             "MOP":""
#         }
#         total=0.0
#         for r in request.session["cart"].values():
#             data["bid"].append(r["id"])
#             data["quantity"].append(r["current_quantity"])
#             total+=r["cost"]
#         data["total"]=total
#         #return HttpResponse(data.items())
#         data=str(data)
#         #return HttpResponse("INSERT into transactions values({},{},{},{})".format(tid,request.session["uid"],1,str(datetime.datetime.now())))
#         sql="INSERT into transactions(tid,uid,type,started_at) values({},{},{},'{}')".format(tid,request.session["uid"],1,str(datetime.datetime.now()))
#         #return HttpResponse(sql)
#         cursor.execute(sql)
#         cursor.execute('UPDATE transactions set details = "{}" where tid = {}'.format(data,tid))
#         # cursor.commit()
#         delete_all_items(request)
        
#         return redirect("/dashboard")

def individual_book(request,book_id):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * from books where bid = {} ".format(int(book_id)))
        res=cursor.fetchall()
        data={
            "id": str(res[0][0]),
            "name": res[0][1],
            "author":res[0][2],
            "genre": res[0][3],
            "cost":res[0][4]
        }
        if res[0][5]>0:
            data["available"]="Available"
        else:
            data["available"]="Unavailable"
        
        return render(request,"user/individual_book.html",{"data" : data})

def payment_portal(request):
    #return HttpResponse("Hi")
    if request.session["issuing_count"]>0 and request.session["buying_count"]==0:
        return commit_transaction(request,0)
    return render(request,"user/payment_portal.html")

def commit_transaction(request,choice_id):
    # # return HttpResponse(request.session.items())
    # delete_all_items(request)
    # return dashboard(request)
    data={
                'bid': [], 
                'quantity': [], 
                'rdate': '', 
                'total': 0.0, 
                'status': 0, 
                'MOP': ''
                }
    print(request.session.items())        
    with connection.cursor() as cursor:
        if request.session["buying_count"]==0 and request.session["issuing_count"]>0:
            for v in request.session["cart"].values():
                if v["issuing_buying"]=="Issuing":
                    data["bid"].append(v["id"])
                    data["quantity"].append(1)
            doi=datetime.datetime.now()+datetime.timedelta(days=14)
            data["rdate"]=doi.strftime("%m/%d/%Y, %H:%M:%S")
            data=str(data)    
            sql="INSERT INTO transactions(uid,type,started_at) values({},{},'{}')".format(request.session["uid"],0,datetime.datetime.now())
            #return HttpResponse(sql)
            cursor.execute(sql)
            # cursor.commit()
            cursor.execute("SELECT tid from transactions where uid = {} order by tid DESC LIMIT 1 ".format(request.session["uid"]))
            res=cursor.fetchall()
            sql='UPDATE transactions set details="{}" where tid= {}'.format(data,res[0][0])
            print(sql)
            cursor.execute(sql)
            # cursor.commit()
            request.session["issuing_count"]=0
            request.session["buying_count"]=0
            delete_all_items(request)
            return dashboard(request)
        elif request.session["buying_count"]>0 and request.session["issuing_count"]==0:
            for v in request.session["cart"].values():
                if v["issuing_buying"]=="Buying":
                    data["bid"].append(v["id"])
                    data["quantity"].append(v["current_quantity"])
                    data["total"]+=v["cost"]*v["current_quantity"]
            if choice_id==0:
                data["mop"]="Wallet"
            elif choice_id==1:
                data["mop"]="Credit Card"
            else:
                data["mop"]="Cash"
            sql="INSERT INTO transactions(uid,type,started_at) values({},{},'{}')".format(request.session["uid"],1,datetime.datetime.now())
            #return HttpResponse(sql)
            cursor.execute(sql)
            # cursor.commit()
            cursor.execute("SELECT tid from transactions where uid = {} order by tid DESC LIMIT 1 ".format(request.session["uid"]))
            res=cursor.fetchall()
            sql='UPDATE transactions set details="{}" where tid= {}'.format(data,res[0][0])
            print(sql)
            cursor.execute(sql)
            # cursor.commit()
            request.session["issuing_count"]=0
            request.session["buying_count"]=0
            delete_all_items(request)
            return dashboard(request)
        elif request.session["buying_count"]>0 and request.session["issuing_count"]>0:
            for v in request.session["cart"].values():
                if v["issuing_buying"]=="Issuing":
                    data["bid"].append(v["id"])
                    data["quantity"].append(1)
            doi=datetime.datetime.now()+datetime.timedelta(days=14)
            data["rdate"]=doi.strftime("%m/%d/%Y, %H:%M:%S")
            data=str(data)    
            sql="INSERT INTO transactions(uid,type,started_at) values({},{},'{}')".format(request.session["uid"],0,datetime.datetime.now())
            #return HttpResponse(sql)
            cursor.execute(sql)
            # cursor.commit()
            cursor.execute("SELECT tid from transactions where uid = {} order by tid DESC LIMIT 1 ".format(request.session["uid"]))
            res=cursor.fetchall()
            sql='UPDATE transactions set details="{}" where tid= {}'.format(data,res[0][0])
            print(sql)
            cursor.execute(sql)
            
            data={
                'bid': [], 
                'quantity': [], 
                'rdate': '', 
                'total': 0.0, 
                'status': 0, 
                'MOP': ''
                }
            for v in request.session["cart"].values():
                if v["issuing_buying"]=="Buying":
                    data["bid"].append(v["id"])
                    data["quantity"].append(v["current_quantity"])
                    data["total"]+=v["cost"]*v["current_quantity"]
            if choice_id==0:
                data["mop"]="Wallet"
            elif choice_id==1:
                data["mop"]="Credit Card"
            else:
                data["mop"]="Cash"
            sql="INSERT INTO transactions(uid,type,started_at) values({},{},'{}')".format(request.session["uid"],1,datetime.datetime.now())
            #return HttpResponse(sql)
            cursor.execute(sql)
            # cursor.commit()
            cursor.execute("SELECT tid from transactions where uid = {} order by tid DESC LIMIT 1 ".format(request.session["uid"]))
            res=cursor.fetchall()
            sql='UPDATE transactions set details="{}" where tid= {}'.format(data,res[0][0])
            print(sql)
            cursor.execute(sql)
            # cursor.commit()
            request.session["issuing_count"]=0
            request.session["buying_count"]=0
            delete_all_items(request)
            return dashboard(request)
        else:
            return render(request,"404_search.html")
    # return HttpResponse("Hi")