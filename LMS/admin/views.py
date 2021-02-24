from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.db import connection
from django.contrib.auth import logout
import json
from datetime import datetime, timedelta,date

# Create your views here.

def admin_dashboard(request):
    with connection.cursor() as cursor:
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
        sql1="select req_id,bid,quantity,timestamp from request where status = '{}'".format(0)
        cursor.execute(sql1)
        result=cursor.fetchall()
        data["info"]=result
        today = date.today() 
        due = today - timedelta(days = 30)
        print(str(due))
    # return HttpResponse(count)
        cursor.execute("select t.tid,u.uid,t.started_at,u.email from transactions as t,users as u where t.uid=u.uid and t.type = {} and t.started_at between '{} 00:00:00' and '{} 23:59:59'".format(0,due,due))
        res=cursor.fetchall()
        data["today"]=res
        # return HttpResponse(res)

        # return HttpResponse(res)
        # return HttpResponse(res)
        # details_json=[len(res)]
        # for i in range(0,len(res)):
        #     print(i)
        #     details_json.append(eval(res[i][1]))
        #     print(details_json)
            # print(str(details_json[i]))
            # return HttpResponse(str(details_json[i]))

        # return HttpResponse(details_json)
        # if details_json["rdate"==today]:
        #     return HttpResponse("hi")

    print(data)
    return render(request,"admin/admin_dashboard.html",data)

def admin_profile(request):
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
        return render(request,"admin/admin_profile.html",admin)
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
            return redirect("/admin/admin_profile")
                
def admin_users(request):
    with connection.cursor() as cursor:
        cursor.execute("select * from users")
        result=cursor.fetchall()
        data={
            "uid" : result[0][0],
            "email": result[0][1],
            "password" : result[0][2],
            "balance" : result[0][3],
            "details" : result[0][4],            
        }
        data["table"]=result
        if request.method == 'POST':
            user_id=request.POST.get("user_id")
            user_email=request.POST.get("user_email")
            # user_delete=request.POST.get("")
            print(user_id,user_email)
            cursor.execute("insert into users(uid,email,roles) values({0},'{1}',{2})".format(user_id,user_email,2))
    return render(request,"admin/admin_users.html",data)

def admin_transactions(request):
    with connection.cursor() as cursor:
        cursor.execute("select * from transactions order by started_at DESC")
        result=cursor.fetchall()
        data={
            "tid" : result[0][0],
            "uid": result[0][1],
            "type" : result[0][2],
            "started_at" : result[0][3],
            "details" : result[0][4],            
        }
        data["table"]=result
    return render(request,"admin/admin_transactions.html",data)

def admin_books(request):
    with connection.cursor() as cursor:
        cursor.execute("select * from books")
        result=cursor.fetchall()
        data={
            "bid" : result[0][0],
            "book_name": result[0][1],
            "author" : result[0][2],
            "genre" : result[0][3],
            "cost" : result[0][4],            
            "quantity" : result[0][5],            
        }
        if request.method=='POST':
            book_id=request.POST.get("book_id")
            book_name=request.POST.get("book_name")
            author=request.POST.get("author")
            genre=request.POST.get("genre")
            cost=request.POST.get("cost")
            quantity=request.POST.get("quantity")
            # print(book_id,book_name,author,genre,cost,quantity)
            cursor.execute("insert into books(bid,book_name,author,genre,cost,quantity) values({0},'{1}','{2}','{3}',{4},{5})".format(book_id,book_name,author,genre,cost,quantity))
        data["table"]=result
    return render(request,"admin/admin_books.html",data)


def delete_user(request,id):
    with connection.cursor() as cursor:
        cursor.execute("delete from users where uid = {}".format(id))
    return redirect("/admin/admin_users")

def delete_book(request,id):
    # return HttpResponse(id)
    with connection.cursor() as cursor:
        cursor.execute("delete from books where bid = {}".format(id))
    return redirect("/admin/admin_books")

def delete_transaction(request,id):
    with connection.cursor() as cursor:
        cursor.execute("delete from transactions where tid = {}".format(id))
    return redirect("/admin/admin_transactions")

def request_admin(request):
    with connection.cursor() as cursor:
        if request.method == 'POST':
            accept = request.POST.get("accept")
            decline = request.POST.get("decline")
            arry = [accept,decline]
            if type(arry[0]) == str:
                print("accept")
                cursor.execute("update request set status = {0} where req_id = {1}".format(1,accept))
            elif type(arry[1]) == str:
                print("decline")
                cursor.execute("update request set status = {0} where req_id = {1}".format(2,decline))
    return redirect("/admin")

def add_book(request):
    with connection.cursor() as cursor:
        if request.method=='POST':
            bid=request.POST.get("bid")
            bname=request.POST.get("bname")
            author=request.POST.get("author")
            genre=request.POST.get("genre")
            cost=request.POST.get("cost")
            quantity=request.POST.get("quantity")
            # print(bid,bname,author,genre,cost,quantity)
            cursor.execute("insert into books values({},'{}','{}','{}',{},{})".format(bid,bname,author,genre,cost,quantity))
        return redirect("/admin")


def log_out(request):
    logout(request)
    return redirect('/')